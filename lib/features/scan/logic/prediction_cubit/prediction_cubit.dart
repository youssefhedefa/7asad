import 'dart:io';
import 'package:dio/dio.dart';
import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/features/scan/data/models/appointment_request.dart';
import 'package:final_project/features/scan/data/models/diseases_info.dart';
import 'package:final_project/features/scan/data/models/get_user_appointment.dart';
import 'package:final_project/features/scan/data/repo/prediction_repo.dart';
import 'package:final_project/features/scan/logic/prediction_cubit/prediction_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

class PredictionCubit extends Cubit<PredictionState> {
  PredictionRepo predictionRepo;

  PredictionCubit({required this.predictionRepo})
      : super(const PredictionState.initial());

  XFile? imageXFile;
  File? imageFile;
  String imageUrl = '';
  FormData? image;
  String? imageMimeType;

  List<User> consultants = [];
  List<UserAppointment> appointments = [];
  List<UserAppointment> appointmentsByDate = [];

  String date = '';
  String time = '';
  String consultantId = '';

  late DiseaseInfoModel diseaseModel;
  String predictionResult = '';

  Future<void> pickImagesFromGallery() async {
    final ImagePicker picker = ImagePicker();
    XFile? imageX = await picker.pickImage(source: ImageSource.gallery);
    if (imageX!.path.isNotEmpty) {
      imageXFile = imageX;
      imageFile = File(imageXFile!.path);
    }
    imageMimeType = mime(imageFile!.path);
    String name = imageMimeType!.split('/')[0];
    String type = imageMimeType!.split('/')[1];
    image = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        imageFile!.path,
        filename: imageFile!.path.split('/').last,
        contentType: MediaType(name, type),
      ),
    });
  }

  Future<void> pickImagesFromCamera() async {
    final ImagePicker picker = ImagePicker();
    XFile? imageX = await picker.pickImage(source: ImageSource.camera);
    if (imageX!.path.isNotEmpty) {
      imageXFile = imageX;
      imageFile = File(imageXFile!.path);
    }
    imageMimeType = mime(imageFile!.path);
    String name = imageMimeType!.split('/')[0];
    String type = imageMimeType!.split('/')[1];
    image = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        imageFile!.path,
        filename: imageFile!.path.split('/').last,
        contentType: MediaType(name, type),
      ),
    });
  }

  predict(FormData image) async {
    emit(const PredictionState.loading());
    final result = await predictionRepo.getPrediction(image);
    result.whenOrNull(
      success: (response) async {
        print(response.prediction);
        predictionResult = response.prediction!;
        fromatDiseaseData(disease: response.prediction!);
        print(diseaseModel.diseaseName + 'from cubit');
        emit(PredictionState.success(response));
      },
      failure: (error) {
        emit(PredictionState.error(error: error));
      },
    );
  }

  fromatDiseaseData({required String disease}) {
    for (int i = 0; i < DiseaseDataClassification.diseaseData.length; i++) {
      if (disease ==
          DiseaseDataClassification.diseaseData[i]['disease']) {
        print(DiseaseDataClassification.diseaseData[i]['nameInArabic']);
        diseaseModel = DiseaseInfoModel(
          image: imageXFile!,
          diseaseName: DiseaseDataClassification.diseaseData[i]['nameInArabic'],
          factors: DiseaseDataClassification.diseaseData[i]['factors'],
          description: DiseaseDataClassification.diseaseData[i]['description'],
          defaultCombat: DiseaseDataClassification.diseaseData[i]['defaultCombat'],
          chemicalCombat: DiseaseDataClassification.diseaseData[i]['chemicalCombat'],
        );
        break;
      }
      else{
        diseaseModel = DiseaseInfoModel(
            image: imageXFile!,
            diseaseName: 'No Disease Found',
            factors: 'No Disease Found',
            description: 'No Disease Found',
            defaultCombat: 'No Disease Found',
            chemicalCombat: 'No Disease Found',
        );
      }
    }
  }


  getAllConsultants() async {
    emit(const PredictionState.loadingConsultants());
    final result = await predictionRepo.getAllConsultants();
    result.whenOrNull(
      success: (response) {
        consultants = response.data!.users;
        emit(PredictionState.successConsultants(response));
      },
      failure: (error) {
        emit(PredictionState.error(error: error));
      },
    );
  }

  bookAppointment({required AppointmentRequest appointmentRequest}) async {
    emit(const PredictionState.loadingBookAppointment());
    final result = await predictionRepo.bookAppointment(
      appointmentRequest: appointmentRequest,
    );
    result.whenOrNull(
      success: (response) {
        emit(PredictionState.successBookAppointment(response));
      },
      failure: (error) {
        emit(PredictionState.error(error: error));
      },
    );
  }

  getUserAppointments() async {
    emit(const PredictionState.loadingUserAppointments());
    final result = await predictionRepo.getUserAppointments();
    result.whenOrNull(
      success: (response) {
        appointments = response.data!.appointments;
        emit(PredictionState.successUserAppointment(response));
      },
      failure: (error) {
        emit(PredictionState.error(error: error));
      },
    );
  }

  getAppointmentsByDate({required DateTime date}) {
    emit(const PredictionState.loadingUserAppointmentsByDate());
    appointmentsByDate = appointments
        .where(
          (element) =>
              element.date ==
              date,
        )
        .toList();
    emit(PredictionState.successUserAppointmentByDate(appointmentsByDate));
  }
}
