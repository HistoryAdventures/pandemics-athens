class DocumentModel {
  String? name;
  String? text;
  double? top;
  double? left;

  DocumentModel(
      {required this.name,
      required this.text,
      required this.left,
      required this.top});
  void chandeState(String? selctedItem, String? textDescription) {
    name = selctedItem;
    text = textDescription;
  }
}
