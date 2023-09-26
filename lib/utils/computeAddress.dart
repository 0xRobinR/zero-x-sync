import 'dart:convert';
import 'dart:typed_data';
import 'package:bip39/bip39.dart';
import 'package:bs58/bs58.dart';
import 'package:crypto/crypto.dart';
import 'package:ethers/signers/wallet.dart';
import 'package:hex/hex.dart';
import 'package:wallet/utils/devLogger.dart';

/// get ethereum layers address from [privateKey]
/// ```dart
/// getETHAddress(privateKey: "0x...")
/// ```
///
/// returns `String`
String getETHAddress({required String privateKey}) {
  final walletInst = Wallet.fromPrivateKey(privateKey);
  String address = walletInst.address!;
  return address;
}



/// get tron chain address from [privateKey]
/// ```dart
/// getTRXAddress(privateKey: "0x...")
/// ```
///
/// Returns `String`
String getTRXAddress({required String privateKey}) {
  String addressHex = "41"+getETHAddress(privateKey: privateKey).substring(2);
  final doubleSha256 = sha256.convert(sha256.convert(utf8.encode(addressHex)).bytes);
  logD(title: "Double256: $doubleSha256");
  final checkSum = doubleSha256.toString().substring(0, 8);
  final tron58 = HEX.decode(addressHex+checkSum) as Uint8List;
  final tronAddress = base58.encode(tron58);
  logD(title: "Tron Address: $tronAddress");

  return tronAddress;
}