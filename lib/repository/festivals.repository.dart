import 'dart:convert';

import '../model/festivals.model.dart';
import 'package:http/http.dart' as http;

class FestivalsRepository {
  Future<ListFestivals> searchFestivals(String keyword, int page, int pageSize) async{
    String url = "https://api.github.com/search/users?q=$keyword&page=$page&per_page=$pageSize";
    try{
      http.Response response = await http.get(Uri.parse(url));
      if(response.statusCode == 200) {
        Map<String,dynamic> listFestivalsMap = json.decode(response.body);
        ListFestivals listFestivals = ListFestivals.fromJson(listFestivalsMap);
        return listFestivals;
      } else {
        return throw("Err => ${response.statusCode}");
      }
    } catch(e){
      return throw(e.toString());
    }
  }
}