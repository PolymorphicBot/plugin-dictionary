import "dart:async";
import "dart:io";
import "dart:convert";

import "package:http/http.dart" as http;

Future<Map<String, String>> define(String word) {
  return http.get("http://api.urbandictionary.com/v0/define?term=${Uri.encodeComponent(word)}").then((http.Response resp) {
    var data = JSON.decode(resp.body);
    if (data["list"].length == 0) {
      return new Future.value(null);
    } else {
      return new Future.value({"word": data["list"].first["word"], "definition": data["list"].first["definition"]});
    }
  });
}
