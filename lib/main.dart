import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_database/SharedRefDatabase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.initS();
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String textone = 'Hello New User';

  void readUserFromDB() async {
    log(SpHelper.readNewUser().toString());
    SpHelper.readNewUser() == true
        ? textone = 'Hello Old User'
        : "Hello New User";
    await SpHelper.newUserToOldUser();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readUserFromDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Database"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(textone),
          ElevatedButton(
              onPressed: () {
                SpHelper.writeOnSp('ahmed');
              },
              child: Text('write on sp')),
          ElevatedButton(
              onPressed: () {
                log(SpHelper.readFromSp() ?? 'Unknown key');
              },
              child: Text('read from sp'))
        ]),
      ),
    );
  }
}
