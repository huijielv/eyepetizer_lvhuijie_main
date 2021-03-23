



import 'header.dart';
import 'label.dart';

/// dataType : "Banner"
/// id : 2326
/// title : "mini杂志"
/// description : ""
/// image : "http://img.kaiyanapp.com/5abd51b35e6f0cfb9c00b9b9417c703d.jpeg?imageMogr2/quality/60/format/jpg"
/// actionUrl : "eyepetizer://webview/?title=&url=https%3A%2F%2Fh5.eyepetizer.net%2Fv1%2Fad%2Fmini-magazine"
/// adTrack : []
/// shade : false
/// label : {"text":"","card":"","detail":""}
/// labelList : []
/// header : {"id":0,"title":"","font":"","subTitle":"","subTitleFont":"","textAlign":"left","cover":"","label":"","actionUrl":"","labelList":"","rightText":"","icon":"","description":""}
/// autoPlay : false

class Data {
  String dataType;
  int id;
  String title;
  String description;
  String image;
  String actionUrl;
  bool shade;
  Label label;
  Header header;
  bool autoPlay;

  Data({
    this.dataType,
    this.id,
    this.title,
    this.description,
    this.image,
    this.actionUrl,
    this.shade,
    this.label,
    this.header,
    this.autoPlay});

  Data.fromJson(dynamic json) {
    dataType = json["dataType"];
    id = json["id"];
    title = json["title"];
    description = json["description"];
    image = json["image"];
    actionUrl = json["actionUrl"];

    header = json["header"] != null ? Header.fromJson(json["header"]) : null;
    autoPlay = json["autoPlay"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["dataType"] = dataType;
    map["id"] = id;
    map["title"] = title;
    map["description"] = description;
    map["image"] = image;
    map["actionUrl"] = actionUrl;

    map["shade"] = shade;
    if (label != null) {
      map["label"] = label.toJson();
    }

    if (header != null) {
      map["header"] = header.toJson();
    }
    map["autoPlay"] = autoPlay;
    return map;
  }

}