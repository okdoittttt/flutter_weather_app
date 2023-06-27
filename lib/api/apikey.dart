import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:csv/csv.dart';


class WeatherData {
  String search_term_number = "";
  String wh = '';
  String tw = '';

  Future<String> fetchWeatherData(String search_term) async {
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
    print('Search Term In WeatherData Class : $search_term');
    wh = whDic['wh'];
    tw = twDic['tw'];

    String csvData = await rootBundle.loadString('assets/data.csv'); // Assuming the CSV file is placed in the 'assets' folder
    List<List<dynamic>> csvTable = CsvToListConverter().convert(csvData);

    for (var row in csvTable) {
      if (row.length > 0 && row[0].toString() == search_term) {
        search_term_number = row[0].toString();
        print(search_term_number);
        return search_term_number;
      }
    }
    return tw;
  }
}

class Beach {
  final int id;
  final String name;

  Beach(this.id, this.name);
}

List<Beach> dataTable = [
  Beach(1, '을왕리 해수욕장'),
  Beach(2, '왕산 해수욕장'),
  Beach(3, '하나개 해수욕장'),
  Beach(4, '사계해안'),
  Beach(5, '하모해변'),
  Beach(6, '민머루 해수욕장'),
  Beach(7, '장경리 해수욕장'),
];
