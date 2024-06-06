import 'package:final_project/features/chat/data/repo/chat_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatProvider = Provider(
      (ref) => ChatRepository(),
);