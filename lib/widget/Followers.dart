class Followers {
  final String login;
  final String avatar_url;
  final String git_url; 
 
  Followers(
      {this.login, this.avatar_url, this.git_url});
 
  factory Followers.fromJson(Map<String, dynamic> json) {
    return Followers(
     login: json['login'],
     avatar_url : json['avatar_url'],
     git_url : json['url'],
    );
  }
}