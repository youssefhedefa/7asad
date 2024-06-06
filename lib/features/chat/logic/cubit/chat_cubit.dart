import 'package:final_project/features/chat/data/repo/chat_repo.dart';
import 'package:final_project/features/chat/logic/cubit/chat_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository chatRepository;
//  final AuthCubit _authCubit;

  ChatCubit({
    required this.chatRepository,
  }) : super(const ChatState.initial());



}

