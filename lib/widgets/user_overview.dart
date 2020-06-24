import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/users.dart';

class UserOverview extends StatefulWidget {
  @override
  _UserOverviewState createState() => _UserOverviewState();
}

class _UserOverviewState extends State<UserOverview> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Users>(context).fetchAndSetUsers().then((_) {
        _isLoading = false;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _refreshUsers(BuildContext context) async {
    await Provider.of<Users>(context, listen: false).fetchAndSetUsers();
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<Users>(context);
    return _isLoading && userData.users == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : userData.users.length < 1
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Any user are not registered!\nPlease register user!',
                    style: TextStyle(fontSize: 22),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.autorenew,
                      size: 50,
                    ),
                    color: Colors.blueAccent,
                    onPressed: () => _refreshUsers(context),
                  )
                ],
              )
            : Expanded(
                child: RefreshIndicator(
                  onRefresh: () => _refreshUsers(context),
                  child: ListView.builder(
                    itemCount: userData.users.length,
                    itemBuilder: (ctx, index) {
                      return Card(
                        elevation: 0,
                        margin: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 5,
                        ),
                        child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  userData.users[index].entered == true
                                      ? Colors.deepOrangeAccent
                                      : Colors.black54,
                              foregroundColor: Colors.white,
                              radius: 30,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: FittedBox(
                                  child: Text(
                                    userData.users[index].entered
                                        ? 'In'
                                        : 'Out',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            title: Center(
                              child: Text(
                                'User ${index + 1}',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            )),
                      );
                    },
                  ),
                ),
              );
  }
}