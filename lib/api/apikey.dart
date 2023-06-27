import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherData {
  String wh = '';
  String tw = '';

  Future<void> fetchWeatherData() async {
    String apiKey = '02SHyeeMpPJ4WmYMDEx0DhbQct0Tabw72Cbjx%2F2bA74liMAWfrHzxIr%2B7REGyRmluul5p3G3viaGdqKS%2F0fEtQ%3D%3D';

    // Get Json Data of WH
    String urlWh =
        'https://apis.data.go.kr/1360000/BeachInfoservice/getWhBuoyBeach?serviceKey=$apiKey&numOfRows=1&pageNo=10&dataType=JSON&beach_num=306&searchTime=202304011104';
    var responseWh = await http.get(Uri.parse(urlWh));
    var jsonDataWh = jsonDecode(responseWh.body);

    // Get Json Data of TW
    String urlTw =
        'https://apis.data.go.kr/1360000/BeachInfoservice/getTwBuoyBeach?serviceKey=$apiKey&numOfRows=1&pageNo=10&dataType=JSON&beach_num=306&searchTime=202205011600';
    var responseTw = await http.get(Uri.parse(urlTw));
    var jsonDataTw = jsonDecode(responseTw.body);

    var whJsonGet = jsonDataWh['response']['body']['items']['item'];
    var twJsonGet = jsonDataTw['response']['body']['items']['item'];
    var whDic = Map<String, dynamic>.from(whJsonGet[0]);
    var twDic = Map<String, dynamic>.from(twJsonGet[0]);
    wh = whDic['wh'];
    tw = twDic['tw'];
  }
}

void main() async {
  var weatherData = WeatherData();
  await weatherData.fetchWeatherData();

  runApp(MyApp(weatherData: weatherData));
}

class MyApp extends StatelessWidget {
  final WeatherData weatherData;

  const MyApp({required this.weatherData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('해수욕장 파고 수온'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('파고: ${weatherData.wh} m'),
              Text('수온: ${weatherData.tw} °C'),
            ],
          ),
        ),
      ),
    );
  }
}