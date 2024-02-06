import '../../../models/event.dart';

abstract class EventsSearchedState {}

class EventsSearchedInitial extends EventsSearchedState {}

class EventsSearchedLoading extends EventsSearchedState {}

class EventsSearchedLoaded extends EventsSearchedState {
  final List<Event> eventsList;

  EventsSearchedLoaded({
    required this.eventsList,
  });
}

class EventsSearchedError extends EventsSearchedState {
  final String message;

  EventsSearchedError({
    required this.message,
  });
}
