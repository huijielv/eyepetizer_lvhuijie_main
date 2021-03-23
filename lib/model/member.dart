import 'devices.dart';

class Member {
  int uid;
  String nick;
  String avatar;
  String username;
  String telephone;
  bool emailValidated;
  bool telephoneValidated;

  List<Devices> devices;
  List<String> roles;
  String registerSource;
  bool needUpdatePassword;
  bool trusted;
  bool complete;
  bool enabled;
  int registDate;
  int bindStatus;

  Member({this.uid,
    this.nick,
    this.avatar,
    this.username,
    this.telephone,
    this.emailValidated,
    this.telephoneValidated,
    this.devices,
    this.roles,
    this.registerSource,
    this.needUpdatePassword,
    this.trusted,
    this.complete,
    this.enabled,
    this.registDate,
    this.bindStatus});

  Member.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    nick = json['nick'];
    avatar = json['avatar'];
    username = json['username'];
    telephone = json['telephone'];
    emailValidated = json['emailValidated'];
    telephoneValidated = json['telephoneValidated'];

    if (json['devices'] != null) {
      devices = new List<Devices>();
      json['devices'].forEach((v) {
        devices.add(new Devices.fromJson(v));
      });
    }
    roles = json['roles'].cast<String>();
    registerSource = json['registerSource'];
    needUpdatePassword = json['needUpdatePassword'];
    trusted = json['trusted'];
    complete = json['complete'];
    enabled = json['enabled'];
    registDate = json['registDate'];
    bindStatus = json['bindStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['nick'] = this.nick;
    data['avatar'] = this.avatar;
    data['username'] = this.username;
    data['telephone'] = this.telephone;
    data['emailValidated'] = this.emailValidated;
    data['telephoneValidated'] = this.telephoneValidated;

    if (this.devices != null) {
      data['devices'] = this.devices.map((v) => v.toJson()).toList();
    }
    data['roles'] = this.roles;
    data['registerSource'] = this.registerSource;
    data['needUpdatePassword'] = this.needUpdatePassword;
    data['trusted'] = this.trusted;
    data['complete'] = this.complete;
    data['enabled'] = this.enabled;
    data['registDate'] = this.registDate;
    data['bindStatus'] = this.bindStatus;
    return data;
  }
}