import 'dart:convert';

class RecapItem {
  String? imageLink;
  String? title;
  String? url;

  RecapItem({this.imageLink, this.title, this.url});

  factory RecapItem.fromMap(Map<String, dynamic> json) {
    return RecapItem(
        imageLink: json['imageLink'], title: json['title'], url: json['url']);
  }

  factory RecapItem.fromJson(String jsonStr) {
    Map<String, dynamic> jsonData = json.decode(jsonStr);
    return RecapItem.fromMap(jsonData);
  }

  Map<String, dynamic> toMap() {
    return {'imageLink': imageLink, 'title': title, 'url': url};
  }

  String toJson() {
    return json.encode(toMap());
  }

  @override
  String toString() {
    return 'RecapItem{imageLink: $imageLink, title: $title, url: $url}';
  }
}
