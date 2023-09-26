import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet/config/chains.dart';
import 'package:wallet/config/walletSetup.dart';
import 'package:wallet/lib/interfaces/ISetupWallet.dart';
import 'package:wallet/lib/models/Chain.dart';

class WalletUtils implements IWallet {
  final String walletID;
  final SharedPreferences preferences;
  Chain? chain;

  WalletUtils({required this.walletID, required this.preferences, this.chain});

  WalletKey walletKey() => WalletKey(walletId: walletID);

  @override
  Future<void> backupDone(bool value) async {
    // TODO: implement backupDone
    await preferences.setBool(walletKey().isBackedUp(), value);
  }

  @override
  bool didBackupWallet() {
    // TODO: implement didBackupWallet
    return preferences.getBool(walletKey().isBackedUp()) ?? false;
  }

  @override
  String? getMnemonic() {
    // TODO: implement getMnemonic
    return preferences.getString(walletKey().walletPhrase());
  }

  @override
  String? getPrivateKey() {
    // TODO: implement getPrivateKey
    return preferences.getString(walletKey().walletPrivate());
  }

  @override
  Future<void> setMnemonic(String? value) async {
    // TODO: implement setMnemonic
    await preferences.setString(walletKey().walletPhrase(), value ?? '');
  }

  @override
  Future<void> setPrivateKey(String? value) async {
    // TODO: implement setPrivateKey
    await preferences.setString(walletKey().walletPrivate(), value ?? '');
  }

  @override
  Future<void> setChain() async {
    // TODO: implement setChain
    await preferences.setString(walletKey().walletChain(), chain!.chainUId ?? '');
  }

  @override
  String? getChain() {
    // TODO: implement getChain
    return preferences.getString(walletKey().walletChain());
  }

}