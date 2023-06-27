import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottombar/bottombar.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('해수욕장 파고 수온 검색'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Result Page")
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
