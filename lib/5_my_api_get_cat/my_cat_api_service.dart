import 'dart:convert';

import 'package:flutter/material.dart';

import 'categories_response_model/CategoriesResponse.dart';
import 'package:http/http.dart' as http;

class MyCatApiService {

  Future<CategoriesResponse> categoriesListCall() async {

    try {
      final uri = Uri.parse("https://ecommerce.tecocraft.net/api/v1/category-list");
      final response = await http.get(uri);

      debugPrint("response.statusCode: ${response.statusCode}");

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return CategoriesResponse.fromJson(json);
      }

    } catch (e) {
      debugPrint("error: $e");
    }

    return CategoriesResponse();

  }

}