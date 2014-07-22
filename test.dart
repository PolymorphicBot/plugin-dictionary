import "wordnik.dart" as wordnik;
import "urban.dart" as urban;

main() {
  wordnik.define("Hello").then((data) {
    print("[WORDNIK] ${data["word"]}: ${data["definition"]}");
  });

  urban.define("Hello").then((data) {
    print("[URBAN] ${data["word"]}: ${data["definition"]}");
  });
}
