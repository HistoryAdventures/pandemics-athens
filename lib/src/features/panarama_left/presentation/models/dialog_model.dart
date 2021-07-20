class InfoDialogModel {
  double latitude;
  double longitude;
  double height;
  double width;
  String title;
  String image;
  String description;
  String imageDescription;

  InfoDialogModel(
      {required this.latitude,
      required this.longitude,
      required this.height,
      required this.image,
      required this.imageDescription,
      required this.description,
      required this.title,
      required this.width});
}
