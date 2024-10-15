import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami_app/model/RadioModel.dart';

///class to collect all methods of Api
class ApiManager {
  ///func to get radio
  static Future<RadioModel> getRadios() async {
    Uri url = Uri.https("mp3quran.net", "/api/v3/radios");
    // Uri url = Uri.parse("https://mp3quran.net/api/v3/radios");
    var response = await http.get(url);

    ///used try: if an error happened from client and can't arrive to server and can't make parsing
    try {
      var responseBody = response.body; //-> string
      var json = jsonDecode(responseBody); //-> json
      return RadioModel.fromJson(
          json); //-> convert from json object to SourceResponse object
    } catch (e) {
      throw e;
    }
  }
}
