

class MapInfoModel {
  String image;
  String title;
  String text;
  String year;
  String? mapImage;
  String imageDescription;
  String lottie;

  MapInfoModel(
      {required this.image,
      required this.title,
      required this.text,
      this.mapImage,
      required this.imageDescription,
      required this.lottie,
      required this.year});
  Future<void> chandeState({
    required String? image,
    required String? text,
    required String? title,
    required String? imageDescription,
    required String? mapImage,
    required String? lottie,
  }) async {
    this.lottie = lottie!;
    this.title = title!;
    this.image = image!;
    this.imageDescription = imageDescription!;
    this.text = text!;
  }
}
