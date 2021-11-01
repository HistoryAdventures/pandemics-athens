class CharacterModelNotifier {
  String name;
  String bodyText;
  String image;
  int? flex;
  double? left;
  double? top;
  double? right;
  double? bottom;

  CharacterModelNotifier(
      {this.left,
      required this.name,
      required this.bodyText,
      required this.image,
      this.flex,
      this.bottom,
      this.right,
      this.top});

  void changeCaracterInfo(
      {required String name, required String image, required String bodyText}) {
    this.name = name;
    this.image = image;
    this.bodyText = bodyText;
  }
}
