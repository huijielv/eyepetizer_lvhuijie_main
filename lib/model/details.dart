class Detail{
  String dataType;
  int id;
  String title;
  String description;
  String library;
  List<Tags> tags;
  Consumption consumption;
  String resourceType;
  String slogan;
  Provider provider;
  String category;
  Author author;
  Cover cover;
  String playUrl;
  String thumbPlayUrl;
  int duration;
  WebUrl webUrl;
  int releaseTime;
  List<PlayInfo> playInfo;
  String campaign;
  String waterMarks;
  bool ad;
  List<Null> adTrack;
  String type;
  String titlePgc;
  String descriptionPgc;
  String remark;
  bool ifLimitVideo;
  int searchWeight;
  String brandWebsiteInfo;
  VideoPosterBean videoPosterBean;
  int idx;
  String shareAdTrack;
  String favoriteAdTrack;
  String webAdTrack;
  int date;
  String promotion;
  String label;

  String descriptionEditor;
  bool collected;
  bool reallyCollected;
  bool played;

  String lastViewTime;
  String playlists;
  String src;
  String recallSource;


  Detail(
      {this.dataType,
        this.id,
        this.title,
        this.description,
        this.library,
        this.tags,
        this.consumption,
        this.resourceType,
        this.slogan,
        this.provider,
        this.category,
        this.author,
        this.cover,
        this.playUrl,
        this.thumbPlayUrl,
        this.duration,
        this.webUrl,
        this.releaseTime,
        this.playInfo,
        this.campaign,
        this.waterMarks,
        this.ad,
        this.adTrack,
        this.type,
        this.titlePgc,
        this.descriptionPgc,
        this.remark,
        this.ifLimitVideo,
        this.searchWeight,
        this.brandWebsiteInfo,
        this.videoPosterBean,
        this.idx,
        this.shareAdTrack,
        this.favoriteAdTrack,
        this.webAdTrack,
        this.date,
        this.promotion,
        this.label,

        this.descriptionEditor,
        this.collected,
        this.reallyCollected,
        this.played,

        this.lastViewTime,
        this.playlists,
        this.src,
        this.recallSource,
        });

  Detail.fromJson(Map<String, dynamic> json) {
    dataType = json['dataType'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    library = json['library'];
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    consumption = json['consumption'] != null
        ? new Consumption.fromJson(json['consumption'])
        : null;
    resourceType = json['resourceType'];
    slogan = json['slogan'];
    provider = json['provider'] != null
        ? new Provider.fromJson(json['provider'])
        : null;
    category = json['category'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    cover = json['cover'] != null ? new Cover.fromJson(json['cover']) : null;
    playUrl = json['playUrl'];
    thumbPlayUrl = json['thumbPlayUrl'];
    duration = json['duration'];
    webUrl =
    json['webUrl'] != null ? new WebUrl.fromJson(json['webUrl']) : null;
    releaseTime = json['releaseTime'];
    if (json['playInfo'] != null) {
      playInfo = new List<PlayInfo>();
      json['playInfo'].forEach((v) {
        playInfo.add(new PlayInfo.fromJson(v));
      });
    }
    campaign = json['campaign'];
    waterMarks = json['waterMarks'];
    ad = json['ad'];

    type = json['type'];
    titlePgc = json['titlePgc'];
    descriptionPgc = json['descriptionPgc'];
    remark = json['remark'];
    ifLimitVideo = json['ifLimitVideo'];
    searchWeight = json['searchWeight'];
    brandWebsiteInfo = json['brandWebsiteInfo'];
    videoPosterBean = json['videoPosterBean'] != null
        ? new VideoPosterBean.fromJson(json['videoPosterBean'])
        : null;
    idx = json['idx'];
    shareAdTrack = json['shareAdTrack'];
    favoriteAdTrack = json['favoriteAdTrack'];
    webAdTrack = json['webAdTrack'];
    date = json['date'];
    promotion = json['promotion'];
    label = json['label'];

    descriptionEditor = json['descriptionEditor'];
    collected = json['collected'];
    reallyCollected = json['reallyCollected'];
    played = json['played'];

    lastViewTime = json['lastViewTime'];
    playlists = json['playlists'];
    src = json['src'];
    recallSource = json['recallSource'];
    recallSource = json['recall_source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dataType'] = this.dataType;
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['library'] = this.library;
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    if (this.consumption != null) {
      data['consumption'] = this.consumption.toJson();
    }
    data['resourceType'] = this.resourceType;
    data['slogan'] = this.slogan;
    if (this.provider != null) {
      data['provider'] = this.provider.toJson();
    }
    data['category'] = this.category;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    if (this.cover != null) {
      data['cover'] = this.cover.toJson();
    }
    data['playUrl'] = this.playUrl;
    data['thumbPlayUrl'] = this.thumbPlayUrl;
    data['duration'] = this.duration;
    if (this.webUrl != null) {
      data['webUrl'] = this.webUrl.toJson();
    }
    data['releaseTime'] = this.releaseTime;
    if (this.playInfo != null) {
      data['playInfo'] = this.playInfo.map((v) => v.toJson()).toList();
    }
    data['campaign'] = this.campaign;
    data['waterMarks'] = this.waterMarks;
    data['ad'] = this.ad;

    data['type'] = this.type;
    data['titlePgc'] = this.titlePgc;
    data['descriptionPgc'] = this.descriptionPgc;
    data['remark'] = this.remark;
    data['ifLimitVideo'] = this.ifLimitVideo;
    data['searchWeight'] = this.searchWeight;
    data['brandWebsiteInfo'] = this.brandWebsiteInfo;
    if (this.videoPosterBean != null) {
      data['videoPosterBean'] = this.videoPosterBean.toJson();
    }
    data['idx'] = this.idx;
    data['shareAdTrack'] = this.shareAdTrack;
    data['favoriteAdTrack'] = this.favoriteAdTrack;
    data['webAdTrack'] = this.webAdTrack;
    data['date'] = this.date;
    data['promotion'] = this.promotion;
    data['label'] = this.label;

    data['descriptionEditor'] = this.descriptionEditor;
    data['collected'] = this.collected;
    data['reallyCollected'] = this.reallyCollected;
    data['played'] = this.played;

    data['lastViewTime'] = this.lastViewTime;
    data['playlists'] = this.playlists;
    data['src'] = this.src;
    data['recallSource'] = this.recallSource;
    data['recall_source'] = this.recallSource;
    return data;
  }
}

class Tags {
  int id;
  String name;
  String actionUrl;
  String adTrack;
  String desc;
  String bgPicture;
  String headerImage;
  String tagRecType;
  String childTagList;
  String childTagIdList;
  bool haveReward;
  bool ifNewest;
  String newestEndTime;
  int communityIndex;

  Tags(
      {this.id,
        this.name,
        this.actionUrl,
        this.adTrack,
        this.desc,
        this.bgPicture,
        this.headerImage,
        this.tagRecType,
        this.childTagList,
        this.childTagIdList,
        this.haveReward,
        this.ifNewest,
        this.newestEndTime,
        this.communityIndex});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    actionUrl = json['actionUrl'];
    adTrack = json['adTrack'];
    desc = json['desc'];
    bgPicture = json['bgPicture'];
    headerImage = json['headerImage'];
    tagRecType = json['tagRecType'];
    childTagList = json['childTagList'];
    childTagIdList = json['childTagIdList'];
    haveReward = json['haveReward'];
    ifNewest = json['ifNewest'];
    newestEndTime = json['newestEndTime'];
    communityIndex = json['communityIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['actionUrl'] = this.actionUrl;
    data['adTrack'] = this.adTrack;
    data['desc'] = this.desc;
    data['bgPicture'] = this.bgPicture;
    data['headerImage'] = this.headerImage;
    data['tagRecType'] = this.tagRecType;
    data['childTagList'] = this.childTagList;
    data['childTagIdList'] = this.childTagIdList;
    data['haveReward'] = this.haveReward;
    data['ifNewest'] = this.ifNewest;
    data['newestEndTime'] = this.newestEndTime;
    data['communityIndex'] = this.communityIndex;
    return data;
  }
}

class Consumption {
  int collectionCount;
  int shareCount;
  int replyCount;
  int realCollectionCount;

  Consumption(
      {this.collectionCount,
        this.shareCount,
        this.replyCount,
        this.realCollectionCount});

  Consumption.fromJson(Map<String, dynamic> json) {
    collectionCount = json['collectionCount'];
    shareCount = json['shareCount'];
    replyCount = json['replyCount'];
    realCollectionCount = json['realCollectionCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collectionCount'] = this.collectionCount;
    data['shareCount'] = this.shareCount;
    data['replyCount'] = this.replyCount;
    data['realCollectionCount'] = this.realCollectionCount;
    return data;
  }
}

class Provider {
  String name;
  String alias;
  String icon;

  Provider({this.name, this.alias, this.icon});

  Provider.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alias = json['alias'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['alias'] = this.alias;
    data['icon'] = this.icon;
    return data;
  }
}

class Author {
  int id;
  String icon;
  String name;
  String description;
  String link;
  int latestReleaseTime;
  int videoNum;
  String adTrack;
  Follow follow;
  Shield shield;
  int approvedNotReadyVideoCount;
  bool ifPgc;
  int recSort;
  bool expert;

  Author(
      {this.id,
        this.icon,
        this.name,
        this.description,
        this.link,
        this.latestReleaseTime,
        this.videoNum,
        this.adTrack,
        this.follow,
        this.shield,
        this.approvedNotReadyVideoCount,
        this.ifPgc,
        this.recSort,
        this.expert});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    name = json['name'];
    description = json['description'];
    link = json['link'];
    latestReleaseTime = json['latestReleaseTime'];
    videoNum = json['videoNum'];
    adTrack = json['adTrack'];
    follow =
    json['follow'] != null ? new Follow.fromJson(json['follow']) : null;
    shield =
    json['shield'] != null ? new Shield.fromJson(json['shield']) : null;
    approvedNotReadyVideoCount = json['approvedNotReadyVideoCount'];
    ifPgc = json['ifPgc'];
    recSort = json['recSort'];
    expert = json['expert'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['name'] = this.name;
    data['description'] = this.description;
    data['link'] = this.link;
    data['latestReleaseTime'] = this.latestReleaseTime;
    data['videoNum'] = this.videoNum;
    data['adTrack'] = this.adTrack;
    if (this.follow != null) {
      data['follow'] = this.follow.toJson();
    }
    if (this.shield != null) {
      data['shield'] = this.shield.toJson();
    }
    data['approvedNotReadyVideoCount'] = this.approvedNotReadyVideoCount;
    data['ifPgc'] = this.ifPgc;
    data['recSort'] = this.recSort;
    data['expert'] = this.expert;
    return data;
  }
}

class Follow {
  String itemType;
  int itemId;
  bool followed;

  Follow({this.itemType, this.itemId, this.followed});

  Follow.fromJson(Map<String, dynamic> json) {
    itemType = json['itemType'];
    itemId = json['itemId'];
    followed = json['followed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemType'] = this.itemType;
    data['itemId'] = this.itemId;
    data['followed'] = this.followed;
    return data;
  }
}

class Shield {
  String itemType;
  int itemId;
  bool shielded;

  Shield({this.itemType, this.itemId, this.shielded});

  Shield.fromJson(Map<String, dynamic> json) {
    itemType = json['itemType'];
    itemId = json['itemId'];
    shielded = json['shielded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemType'] = this.itemType;
    data['itemId'] = this.itemId;
    data['shielded'] = this.shielded;
    return data;
  }
}

class Cover {
  String feed;
  String detail;
  String blurred;
  String sharing;
  String homepage;

  Cover({this.feed, this.detail, this.blurred, this.sharing, this.homepage});

  Cover.fromJson(Map<String, dynamic> json) {
    feed = json['feed'];
    detail = json['detail'];
    blurred = json['blurred'];
    sharing = json['sharing'];
    homepage = json['homepage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feed'] = this.feed;
    data['detail'] = this.detail;
    data['blurred'] = this.blurred;
    data['sharing'] = this.sharing;
    data['homepage'] = this.homepage;
    return data;
  }
}

class WebUrl {
  String raw;
  String forWeibo;

  WebUrl({this.raw, this.forWeibo});

  WebUrl.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    forWeibo = json['forWeibo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['forWeibo'] = this.forWeibo;
    return data;
  }
}

class PlayInfo {
  int height;
  int width;
  List<UrlList> urlList;
  String name;
  String type;
  String url;

  PlayInfo(
      {this.height, this.width, this.urlList, this.name, this.type, this.url});

  PlayInfo.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    width = json['width'];
    if (json['urlList'] != null) {
      urlList = new List<UrlList>();
      json['urlList'].forEach((v) {
        urlList.add(new UrlList.fromJson(v));
      });
    }
    name = json['name'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['width'] = this.width;
    if (this.urlList != null) {
      data['urlList'] = this.urlList.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}

class UrlList {
  String name;
  String url;
  int size;

  UrlList({this.name, this.url, this.size});

  UrlList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['size'] = this.size;
    return data;
  }
}

class VideoPosterBean {
  double scale;
  String url;
  String fileSizeStr;

  VideoPosterBean({this.scale, this.url, this.fileSizeStr});

  VideoPosterBean.fromJson(Map<String, dynamic> json) {
    scale = json['scale'];
    url = json['url'];
    fileSizeStr = json['fileSizeStr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scale'] = this.scale;
    data['url'] = this.url;
    data['fileSizeStr'] = this.fileSizeStr;
    return data;
  }
}