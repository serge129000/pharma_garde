// ignore_for_file: unused_local_variable, avoid_dynamic_calls, inference_failure_on_untyped_parameter

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../models/garde_model.dart';
import '../models/pharmacie_model.dart';

class AutoServices {
  static Future<void> setAllPharma() async {
    try {
      final headers = {
        'apiKey': 'lE3ivhi3YKtJmsXysghCxzR95nwrPRhc',
      };
      final request = http.MultipartRequest('POST',
          Uri.parse('https://api.kondjigbale.com/pharmacies/all_pharma'));
      request.fields.addAll({
        'access_token': 'YqbzM72mVI4hcqX4N1ebJIxmO9LrE',
        'c_identifiant': 'nUBjx7UCqk9ViHB8tXeVZThizQs6p7dU',
        'u_identifiant': 'iXZdGtMH3bjh3lRpC5xTyzOApawD9lTi',
        'device_id': 'HUAWEIVOG-L29',
        'device_name': 'VOG-L29',
        'latMember': '6.1743821',
        'longMember': '1.2272105',
      });

      request.headers.addAll(headers);

      final response = await request.send();
      if (response.statusCode != 200) {
        throw Exception("Une erreur s'est produite");
      }
      final jsonResponse = await response.stream.bytesToString();
      final data = jsonDecode(jsonResponse);
      final pharmas = data['information'];
      final allPharmas = pharmas['pharmas'];
      final gardes = pharmas['garde'];
      final gardeFilePath = join(current, 'garde.json');
      final pharmaFilePath = join(current, 'pharma.json');
      final gardeFile = await File(gardeFilePath).create();
      final pharmaFile = await File(pharmaFilePath).create();
      await gardeFile.writeAsString(jsonEncode(gardes));
      final allPharmacies =
          allPharmas.map((e) => PharmacieModel.fromJson(e).toJson()).toList();
      final garde = GardeModel.fromJson(gardes).toJson();
      await gardeFile.writeAsString(jsonEncode(garde));
      await pharmaFile.writeAsString(jsonEncode({'pharmas': allPharmacies}));
    } catch (e) {
      rethrow;
    }
  }
}
