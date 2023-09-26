import 'package:crypto/crypto.dart';
import 'package:hex/hex.dart';

getSHA256({required String message}) {
  return sha256.convert(HEX.decode(message)).toString();
}