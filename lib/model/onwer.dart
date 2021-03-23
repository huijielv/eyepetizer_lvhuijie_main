class Onwer {
  int uid;
  String nickname;
  String avatar;
  String userType;
  bool ifPgc;
  String description;
  String gender;
  int registDate;
  int releaseDate;
  String cover;
  String actionUrl;
  bool followed;
  bool limitVideoOpen;
  String library;
  int birthday;

  String city;
  String university;
  String job;
  bool expert;

  Onwer(
      {this.uid,
        this.nickname,
        this.avatar,
        this.userType,
        this.ifPgc,
        this.description,
        this.gender,
        this.registDate,
        this.releaseDate,
        this.cover,
        this.actionUrl,
        this.followed,
        this.limitVideoOpen,
        this.library,
        this.birthday,
        this.city,
        this.university,
        this.job,
        this.expert});

  Onwer.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    nickname = json['nickname'];
    avatar = json['avatar'];
    userType = json['userType'];
    ifPgc = json['ifPgc'];
    description = json['description'];
    gender = json['gender'];
    registDate = json['registDate'];
    releaseDate = json['releaseDate'];
    cover = json['cover'];
    actionUrl = json['actionUrl'];
    followed = json['followed'];
    limitVideoOpen = json['limitVideoOpen'];
    library = json['library'];
    birthday = json['birthday'];
    city = json['city'];
    university = json['university'];
    job = json['job'];
    expert = json['expert'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['nickname'] = this.nickname;
    data['avatar'] = this.avatar;
    data['userType'] = this.userType;
    data['ifPgc'] = this.ifPgc;
    data['description'] = this.description;
    data['gender'] = this.gender;
    data['registDate'] = this.registDate;
    data['releaseDate'] = this.releaseDate;
    data['cover'] = this.cover;
    data['actionUrl'] = this.actionUrl;
    data['followed'] = this.followed;
    data['limitVideoOpen'] = this.limitVideoOpen;
    data['library'] = this.library;
    data['birthday'] = this.birthday;
    data['city'] = this.city;
    data['university'] = this.university;
    data['job'] = this.job;
    data['expert'] = this.expert;
    return data;
  }
}