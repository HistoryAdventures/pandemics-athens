class CharacterModelNotifier {
  String? name;
  String? bodyText;
  String? image;

  CharacterModelNotifier({
    required this.name,
    required this.bodyText,
    required this.image,
  });

  void changeCaracterInfo({String? name, String? image, String? bodyText}) {
    this.name = name;
    this.image = image;
    this.bodyText = bodyText;
  }
}
