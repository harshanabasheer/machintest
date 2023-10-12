import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:machintest/model/items_model.dart';

class ApiService{
  Future<List<Items>> getItems()async{
    final url="https://fakestoreapi.com/products";
    var response = await http.get(Uri.parse(url));
    if(response.statusCode ==200){
      var body=json.decode(response.body);
      List<Items> _data=List<Items>.from(body['articles'].map((e) => Items.fromJson(e)).toList());
      return _data;
    }else{
      List<Items>_data =[];
      return _data;
    }

  }

}