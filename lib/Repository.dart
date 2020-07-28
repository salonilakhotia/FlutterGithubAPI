class Repository {

  final String link ;
  final String name;
  final String description;
  final String language;
  final int star;

  Repository({this.description, this.link, this.name, this.language, this.star});

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      description: json['description'],
      link : json['html_url'],
      name : json['name'],
      language: json['language'],
      star: json['staredgazers_count'],
      
      );
  }
}