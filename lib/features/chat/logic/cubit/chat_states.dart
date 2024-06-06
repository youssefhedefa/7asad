import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_states.freezed.dart';

@freezed

abstract class ChatState<T> with _$ChatState<T> {
  const factory ChatState.initial() = Initial;
  const factory ChatState.loadingChatsList() = LoadingChatsList;
  const factory ChatState.loadedChatsList(T chats) = LoadedChatsList;
  const factory ChatState.loadingChatBody() = LoadingChatBody;
  const factory ChatState.loadedChatBody(T messages) = LoadedChatBody;
  const factory ChatState.error(String message) = Error;
}
