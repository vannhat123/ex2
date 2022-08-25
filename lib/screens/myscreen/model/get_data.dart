import 'dart:convert';
import 'package:flutter/services.dart';
import 'models.dart';

class GetData {
  GetData();
  Future<List<UserJson>> getData() async {
    final String response =
        await rootBundle.loadString('assets/e3_list_artist.json');
    final reponseData = json.decode(response) as List;
    List<UserJson> list = reponseData.map((dto) {
      return UserJson.fromJson(dto);
    }).toList();
    return list;
  }
}
