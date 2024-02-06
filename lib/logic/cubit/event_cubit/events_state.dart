part of 'events_cubit.dart';

@immutable
abstract class EventsState {}

class EventsInitial extends EventsState {}

class EventsLoading extends EventsState {}

class EventsLoaded extends EventsState {
  final List<Event> eventsList;

  EventsLoaded({
    required this.eventsList,
  });
}

class EventsError extends EventsState {
  final String message;

  EventsError({
    required this.message,
  });
}
