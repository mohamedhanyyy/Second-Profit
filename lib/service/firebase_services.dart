import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../model/event.dart';

class FirestoreService {
  final CollectionReference eventsCollection =
      FirebaseFirestore.instance.collection('userEvents');
  final CollectionReference selectedEventsCollection =
      FirebaseFirestore.instance.collection('selectedEvents');
  // final List<Event> initialEvents = [
  //   Event(
  //     id: '1',
  //     name: 'Flutter Workshop',
  //     location: 'Cairo, Egypt',
  //     time: '2024-10-30 10:00 AM',
  //     description: '',
  //   ),
  //   Event(
  //     id: '2',
  //     description: '',
  //     name: 'Dart Conference',
  //     location: 'Dubai, UAE',
  //     time: '2024-11-10 9:00 AM',
  //   ),
  //   Event(
  //     id: '3',
  //     description: '',
  //     name: 'Tech Expo',
  //     location: 'San Francisco, USA',
  //     time: '2024-12-05 2:00 PM',
  //   ),
  // ];

  // void addInitialEvents(FirestoreService firestoreService) async {
  //   await firestoreService.addEvents();
  // }

  // Future<void> addEvents() async {
  //   final data = eventsCollection;
  //   try {
  //     for (Event event in initialEvents) {
  //       data.add(event.toMap());
  //     }
  //     debugPrint("Events added successfully!");
  //   } catch (e) {
  //     debugPrint("Failed to add events: $e");
  //   }
  // }

  // Fetch all events
  Future<List<Event>> getEvents() async {
    QuerySnapshot snapshot = await eventsCollection.get();

    return snapshot.docs.map((doc) => Event.fromFirestore(doc)).toList();
  }

  // Add event ID to 'selectedEvents' collection
  Future<void> addEventToSelected(String eventId) async {
    try {
      await selectedEventsCollection.doc(eventId).set({'id': eventId});
    } catch (e) {
      debugPrint('Error adding event: $e');
    }
  }

  // Fetch selected events (optional, if needed to display later)
  Future<List<String>> getSelectedEventIds() async {
    QuerySnapshot snapshot = await selectedEventsCollection.get();
    return snapshot.docs.map((doc) => doc.id).toList();
  }
}
