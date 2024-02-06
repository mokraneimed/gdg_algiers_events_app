import 'dart:convert';

class Activitie {
  final String name;
  final String mainImageURL;
  final String speaker;
  final String comment;

  Activitie({
    required this.name,
    required this.mainImageURL,
    this.speaker = '',
    this.comment = '',
  });

  factory Activitie.fromMap(Map<String, dynamic> json) {
    return Activitie(
      name: json['name'],
      mainImageURL: json['mainImageURL'],
      speaker: json['speaker'],
      comment: json['comment'],
    );
  }

  factory Activitie.fromJson(String jsonStr) {
    Map<String, dynamic> jsonData = json.decode(jsonStr);
    return Activitie.fromMap(jsonData);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mainImageURL': mainImageURL,
      'speaker': speaker,
      'comment': comment,
    };
  }

  String toJson() {
    return json.encode(toMap());
  }

  @override
  String toString() {
    return 'Activitie{name: $name, mainImageURL: $mainImageURL, speaker: $speaker, comment: $comment}';
  }
}
