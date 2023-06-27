import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottombar/bottombar.dart';
import 'pages/mainpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
