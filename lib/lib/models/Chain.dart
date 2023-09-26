class Chain {
  final String? chainUId;
  final String? chainId;
  final bool? isETHLayer;
  final String? chainName;
  final String? chainSymbol;
  final String? chainStandard;
  final String? chainLogo;

  Chain({this.chainName, this.chainSymbol, this.chainStandard, this.chainLogo, this.chainUId, this.chainId, this.isETHLayer,});
}

Chain? getChainFromList(List<Chain> chains, String? uid) {
  for ( Chain c in chains ) {
    if ( c.chainUId == uid ) {
      return c;
    }
  }
  return null;
}