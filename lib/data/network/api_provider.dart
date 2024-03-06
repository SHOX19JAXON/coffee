import 'dart:convert';


import 'package:http/http.dart' as http;

import '../../utils/constants/app_constants.dart';
import '../models/my_response.dart';
import '../models/product_model.dart';

class ApiProvider {
  static Future<MyResponse> getAllProducts() async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/products");
    try {
      http.Response response = await http.get(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        return MyResponse(
          data: (jsonDecode(response.body)["items"] as List?)
                  ?.map((e) => ProductModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> addProduct(ProductModel productModel) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/products");
    try {
      http.Response response = await http.post(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode([productModel.toJson()]),
      );
      if (response.statusCode == 201) {
        return MyResponse(data: "Product added successfully!");
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> deleteProduct(String productUUID) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/products");
    try {
      http.Response response = await http.delete(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode([
          {"_uuid": productUUID}
        ]),
      );
      if (response.statusCode == 200) {
        return MyResponse(data: "Product deleted successfully!");
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> updateProduct(ProductModel productModel) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/products");
    try {
      http.Response response = await http.put(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode([productModel.toJsonForUpdate()]),
      );
      if (response.statusCode == 200) {
        return MyResponse(data: "Product updated successfully!");
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }
}
class AppConstants {
  static String baseUrl = "crudapi.co.uk";
  static String token = "0KFrtoPFd3oR2PqCOyxWONytRAoKznJ7ViWzqsdl1E9nV5eyTw";
}
