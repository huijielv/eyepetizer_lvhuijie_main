class Devices {
  int id;
  String udid;

  Devices({this.id, this.udid});

  Devices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    udid = json['udid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['udid'] = this.udid;
    return data;
  }
}