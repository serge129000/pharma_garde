import 'package:dart_frog/dart_frog.dart';

import '../services/pharma_services.dart';

Future<Response> onRequest(RequestContext requestContext) async {
  final data = await PharmaServices.getAllPharma();
  return Response.json(body: data);
}
