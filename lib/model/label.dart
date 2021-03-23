

class Label {
  String text;
  String card;
  String detail;

  Label({
    this.text,
    this.card,
    this.detail});

  Label.fromJson(dynamic json) {
    text = json["text"];
    card = json["card"];
    detail = json["detail"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["text"] = text;
    map["card"] = card;
    map["detail"] = detail;
    return map;
  }
}