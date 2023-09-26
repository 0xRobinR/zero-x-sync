import 'package:web3dart/credentials.dart';

abstract class IKey {
  String generateMnemonic();
  Future<String> getPrivateKey(String mnemonic);
  Future<EthereumAddress> getPublicAddress(String privateKey);
  Future<bool> setupFromMnemonic(String mnemonic);
  Future<bool> setupFromPrivateKey(String privateKey);
  String? getMnemonic();
}