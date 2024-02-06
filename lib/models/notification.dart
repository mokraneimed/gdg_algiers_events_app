import 'dart:convert';

class Notification {
  String? title;
  String? location;
  String? date;

  Notification({this.title, this.location, this.date});

  factory Notification.fromMap(Map<String, dynamic> json) {
    return Notification(
        title: json['title'], location: json['location'], date: json['date']);
  }

  factory Notification.fromJson(String jsonStr) {
    Map<String, dynamic> jsonData = json.decode(jsonStr);
    return Notification.fromMap(jsonData);
  }

  Map<String, dynamic> toMap() {
    return {"title": title, "location": location, "date": date};
  }

  String toJson() {
    return json.encode(toMap());
  }

  @override
  String toString() {
    return 'Notification{title: $title, location: $location, date: $date}';
  }
}
