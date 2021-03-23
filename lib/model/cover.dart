class Cover {
  String feed;
  String detail;
  String blurred;
  String homepage;

  Cover({this.feed, this.detail, this.blurred, this.homepage});

  Cover.fromJson(dynamic json) {
    feed = json["feed"];
    detail = json["detail"];
    blurred = json["blurred"];
    homepage = json["homepage"];

  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["feed"] = feed;
    map["detail"] = detail;
    map["blurred"] = blurred;
    map["homepage"] = homepage;

    return map;
  }



}
