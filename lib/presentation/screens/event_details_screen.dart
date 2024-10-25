import 'package:flutter/material.dart';
import '../../model/event.dart';

class EventDetailPage extends StatelessWidget {
  final Event event;

  const EventDetailPage({Key? key, required this.event}) : super(key: key);

  void _showJoinConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text('Join Event 🎉'),
          content: Text(
            'You have successfully joined "${event.name}"!',
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              child: const Text('OK', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Name with Icon
            Row(
              children: [
                const Icon(Icons.event, size: 28, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  event.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Location Section
            Row(
              children: [
                const Icon(Icons.location_on,
                    color: Colors.redAccent, size: 24),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    event.location,
                    style: const TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Time Section
            Row(
              children: [
                const Icon(Icons.access_time, color: Colors.green, size: 24),
                const SizedBox(width: 8),
                Text(
                  event.time,
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Event Description with Divider
            const Divider(thickness: 1, color: Colors.grey),
            const SizedBox(height: 8),
            const Text(
              'Event Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),

            const SizedBox(height: 24),

            // Join Event Button with Rounded Corners
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _showJoinConfirmation(context),
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Join Event'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
