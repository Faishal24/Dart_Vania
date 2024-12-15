import 'package:tugas__vania/app/models/users.dart';

Map<String, dynamic> authConfig = {
  'guards': {
    'default': {
      'provider': Users(),
    },
  }
};