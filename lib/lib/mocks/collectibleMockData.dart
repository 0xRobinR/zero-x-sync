import 'package:wallet/lib/models/Collectible.dart';

final nft1 = Collectible(
  imageUrl: "https://cdn.pixabay.com/photo/2022/01/17/17/20/bored-6945309_960_720.png",
  contractAddress: "0x00244737473485",
  tokenId: "482",
  nftName: "APE",
  nftSymbol: "APE NFTs"
);

final nft2 = Collectible(
  imageUrl: "https://cdn.pixabay.com/photo/2022/01/30/13/05/mystical-6980839_960_720.jpg",
  contractAddress: "0x00244737473485",
  tokenId: "126",
  nftName: 'EARTHSAVER',
  nftSymbol: 'SVR'
);

final nft3 = Collectible(
  imageUrl: "https://cdn.pixabay.com/photo/2022/04/07/16/36/art-7117922_960_720.jpg",
  contractAddress: "0x00244737473485",
  tokenId: "229",
  nftName: 'ENVIRONMENTAL',
  nftSymbol: 'EVS'
);

final nft4 = Collectible(
  imageUrl: "https://media.istockphoto.com/photos/cool-music-graffiti-in-urban-style-picture-id1144573957?s=612x612",
  contractAddress: "0x00244737473485",
  tokenId: "392",
  nftName: 'COLLECTIBLES',
  nftSymbol: 'CLTS'
);

final nft5 = Collectible(
  imageUrl: "https://cdn.pixabay.com/photo/2022/04/20/12/17/abstract-art-7145099_960_720.jpg",
  contractAddress: "0x00244737473485",
  tokenId: "199",
  nftName: 'SCENARIOS',
  nftSymbol: 'SCN NFTs'
);

final nftCollection = [
  nft1,
  nft2,
  nft3,
  nft4,
  nft5,
];