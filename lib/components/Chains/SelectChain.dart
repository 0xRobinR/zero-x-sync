import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/components/Chains/ChainItem.dart';
import 'package:wallet/generated/codegen_loader.g.dart';
import 'package:wallet/hooks/useAllChains.dart';
import 'package:wallet/lib/models/Chain.dart';

class SelectChain extends StatefulWidget {
  final Function callback;
  const SelectChain({Key? key, required this.callback}) : super(key: key);

  @override
  State<SelectChain> createState() => _SelectChainState();
}

class _SelectChainState extends State<SelectChain> {
  List<Chain>? listChains;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllChains();
  }

  fetchAllChains() async {
    listChains = await useAllChains();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colorApp.shade800,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10.0,),
            AppText(text: tr(LocaleKeys.select_chain)),
            const SizedBox(height: 10.0,),
            if ( listChains != null )
              for ( Chain c in listChains! )
                ChainItem(chain: c, callback: widget.callback,)
            else
              CircularProgressIndicator(backgroundColor: colorApp.shade50,),
            const SizedBox(height: 15.0,)
          ],
        ),
      ),
    );
  }
}
