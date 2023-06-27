import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottombar/bottombar.dart';
import 'api/apikey.dart';

class ResultPage extends StatefulWidget {
  final String searchTerm;
  ResultPage({required this.searchTerm});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String tw = ''; // Variable to store the tw value

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    WeatherData weatherData = WeatherData();
    tw = await weatherData.fetchWeatherData(widget.searchTerm);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('해수욕장 파고 수온 검색'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("검색한 해수욕장: ${widget.searchTerm}"),
            Text("수온: $tw"),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

