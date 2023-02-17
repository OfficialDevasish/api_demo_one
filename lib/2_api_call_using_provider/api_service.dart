import 'dart:convert';
import '../1_basic_api/basic_api_call.dart';
import 'package:http/http.dart' as http;


class ApiService{

  Future<UserCoinPaprikaData> getUserCoinPaprikaData() async {

    var url = "https://api.coinpaprika.com/v1/coins/btc-bitcoin";
    var response = await http.get(Uri.parse(url));

    var data= jsonDecode(response.body);
    return UserCoinPaprikaData.fromJson(data);
  }


}