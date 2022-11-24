import 'dart:convert';

import '../model/github.events.model.dart';
import 'package:http/http.dart' as http;

import '../model/github.events.model.dart';

class GitHubEventsRepository {
  Future<GitHubEvents> getEvents() async{
    String url = "https://api.github.com/events";
    try{
      http.Response response = await http.get(Uri.parse(url));
      if(response.statusCode == 200) {
        Map<String,dynamic> listEventsMap = json.decode(response.body);
        GitHubEvents listEvents = GitHubEvents.fromJson(listEventsMap);
        return listEvents;
      } else {
        return throw("Err => ${response.statusCode}");
      }
    } catch(e){
      return throw(e.toString());
    }
  }

  Future<GitHubEvents> searchEvents(String keyword, int page, int pageSize) async{
    String url = "https://api.github.com/events?q=$keyword&page=$page&per_page=$pageSize";
    try{
      http.Response response = await http.get(Uri.parse(url));
      if(response.statusCode == 200) {
        Map<String,dynamic> listEventsMap = json.decode(response.body);
        GitHubEvents listEvents = GitHubEvents.fromJson(listEventsMap);
        return listEvents;
      } else {
        return throw("Err => ${response.statusCode}");
      }
    } catch(e){
      return throw(e.toString());
    }
  }
}