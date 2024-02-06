import 'dart:convert';

import 'package:gdg_algiers_events_app/models/album_item.dart';

class Album {
  List<AlbumItem>? albumItems;

  Album({this.albumItems});

  factory Album.fromMap(Map<String, dynamic> json) {
    return Album(
      albumItems: json['albumItems'] != null
          ? List<AlbumItem>.from(
              json['albumItems'].map((x) => AlbumItem.fromMap(x)))
          : null,
    );
  }

  factory Album.fromJson(String jsonStr) {
    Map<String, dynamic> jsonData = json.decode(jsonStr);
    return Album.fromMap(jsonData);
  }

  Map<String, dynamic> toMap() {
    return {
      'albumItems': albumItems != null
          ? albumItems!.map((x) => x.toMap()).toList()
          : null,
    };
  }

  String toJson() {
    return json.encode(toMap());
  }

  @override
  String toString() {
    return 'Album{albumItems: $albumItems}';
  }
}
