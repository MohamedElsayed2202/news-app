class Source {
  String? id;
  String? name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}

class NewsArticle {
  String? author;
  String? title;
  String? description;
  String? urlToImage;
  String? content;
  String? publishedAt;
  Source? source;
  String? url;

  NewsArticle(
      {required this.author,
      required this.title,
      required this.description,
      required this.urlToImage,
      required this.content,
      required this.publishedAt,
      required this.source,required this.url});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
        author: json['author'],
        title: json['title'],
        description: json['description'],
        urlToImage: json['urlToImage'],
        content: json['content'],
        publishedAt: json['publishedAt'],
        url: json['url'],
        source: Source.fromJson(json['source']));
  }
}
