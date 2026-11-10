import 'dart:typed_data';

import 'package:tasks/features/home/models/event_model.dart';

abstract class EventsRepository {
  Future<List<EventModel>> getEvents();

  Future<EventModel> addEvent(
    EventModel event, {
    Uint8List? imageBytes,
    String? imageName,
    String? imageMimeType,
  });

  Future<EventModel> updateEvent(
    EventModel event, {
    Uint8List? imageBytes,
    String? imageName,
    String? imageMimeType,
  });

  Future<void> deleteEvent(String id);
}
