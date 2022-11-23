import 'dart:convert';

import '../model/festivals.json.model.dart';

import 'package:flutter/services.dart' as rootBundle;

/*
class FestivalsJSONRepository {
  Future<List<FestivalsModel>> searchJsonFestivals(String keyword, int page, int pageSize) async{
    final jsondata = await rootBundle.rootBundle.loadString('jsonfile/festivals.ten.json');
    final list = jsonDecode(jsondata) as List<dynamic>;
    
    return list.map((e) => FestivalsModel.fromJson(e)).toList();
  }
}
*/
class FestivalsJSONRepository {
  Future<FestivalsModel> searchJsonFestivals(String keyword, int page, int pageSize) async{
    final jsondata = await rootBundle.rootBundle.loadString('assetjsonfile/festivals.ten.json');
    Map<String,dynamic> listFestivalsMap = json.decode(jsondata);
    FestivalsModel listFestivals = FestivalsModel.fromJson(listFestivalsMap);
    return listFestivals;
  }
}
