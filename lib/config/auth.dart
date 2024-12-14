import 'package:tugas__vania/app/models/customers.dart';

Map<String, dynamic> authConfig = {
  'guards': {
    'default': {
      'provider': Customers(),
    },
  }
};