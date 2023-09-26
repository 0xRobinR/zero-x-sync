
import 'dart:developer';

logger({ title, start }) {
  log("Logging: $title");
  var now = DateTime.now().millisecondsSinceEpoch / 1000;
  log('timeElapsed: ${(now-start).toStringAsFixed(2)}s');
}

logD({title}) {
  log("Logging: $title");
}