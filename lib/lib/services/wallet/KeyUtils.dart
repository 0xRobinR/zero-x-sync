import 'package:bip39/bip39.dart' as bip39;
import 'package:convert/convert.dart';
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:hex/hex.dart';
import 'package:wallet/lib/interfaces/IKey.dart';
import 'package:wallet/lib/interfaces/ISetupWallet.dart';
import 'package:web3dart/credentials.dart';

class KeyUtils implements IKey {
  KeyUtils({
    required this.wallet
  });

  IWallet wallet;

  @override
  String? getMnemonic() {
    // TODO: implement entropyToMnemonic
    return wallet.getMnemonic() == null ? null : bip39.entropyToMnemonic(wallet.getMnemonic()!);
  }

  @override
  String generateMnemonic() {
    // TODO: implement generateMnemonic
    return bip39.generateMnemonic();
  }

  @override
  Future<String> getPrivateKey(String mnemonic) async {
    // TODO: implement getPrivateKey
    final seed = bip39.mnemonicToSeedHex(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(
      hex.decode(seed)
    );
    final privateKey = HEX.encode(master.key);
    return privateKey;
  }

  @override
  Future<EthereumAddress> getPublicAddress(String privateKey) async {
    // TODO: implement getPublicAddress
    final private = EthPrivateKey.fromHex(privateKey);
    final address = await private.extractAddress();
    return address;
  }

  @override
  Future<bool> setupFromMnemonic(String mnemonic) async {
    // TODO: implement setupFromMnemonic
    final cryptMnemonic = bip39.mnemonicToEntropy(mnemonic);
    // final privateKey = await getPrivateKey(mnemonic);

    // logD(title: privateKey);
    await wallet.setMnemonic(cryptMnemonic);
    // wallet.setPrivateKey(privateKey);
    await wallet.setChain();
    return true;
  }

  @override
  Future<bool> setupFromPrivateKey(String privateKey) async {
    await wallet.setMnemonic(null);
    await wallet.setPrivateKey(privateKey);
    return true;
  }

}