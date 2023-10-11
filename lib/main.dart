import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list/provider/task_provider.dart';
import 'package:task_list/screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
        ),
        routes: {
          '/': (context) => const TaskListScreen(),
        },
      ),
    );
  }
}
