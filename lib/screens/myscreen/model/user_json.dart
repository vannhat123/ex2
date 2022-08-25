class UserJson {
  String? artistName;
  int? albumCount;
  int? songCount;
  String? avatar;
  String? image;

  UserJson(
      {this.artistName,
        this.albumCount,
        this.songCount,
        this.avatar,
        this.image,
       });

  UserJson.fromJson(Map<String, dynamic> json) {
    artistName = json['artistName'];
    albumCount = json['albumCount'];
    songCount = json['songCount'];
    avatar = json['avatar'];
    image = json['image'];
  }
}
