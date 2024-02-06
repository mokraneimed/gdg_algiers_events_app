import 'package:dio/dio.dart';

import 'package:gdg_algiers_events_app/logic/networking/dio_helper/dio_helper.dart';

import '../../../models/event.dart';

class EventApiClient {
  static Future<List<Event>> fetchEvents() async {
    try {
      final res = await DioHelper.getData(
        url: '/events/',
      );

      print(res.data);

      return res.data['data']
          .map<Event>((event) => Event.fromMap(event))
          .toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<List<Event>> fetchSearchedEvents(String searchQuery) async {
    try {
      final res = await DioHelper.getData(
        url: '/events/',
        query: {
          'searchQuery': searchQuery
        }, // Add the search query as a query parameter
      );

      print(res.data);

      return res.data['data']
          .map<Event>((event) => Event.fromMap(event))
          .toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
