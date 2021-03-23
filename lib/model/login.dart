import 'member.dart';

class Login {
  int error;
  String msg;
  Member member;

  Login({this.error, this.msg, this.member});

  Login.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    member =
    json['member'] != null ? new Member.fromJson(json['member']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['msg'] = this.msg;
    if (this.member != null) {
      data['member'] = this.member.toJson();
    }
    return data;
  }
}
