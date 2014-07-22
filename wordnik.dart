import "dart:async";
import "dart:io";
import "dart:convert";

import "package:http/http.dart" as http;

Future<Map<String, String>> define(String word) {
  return http.get("http://api.wordnik.com/v4/word.json/${Uri.encodeComponent(word)}/definitions?limit=50&includeRelated=true&useCanonical=true&includeTags=false&api_key=50b6a4b7956e5934de00d0e43c10b78e7a67da3eef3e50662").then((http.Response resp) {
    var data = JSON.decode(resp.body);
    if (data.length == 0) {
      return new Future.value(null);
    } else {
      return new Future.value({"word": data.first["word"], "definition": data.first["text"]});
    }
  });
}
