import 'package:flutter/material.dart';
import 'package:tasks/features/home/models/event_model.dart';

List<EventModel> getCurrentEvents(List<EventModel> events) {
  final today = DateUtils.dateOnly(DateTime.now());

  return events.where((event) {
    return !DateUtils.dateOnly(event.date).isBefore(today);
  }).toList();
}

List<EventModel> getPreviousEvents(List<EventModel> events) {
  final today = DateUtils.dateOnly(DateTime.now());

  return events.where((event) {
    return DateUtils.dateOnly(event.date).isBefore(today);
  }).toList();
}
