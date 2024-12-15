import 'package:tugas__vania/config/auth.dart';
import 'package:vania/vania.dart';
import 'package:tugas__vania/app/providers/route_service_provider.dart';

import 'cors.dart';

Map<String, dynamic> config = {
  'name': env('APP_NAME'),
  'url': env('APP_URL'),
  'cors': cors,
  'auth': authConfig,
  'providers': <ServiceProvider>[
    RouteServiceProvider(),
  ],
};
