
class WalletKey {
  final String? walletId;
  WalletKey({this.walletId});

  String getWalletId() => walletId ?? 'new';
  String isBackedUp() => 'wallet-backup-'+getWalletId();
  String walletPhrase() => 'wallet-phrase-'+getWalletId();
  String walletPrivate() => 'wallet-private-'+getWalletId();
  String walletChain() => 'wallet-chain-'+getWalletId();
}
