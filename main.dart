import "urban.dart" as urban;
import "wordnik.dart" as wordnik;

import 'package:plugins/plugin.dart';
import 'dart:isolate';

Receiver recv;

void main(List<String> args, SendPort port) {
  print("[Dictionary] Loading");
  recv = new Receiver(port);

  recv.listen((data) {
    if (data["event"] == "command") {
      handle_command(data);
    }
  });
}

void handle_command(data) {
  void reply(String message) {
    recv.send({
      "network": data["network"],
      "target": data["target"],
      "command": "message",
      "message": message
    });
  }

  switch (data["command"]) {
    case "define":
      var args = data["args"];
      if (args.length == 0) {
        reply("> Usage: define <word>");
      } else {
        var word = args.join(" ");
        wordnik.define(word).then((def) {
          reply("> ${def["word"]}: ${def["definition"]}");
        });
      }
      break;
    case "urban":
      var args = data["args"];
      if (args.length == 0) {
        reply("> Usage: urban <word>");
      } else {
        var word = args.join(" ");
        urban.define(word).then((def) {
          reply("> ${def["word"]}: ${def["definition"]}");
        });
      }
      break;
  }
}