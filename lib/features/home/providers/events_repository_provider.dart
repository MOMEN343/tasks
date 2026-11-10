import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tasks/features/home/data/repositories/events_repository.dart';
import 'package:tasks/features/home/data/repositories/supabase_events_repository.dart';

final eventsRepositoryProvider = Provider<EventsRepository>((ref) {
  return SupabaseEventsRepository(Supabase.instance.client);
});
