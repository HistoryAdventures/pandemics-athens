class BodyModel {
  String descriptiion;
  String image;
  String title;
  BodyModel({
    required this.title,
    required this.descriptiion,
    required this.image,
  });

  void chandeState({
    required String? title,
    required String? image,
    required String? descriptiion,
  }) {
    this.title = title!;
    this.image = image!;
    this.descriptiion = descriptiion!;
  }
}
