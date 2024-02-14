import 'package:dart_frog/dart_frog.dart';

import '../services/auto_services.dart';
Future<Response> onRequest(RequestContext requestContext) async {
  await AutoServices.setAllPharma();
  return Response.json(body: []);
}
