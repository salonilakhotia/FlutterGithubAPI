class Followers {
  final String login;
 
  Followers(
      {this.login});
 
  factory Followers.fromJson(Map<String, dynamic> json) {
    return Followers(
     login: json['login']
    );
  }
}