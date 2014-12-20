import "dictionary.dart";

import "package:polymorphic_bot/api.dart";

BotConnector bot;
EventManager eventManager;

void main(List<String> args, port) {
  print("[Dictionary] Loading");
  
  eventManager.command("define", (event) {
    if (event.args.isEmpty) {
      event.reply("> Usage: define <word>");
    } else {
      var word = event.args.join(" ");
      wordnik.define(word).then((definition) {
        if (definition == null) {
          event.reply("> No Definition Found.");
        } else {
          event.reply("${definition["word"]}: ${definition["definition"]}");
        }
      });
    }
  });
  
  eventManager.command("urban", (event) {
    if (event.args.isEmpty) {
      event.reply("> Usage: urban <word>");
    } else {
      var word = event.args.join(" ");
      urban.define(word).then((definition) {
        if (definition == null) {
          event.reply("> No Definition Found.");
        } else {
          event.reply("${definition["word"]}: ${definition["definition"]}");
        }
      });
    }
  });
}
