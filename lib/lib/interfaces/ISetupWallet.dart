abstract class IWallet {
  Future<void> setMnemonic(String? value);
  Future<void> backupDone(bool value);
  Future<void> setPrivateKey(String? value);
  Future<void> setChain();
  String? getMnemonic();
  String? getPrivateKey();
  String? getChain();
  bool didBackupWallet();
}