import 'dart:convert';

import 'package:gdg_algiers_events_app/models/recap_item.dart';

class Recap {
  List<RecapItem>? recapItems;

  Recap({this.recapItems});

  factory Recap.fromMap(Map<String, dynamic> json) {
    return Recap(
      recapItems: json['recapItems'] != null
          ? List<RecapItem>.from(
              json['recapItems'].map((x) => RecapItem.fromMap(x)))
          : null,
    );
  }

  factory Recap.fromJson(String jsonStr) {
    Map<String, dynamic> jsonData = json.decode(jsonStr);
    return Recap.fromMap(jsonData);
  }

  Map<String, dynamic> toMap() {
    return {
      'recapItems': recapItems != null
          ? recapItems!.map((x) => x.toMap()).toList()
          : null,
    };
  }

  String toJson() {
    return json.encode(toMap());
  }

  @override
  String toString() {
    return 'Recap{recapItems: $recapItems}';
  }
}
