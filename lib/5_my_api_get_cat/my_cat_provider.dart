import 'package:api_demo_one/5_my_api_get_cat/my_cat_api_service.dart';
import 'package:flutter/material.dart';

import 'categories_response_model/CategoriesResponse.dart';

class MyCatProvider extends ChangeNotifier{

  final service = MyCatApiService();
  // late LoginResponse response;

  bool isLoading = false;

  CategoriesResponse _categoriesResponse = CategoriesResponse();

  CategoriesResponse get categoriesResponse => _categoriesResponse;

  Future<CategoriesResponse> getCategory() async {

    isLoading = true;
    notifyListeners();

    CategoriesResponse  response = await service.categoriesListCall();
    _categoriesResponse= response;

    isLoading = false;
    notifyListeners();

    return _categoriesResponse;


  }
}