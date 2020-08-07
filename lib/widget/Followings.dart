class Followings {
  final String login;
  final String avatar_url;
  final String git_url; 
 
  Followings(
      {this.login, this.avatar_url, this.git_url});
 
  factory Followings.fromJson(Map<String, dynamic> json) {
    return Followings(
     login: json['login'],
     avatar_url : json['avatar_url'],
     git_url : json['url'],
    );
  }
}