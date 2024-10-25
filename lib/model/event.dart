import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String name;
  final String id;
  final String description;
  final String location;
  final String time;

  Event({
    required this.name,
    required this.id,
    required this.description,
    required this.location,
    required this.time,
  });

  // Convert Event object to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'location': location,
      'time': time,
    };
  }

  // Create an Event object from Firestore document
  factory Event.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Event(

      name: data['name'],
      id: data['id'],
      description: data['description'],
      location: data['location'],
      time: data['time'],
    );
  }
}
