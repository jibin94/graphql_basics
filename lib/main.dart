import 'package:flutter/material.dart';
import 'package:graphql_basics/domain/dependency_injection/dependency_injection.dart';
import 'package:graphql_basics/presentation/views/screens/home_page.dart';

Future<void> main() async {
  runApp(const MyApp());
  await DependencyInjection().init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
