import 'package:flutter/material.dart';
import '../model/event.dart';
import '../service/firebase_services.dart';

class EventProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<Event> _events = [];
   bool _isLoading = true;

  List<Event> get events => _events;
   bool get isLoading => _isLoading;

  EventProvider() {
    loadEvents();
  }

  Future<void> loadEvents() async {
    try {
      _events = await _firestoreService.getEvents();
     } catch (e) {
      _events = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

   Future<void> refreshEvents() async {
    _isLoading = true;
    notifyListeners();
    await loadEvents();
  }
}
