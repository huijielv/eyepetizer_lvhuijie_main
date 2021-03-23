

/// id : 0
/// title : ""
/// font : ""
/// subTitle : ""
/// subTitleFont : ""
/// textAlign : "left"
/// cover : ""
/// label : ""
/// actionUrl : ""
/// labelList : ""
/// rightText : ""
/// icon : ""
/// description : ""

class Header {
  int id;
  String title;
  String font;
  String subTitle;
  String subTitleFont;
  String textAlign;
  String cover;
  String label;
  String actionUrl;
  String labelList;
  String rightText;
  String icon;
  String description;

  Header({
    this.id,
    this.title,
    this.font,
    this.subTitle,
    this.subTitleFont,
    this.textAlign,
    this.cover,
    this.label,
    this.actionUrl,
    this.labelList,
    this.rightText,
    this.icon,
    this.description});

  Header.fromJson(dynamic json) {
    id = json["id"];
    title = json["title"];
    font = json["font"];
    subTitle = json["subTitle"];
    subTitleFont = json["subTitleFont"];
    textAlign = json["textAlign"];
    cover = json["cover"];
    label = json["label"];
    actionUrl = json["actionUrl"];
    labelList = json["labelList"];
    rightText = json["rightText"];
    icon = json["icon"];
    description = json["description"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["title"] = title;
    map["font"] = font;
    map["subTitle"] = subTitle;
    map["subTitleFont"] = subTitleFont;
    map["textAlign"] = textAlign;
    map["cover"] = cover;
    map["label"] = label;
    map["actionUrl"] = actionUrl;
    map["labelList"] = labelList;
    map["rightText"] = rightText;
    map["icon"] = icon;
    map["description"] = description;
    return map;
  }

}