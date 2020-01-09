

class Noticia {

  String title;
  String description;
  String url;
  String urlImage;
  String author;

  Noticia({this.title, this.description, this.url, this.urlImage, this.author});

  factory Noticia.fromJson(Map<String, dynamic> json){
    return Noticia(
      title: json["title"],
      description: json["description"],
      url: json["url"],
      urlImage: json["urlToImage"],
      author: json["author"]
    );
  }

}