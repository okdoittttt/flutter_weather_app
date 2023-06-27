import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottombar/bottombar.dart';
import 'pages/searchpage.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('해수욕장 파고 수온 검색'),),
        body: SearchPageWidget(),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
