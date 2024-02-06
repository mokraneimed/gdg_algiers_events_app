import 'dart:convert';

import 'package:gdg_algiers_events_app/models/activitie.dart';

class Event {
  final String? id;
  final String? name;
  final String? coverPhoto;
  final String? description;
  final String? location;
  final String? date;
  final String? host;
  final int? ratings;
  final bool? isLiked; //likes
  final Map<String, List<Activitie>>? details; //conf, activities, workshops

  Event({
    this.id,
    this.name,
    this.coverPhoto,
    this.description,
    this.location,
    this.date,
    this.ratings,
    this.isLiked,
    this.details,
    this.host,
  });

  factory Event.fromMap(Map<String, dynamic> json) {
    final Map<String, List<Activitie>>? details = json['details'] != null
        ? (json['details'] as Map<String, dynamic>).map((key, value) {
            final List<Activitie> activitieList = (value as List<dynamic>)
                .map((activity) => Activitie.fromMap(activity))
                .toList();
            return MapEntry<String, List<Activitie>>(key, activitieList);
          })
        : null;
    return Event(
      id: json['_id'],
      name: json['eventName'],
      coverPhoto: json['coverPhoto'],
      description: json['description'],
      location: json['location'],
      date: json['date'],
      ratings: json['ratings'],
      isLiked: json['isLiked'],
      host: json["host"],
      details: details, //conf, activities, workshops
    );
  }

  factory Event.fromJson(String jsonStr) {
    Map<String, dynamic> jsonData = json.decode(jsonStr);
    return Event.fromMap(jsonData);
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'eventName': name,
      'coverPhoto': coverPhoto,
      'description': description,
      'location': location,
      'date': date,
      'ratings': ratings,
      'isLiked': isLiked,
      'host': host,
      'details': details != null
          ? details!.map((key, value) => MapEntry(
              key, value.map((activitie) => activitie.toMap()).toList()))
          : null,
    };
  }

  String toJson() {
    return json.encode(toMap());
  }

  @override
  String toString() {
    return 'Event{id: $id, name: $name, mainImageURL: $coverPhoto, description: $description, location: $location, date: $date, ratings: $ratings, isLiked: $isLiked, details: $details}';
  }
}
