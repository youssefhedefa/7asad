import 'dart:async';
import 'dart:io';
import 'package:final_project/features/chat/data/models/voice_note_recorder.dart';
import 'package:final_project/features/chat/logic/controller/audio_recorder/audio_recorder_file_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path/path.dart' as path;

class AudioRecorderController{
  final AudioRecorderFileHelper _audioRecorderFileHelper;
  final Function(String message) onError;
  AudioRecorderController(this._audioRecorderFileHelper, this.onError);

  //CONTROLLERS
  final StreamController<int> _recordDurationController = StreamController<int>.broadcast()..add(0);

  //SINK
  Sink<int> get recordDurationInput => _recordDurationController.sink;

  //STREAMS
  Stream<double> get amplitudeStream => _audioRecorder
      .onAmplitudeChanged(const Duration(milliseconds: 160)).map((amp) => amp.current);
  Stream<RecordState> get recordStateStream => _audioRecorder.onStateChanged();

  Stream<int> get recordDurationOutput => _recordDurationController.stream;

  //VARIABLES
  final AudioRecorder _audioRecorder = AudioRecorder();
  Timer? _timer;
  int _recordDuration = 0;

  void _startTimer(){
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      _recordDuration++;
      recordDurationInput.add(_recordDuration);
    });
  }

  bool isOpen = false;
  bool openMic(){
    isOpen = true;
    return isOpen;
  }
  bool closeMic(){
    isOpen = false;
    return isOpen;
  }

  //METHODS
  Future<void> start() async{
    final isMicPermissionGranted = await _checkMicPermissions();

    if(!isMicPermissionGranted){
      onError("Could not grant mic permission");
      return;
    }

    try{
      final filePath = path.join(
          (await _audioRecorderFileHelper.getRecordsDirectory).path,
          "${DateTime.now().millisecondsSinceEpoch}.m4a"
      );

      await _audioRecorder.start(
          const RecordConfig(),
          path: filePath
      );

      _startTimer();
    }catch(e){
      onError("Could not start the record");
    }
  }

  void resume(){
    _startTimer();
    _audioRecorder.resume();
  }

  Future<void> pause() async{
    _timer?.cancel();
    await _audioRecorder.pause();
  }

  void stop(Function(VoiceNoteModel? voiceNoteModel) onStop) async{
    final recordPath = await _audioRecorder.stop();
    if (recordPath != null){
      onStop(
          VoiceNoteModel(
              name: path.basename(recordPath),
              createAt: DateTime.now().subtract(Duration(seconds: _recordDuration)),
              path: recordPath
          )
      );
    }else{
      onStop(null);
      onError("Could not stop the record");
    }

  }

  Future<void> delete(String filePath) async{
    await pause();
    try{
      await _audioRecorderFileHelper.deleteRecord(filePath);
    }catch(e){
      onError("Could not delete the record : $e");
    }
  }

  void dispose(){
    _recordDurationController.close();
    _timer?.cancel();
    _timer = null;
    _audioRecorder.dispose();
  }

  Future<bool> _checkMicPermissions() async{
    const micPermission = Permission.microphone;

    if (await micPermission.isGranted){
      return true;
    }else{
      final permissionStatus = await micPermission.request();

      if(permissionStatus.isGranted || permissionStatus.isLimited){
        return true;
      }else{
        return false;
      }
    }
  }


  //----------------- audio player -----------------

  final AudioPlayer _audioPlayer = AudioPlayer();

  Stream<int> get progressStream => _audioPlayer.positionStream.map((progress) {
    final currentProgress = progress.inMilliseconds;
    if(currentProgress == durationInMill){
      _audioPlayer.pause();
      _audioPlayer.seek(Duration.zero);
    }

    return currentProgress;
  });

  int get durationInMill => _audioPlayer.duration?.inMilliseconds ?? 0;
  Stream<bool> get playStatusStream => _audioPlayer.playingStream;

  Future<void> loadAudio(String filePath) async{
    await _audioPlayer.setFilePath(filePath);
    await _audioPlayer.load();
    _audioPlayer.play();
  }

  void play() async {
    _audioPlayer.play();
  }

  void pausePlaying() async {
    _audioPlayer.pause();
  }

  void seek(int durationInMill) {
    _audioPlayer.seek(Duration(milliseconds: durationInMill));
  }

  void disposePlaying() async{
    await _audioPlayer.stop();
    _audioPlayer.dispose();
  }

  // create method to load audio file from its path
  Future<void> loadAudioFile(String filePath) async {
    await _audioPlayer.setFilePath(filePath);
    await _audioPlayer.load();
  }

  //create method to get the audio file from its path
  Future<File> getAudioFilePath(String fileName) async {
    final audioFile = File(fileName);
    print(" file uri ${audioFile.uri}");
    return audioFile;
  }

}