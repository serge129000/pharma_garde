// ignore_for_file: unused_local_variable, avoid_dynamic_calls

import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';

class PharmaServices {
  static Future<dynamic> getAllPharma() async {
    try {
      final pharmaFilePath = join(current, 'pharma.json');
      final pharmaFile = File(pharmaFilePath);
      final pharmaData = pharmaFile.readAsStringSync();
      final decodedData = jsonDecode(pharmaData);
      return decodedData;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> getAllGarde() async {
    try {
      final gardeFilePath = join(current, 'garde.json');
      final gardeFile = File(gardeFilePath);
      final gardeData = gardeFile.readAsStringSync();
      final decodedData = jsonDecode(gardeData);
      final pharmasIds = decodedData['pharmas'];
      return decodedData;
    } catch (e) {
      rethrow;
    }
  }
}
