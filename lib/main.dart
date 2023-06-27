import 'package:flutter/material.dart';

import 'bottombar/bottombar.dart';
import 'pages/mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('해수욕장 파고 수온 검색'),),
        body: MainpageUI(),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
