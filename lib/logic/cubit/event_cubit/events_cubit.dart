import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/event.dart';
import '../../networking/event_domain/event_api.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(EventsInitial());

  FutureOr<void> getEvents() async {
    emit(EventsLoading());
    try {
      List<Event> events = await EventApiClient.fetchEvents();
      emit(EventsLoaded(eventsList: events));
    } catch (e) {
      emit(EventsError(message: e.toString()));
    }
  }
}
