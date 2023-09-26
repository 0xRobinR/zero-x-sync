import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wallet/components/Loader/LinearLoader.dart';

class ListLoader extends StatelessWidget {
  const ListLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: SizedBox(
          height: 30.0,
          width: 30.0,
          child: LinearLoader()
      ),
    );
  }
}
