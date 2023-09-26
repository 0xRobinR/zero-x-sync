import 'package:uuid/uuid.dart';
import 'package:wallet/lib/models/Chain.dart';

var uid = const Uuid();

Chain multiChain = Chain(
  chainName: "Multi-Chain",
  chainSymbol: "Wallet",
  chainLogo: "/multi.png",
  chainStandard: "MultiChain Wallet for All Chain",
  chainId: "0",
  isETHLayer: false,
  chainUId: "multi-chain-wallet"
);

Chain bnbChain = Chain(
  chainStandard: "BEP20",
  chainName: "BNB Chain",
  chainSymbol: "BNB",
  chainLogo: "/bnb.png",
  chainId: "56",
  isETHLayer: true,
  chainUId: "bnb-chain-wallet"
);

Chain ethChain = Chain(
  chainName: "Ethereum",
  chainSymbol: "ETH",
  chainStandard: "ERC20",
  chainLogo: "/eth.png",
  chainId: "1",
  isETHLayer: true,
  chainUId: "ethereum-chain-wallet"
);

Chain polygonChain = Chain(
  chainName: "Polygon",
  chainSymbol: "MATIC",
  chainStandard: "ERC20",
  chainLogo: "/matic.png",
  chainId: "137",
  isETHLayer: true,
  chainUId: "polygon-chain-wallet"
);

List<Chain> allChains = [
  multiChain,
  bnbChain,
  ethChain,
  polygonChain
];