// import 'package:js_shims/js_shims.dart';

hexChar2byte(c) {
  var d;

  // if (c >= 'A' && c <= 'F') {
  //   d = charCodeAt(c, 0) - charCodeAt('A', 0) + 10;
  // } else if (c >= 'a' && c <= 'f') {
  //   d = charCodeAt(c, 0) - charCodeAt('a', 0) + 10;
  // } else if (c >= '0' && c <= '9') {
  //   d = charCodeAt(c, 0) - charCodeAt('0', 0);
  // }

  if (d is num) {
    return d;
  } else {
    throw Exception('The passed hex char is not a valid hex char');
  }
}

isHexChar(c) {
  if ((c >= 'A' && c <= 'F') ||
      (c >= 'a' && c <= 'f') ||
      (c >= '0' && c <= '9')) {
    return 1;
  }

  return 0;
}

hexStr2byteArray(String str) {
  // if (typeof str !== 'string')
  //   throw new Error('The passed string is not a string')

  var len = str.length;
  const byteArray = [];
  var d = 0;
  var j = 0;
  var k = 0;

  for (var i = 0; i < len; i++) {
    var c;
    // var c = charAt(str, i);

    if (isHexChar(c)) {
      d <<= 4;
      d += hexChar2byte(c) as int;
      j++;

      if (0 == (j % 2)) {
        byteArray[k++] = d;
        d = 0;
      }
    }
  }

  return byteArray;
}
