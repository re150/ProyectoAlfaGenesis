class Profile{
  final int id;
  final String name;
  final String picture;

   Profile({
    required this.id,
    required this.name,
    required this.picture,
    }
  );

  String get getName => name;
  String get getPicture => picture;

}