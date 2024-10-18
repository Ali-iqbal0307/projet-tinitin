class Album {
  final int numero;
  final String titre;
  final String parution;
  final String image;
  final String parutionEnCouleur;
  final String resume;
  final String lieu;
  final String gps;

  Album({
    required this.numero,
    required this.titre,
    required this.parution,
    required this.image,
    required this.parutionEnCouleur,
    required this.resume,
    required this.lieu,
    required this.gps,
  });

  
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      numero: json['numero'],
      titre: json['titre'],
      parution: json['parution'],
      image: json['image'],
      parutionEnCouleur: json['parutionEnCouleur'],
      resume: json['resume'],
      lieu: json['lieu'],
      gps: json['gps'],
    );
  }

  get id => null;

  
  Map<String, dynamic> toJson() {
    return {
      'numero': numero,
      'titre': titre,
      'parution': parution,
      'image': image,
      'parutionEnCouleur': parutionEnCouleur,
      'resume': resume,
      'lieu': lieu,
      'gps': gps,
    };
  }

  @override
  String toString() {
    return 'Album { numero: $numero, titre: $titre, parution: $parution, image: $image }';
  }
}
