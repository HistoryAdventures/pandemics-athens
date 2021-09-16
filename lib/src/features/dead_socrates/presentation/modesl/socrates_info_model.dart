class SocratesInfoModel {
  String name;
  String image;
  String imageText;
  String description;

  SocratesInfoModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.imageText});

  void changeCaracterInfo(
      {required String name,
      required String image,
      required String description,
      required String imageText}) {
    this.name = name;
    this.image = image;
    this.description = description;
    this.imageText = imageText;
  }
}
