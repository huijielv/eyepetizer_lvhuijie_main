

import 'data.dart';

/// data : {"dataType":"Banner","id":2326,"title":"mini杂志","description":"","image":"http://img.kaiyanapp.com/5abd51b35e6f0cfb9c00b9b9417c703d.jpeg?imageMogr2/quality/60/format/jpg","actionUrl":"eyepetizer://webview/?title=&url=https%3A%2F%2Fh5.eyepetizer.net%2Fv1%2Fad%2Fmini-magazine","adTrack":[],"shade":false,"label":{"text":"","card":"","detail":""},"labelList":[],"header":{"id":0,"title":"","font":"","subTitle":"","subTitleFont":"","textAlign":"left","cover":"","label":"","actionUrl":"","labelList":"","rightText":"","icon":"","description":""},"autoPlay":false}


class ItemList {
  String type;

  Data data;
  String trackingData;
  String tag;
  int id;
  int adIndex;

  ItemList({
    this.type,
    this.data,
    this.trackingData,
    this.tag,
    this.id,
    this.adIndex});

  ItemList.fromJson(dynamic json) {
    type = json["type"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
    trackingData = json["trackingData"];
    tag = json["tag"];
    id = json["id"];
    adIndex = json["adIndex"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = type;
    if (data != null) {
      map["data"] = data.toJson();
    }
    map["trackingData"] = trackingData;
    map["tag"] = tag;
    map["id"] = id;
    map["adIndex"] = adIndex;
    return map;
  }

}
