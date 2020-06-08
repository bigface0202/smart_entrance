import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/users.dart';

class UserStatistics extends StatelessWidget {
  Widget statisticsIndicator(
      String statisticsName, String statisticsValue, Color circleColor) {
    return Column(children: <Widget>[
      CircleAvatar(
        backgroundColor: circleColor,
        foregroundColor: Colors.white,
        radius: 50,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: FittedBox(
            child: Text(
              statisticsValue,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      Text(
        statisticsName,
        style: TextStyle(
          fontSize: 30,
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Consumer<Users>(
          builder: (_, users, ch) => Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                statisticsIndicator(
                    'Active User', '${users.activeUsers}', Colors.deepOrangeAccent),
                statisticsIndicator('Total User', '${users.userCount}', Colors.deepPurpleAccent),
              ],
            ),
          ),
        )
      ],
    );
  }
}
