class MapInfoModel {
  String image;
  String title;
  String text;
  String year;
  String mapImage;
  String imageDescription;

  MapInfoModel(
      {required this.image,
      required this.title,
      required this.text,
      required this.mapImage,
      required this.imageDescription,
      required this.year});
  void chandeState({
    required String? image,
    required String? text,
    required String? title,
    required String? imageDescription,
    required String? mapImage,
  }) {
    this.mapImage = mapImage!;
    this.title = title!;
    this.image = image!;
    this.imageDescription = imageDescription!;
    this.text = text!;
  }
}
