class VirusModel {
  String title;
  List<String> widgets;
  String description;
  VirusModel({
    required this.title,
    required this.description,
    required this.widgets,
  });
  void changeState({
    required String? title,
    required List<String>? widgets,
    required String? description,
  }) {
    this.title = title!;
    this.description = description!;
    this.widgets = widgets!;
  }
}
