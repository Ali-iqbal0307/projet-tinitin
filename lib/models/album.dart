import 'gps.dart';

class Album {
  final String title;
  final int numero;
  final int year;
  final int? yearInColor;
  final String image;
  final String resume;
  final GPS gps;
  final String location;

  Album({
    required this.title,
    required this.numero,
    required this.year,
    this.yearInColor,
    required this.image,
    required this.resume,
    required this.gps,
    required this.location,
  });

  @override
  String toString() {
    return 'Album: $title, numéro: $numero, année: $year';
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'numero': numero,
      'year': year,
      'yearInColor': yearInColor,
      'image': image,
      'resume': resume,
      'gps': {'latitude': gps.latitude, 'longitude': gps.longitude},
      'location': location,
    };
  }
}
