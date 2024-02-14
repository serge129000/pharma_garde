// ignore_for_file: inference_failure_on_untyped_parameter, sort_constructors_first

import 'dart:convert';

class GardeModel {
  GardeModel({required this.pharmas, required this.debut, required this.end});
  final String pharmas;
  final String debut;
  final String end;

  factory GardeModel.fromJson(_) => GardeModel(
      pharmas: _['pharmacie_ids'].toString(),
      debut: _['date_debut'].toString(),
      end: _['date_fin'].toString());

  Map<String, dynamic> toJson() => {
    'debut': debut,
    'end': end,
    'pharmas': jsonDecode(pharmas)
  };
}
