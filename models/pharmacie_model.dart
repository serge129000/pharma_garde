// ignore_for_file: inference_failure_on_untyped_parameter, lines_longer_than_80_chars, avoid_dynamic_calls

class PharmacieModel {
  PharmacieModel({
    required this.id,
    required this.nom,
    required this.prefecture,
    required this.ville,
    required this.contact,
  });

  final String nom;
  final String prefecture;
  final String ville;
  final String contact;
  final int id;
  // ignore: sort_constructors_first
  factory PharmacieModel.fromJson(_) => PharmacieModel(
      id: int.parse(_['id'].toString()),
      nom: _['nom'].toString(),
      prefecture: _['prefecture_nom'].toString(),
      ville: _['ville'].toString(),
      contact: _['contact_1'].toString());
  Map<String, dynamic> toJson() => {
        'id': id,
        'nom': nom.trim(),
        'prefecture': prefecture.trim(),
        'ville': ville.trim(),
        'contact': contact.trim()
      };
  Map<String, dynamic> toShow() => {
        'nom': nom.trim(),
        'prefecture': prefecture.trim(),
        'ville': ville.trim(),
        'contact': contact.trim()
      };
}
