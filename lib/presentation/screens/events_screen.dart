import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/events_provider.dart';
import '../../service/firebase_services.dart';
import '../widgets/event_card_widget.dart';

class EventListPage extends StatelessWidget {
  const EventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
    final firestoreService = FirestoreService(); // Create an instance

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Profit Task'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),

      body: RefreshIndicator(
        onRefresh: eventProvider.refreshEvents,
        child: eventProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : eventProvider.events.isEmpty
                ? const Center(child: Text('No events available'))
                : ListView.builder(
          shrinkWrap: true,
                    padding: const EdgeInsets.all(8.0),
                    itemCount: eventProvider.events.length,
                    itemBuilder: (context, index) {
                      final event = eventProvider.events[index];
                      return EventCard(
                        event: event,
                        firestoreService: firestoreService,
                      );
                    },
                  ),
      ),
    );
  }
}

