import 'package:flutter/material.dart';

import '../widgets/user_overview.dart';
import '../widgets/user_statistics.dart';

class IndexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Smart Entrance'),
        ),
        body: Column(
          children: <Widget>[
            UserStatistics(),
            UserOverview(),
          ],
        ));
  }
}
