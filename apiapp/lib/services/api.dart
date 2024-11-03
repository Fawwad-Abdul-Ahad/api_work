import 'dart:convert';
import 'package:apiapp/model/productModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<productsData>?> getData() async {
    String finalURL = 'https://webhook.site/5fc9407b-309d-4923-91bc-d8206dd5c3a5';

    try {
      final response = await http.get(Uri.parse(finalURL));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        
        // Convert each JSON object in the list to a productsData instance
        List<productsData> products = jsonData.map((json) => productsData.fromJson(json)).toList();
        
        print('successful');
        return products;
      } else {
        print("Failed to get data");
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
