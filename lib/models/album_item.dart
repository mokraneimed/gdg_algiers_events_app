import 'dart:convert';

class AlbumItem {
  final String urlImage;
  final String title;

  AlbumItem({this.urlImage = '', this.title = ''});

  factory AlbumItem.fromMap(Map<String, dynamic> json) {
    return AlbumItem(urlImage: json['urlImage'], title: json['title']);
  }

  factory AlbumItem.fromJson(String jsonStr) {
    Map<String, dynamic> jsonData = json.decode(jsonStr);
    return AlbumItem.fromMap(jsonData);
  }

  Map<String, dynamic> toMap() {
    return {'urlImage': urlImage, 'title': title};
  }

  String toJson() {
    return json.encode(toMap());
  }

  @override
  String toString() {
    return 'AlbumItem{urlImage: $urlImage, title: $title}';
  }
}
