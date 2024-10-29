class Alumno {
  final String id;
  final String name;
  final String imgUrl;
  final int grado;
  final int level;
  final int stars;
  final String grupo;
  bool teamStatus;

  Alumno({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.grado,
    required this.level,
    required this.stars,
    required this.grupo,
    required this.teamStatus,
  });

  void setTeamStatus(bool status) => teamStatus = status;
  

  // Método para crear una instancia de Alumno desde un mapa
  factory Alumno.fromMap(Map<String, dynamic> map) {
    return Alumno(
      id: map['id'],
      name: map['name'],
      imgUrl: map['imgUrl'],
      grado: map['grado'],
      level: map['level'],
      stars: map['stars'],
      grupo: map['grupo'],
      teamStatus: map['teamStatus'],
    );
  }
}