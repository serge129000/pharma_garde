// ignore_for_file: avoid_dynamic_calls

import 'package:dart_frog/dart_frog.dart';

import '../services/pharma_services.dart';

Future<Response> onRequest(RequestContext requestContext) async {
  final gardeData = await PharmaServices.getAllGarde();
  final gardes = gardeData['pharmas'] as List;
  final pharmaData = await PharmaServices.getAllPharma();
  final pharmas = pharmaData['pharmas'] as List;
  //print(gardeData);
  final d =
      pharmas.where((element) => gardes.contains(element['id'].toString())).toList();
  return Response.json(body: d);
}
