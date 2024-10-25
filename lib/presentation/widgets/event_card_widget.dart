import 'package:flutter/material.dart';

import '../../model/event.dart';
import '../../service/firebase_services.dart';
import '../screens/event_details_screen.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final FirestoreService firestoreService;

  const EventCard({
    super.key,
    required this.event,
    required this.firestoreService,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.event, color: Colors.indigo, size: 40),
        title: Text(
          event.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text('${event.location} • ${event.time}'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 20),
        onTap: () async {
          await firestoreService.addEventToSelected(event.id);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventDetailPage(event: event),
            ),
          );
        },
      ),
    );
  }
}
