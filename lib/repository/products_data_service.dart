import 'dart:convert';
import 'package:ecommerce/models/productdata_model.dart';
import 'package:ecommerce/services/status_codes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService{
  static Future fetchProduct(String dataUrl,List<Product> product) async {
    debugPrint("Fetching product");
    String url = dataUrl;
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    var data = jsonDecode(response.body)['products'];
    if(response.statusCode == ServerStatusCodes.SUCESS) {
      for(Map<String,dynamic> i in data) {
        product.add(Product.fromJson(i));
      }
      debugPrint("data add");
    } else {
      debugPrint("Failed to fetch product");
    }
  }
}