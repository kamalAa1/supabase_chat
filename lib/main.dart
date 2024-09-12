import 'package:flutter/material.dart';
import 'package:supabase_chat/all_user_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://afgvcnbhnlsxqgkfglbc.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFmZ3ZjbmJobmxzeHFna2ZnbGJjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjI2NjQ3MDcsImV4cCI6MjAzODI0MDcwN30.YjJdDI4ZTgxAge7xuEO_Gj1ynmhWA88EmV-2RNpzrTw",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AllUserScreen(),
    );
  }
}
