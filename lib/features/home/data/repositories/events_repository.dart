import 'package:tasks/features/home/models/event_model.dart';

abstract class EventsRepository {
  Future<List<EventModel>> getEvents();
  Future<EventModel> addEvent(EventModel event);
  Future<EventModel> updateEvent(EventModel event);
  Future<void> deleteEvent(String id);
}
