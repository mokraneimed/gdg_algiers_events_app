import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../models/event.dart';
import '../../networking/event_domain/event_api.dart';

import 'events_searched_state.dart';

class EventsSearchedCubit extends Cubit<EventsSearchedState> {
  EventsSearchedCubit() : super(EventsSearchedInitial());

  FutureOr<void> searchEvents(String searchQuery) async {
    if (searchQuery.isNotEmpty) {
      emit(EventsSearchedLoading());
      try {
        List<Event> searchResults =
            await EventApiClient.fetchSearchedEvents(searchQuery);
        emit(EventsSearchedLoaded(eventsList: searchResults));
      } catch (e) {
        emit(EventsSearchedError(message: e.toString()));
      }
    } else {
      emit(EventsSearchedInitial());
    }
  }
}
