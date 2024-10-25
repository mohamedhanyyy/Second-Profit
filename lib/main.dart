import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/presentation/screens/events_screen.dart';
import 'package:taskaty/provider/events_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const EventExplorerApp());
}

class EventExplorerApp extends StatelessWidget {
  const EventExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event Explorer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ChangeNotifierProvider(
          create: (BuildContext context) => EventProvider(),
          child: const EventListPage()),
    );
  }
}
