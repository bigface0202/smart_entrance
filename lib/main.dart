import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/index_screen.dart';
import './providers/users.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Users()),
      ],
      child: MaterialApp(
        title: 'Smart Entrance',
        home: IndexScreen(),
      ),
    );
  }
}
