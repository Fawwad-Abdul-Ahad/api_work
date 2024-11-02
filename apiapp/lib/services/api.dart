import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiService {
  String baseURL = 'http://192.168.0.102/api';
  Future  createApi(Map pData)async{
    
    String endURL = '/add_post';
    String finalURL = baseURL+endURL;

    
    try{
      final response = await http.post(Uri.parse(finalURL),body: pData);
      if(response.statusCode == 200){
        final data = jsonDecode(response.body.toString());
        print(data);
      }
      else{
        print("Failed to get data");
      }
    }catch(e){
      print(e);
    }

  }
}