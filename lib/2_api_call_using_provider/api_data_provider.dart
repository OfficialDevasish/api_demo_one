import 'package:api_demo_one/1_basic_api/basic_api_call.dart';

import 'package:flutter/material.dart';

import 'api_service.dart';

class ApiDataProvider extends ChangeNotifier {

  final service = ApiService();

  List<UserCoinPaprikaData> _list = [];

  List<UserCoinPaprikaData> get list => _list;

  Future<void> getApiCoinPaprikaData() async {
    var data = await service.getUserCoinPaprikaData();
    _list.add(data);
    notifyListeners();
  }


}