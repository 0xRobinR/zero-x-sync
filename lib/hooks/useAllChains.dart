import 'package:dio/dio.dart';
import 'package:wallet/config/chains.dart';
import 'package:wallet/config/endpoints.dart';
import 'package:wallet/lib/api/Api.dart';
import 'package:wallet/lib/models/Chain.dart';
import 'package:wallet/lib/models/Mocks.dart';

Future<List<Chain>> useAllChains() async {
  List<Chain> chainsFetched = [ tempChain ];

  // Response response = await Api.dio().get(chainAPI);
  // print(response.data);
  return allChains;
  // for ( var c in response.data ) {
  //   Chain cData = Chain(
  //     chainName: c['chain_name'],
  //     chainSymbol: c['chain_symbol'],
  //     chainStandard: c['chain_standard'],
  //     chainLogo: c['chain_logo']
  //   );
  //
  //   chainsFetched.add(cData);
  // }
  // if ( chainsFetched.length > 1 ) {
  //   chainsFetched.removeAt(0);
  // }
  // return chainsFetched;
}