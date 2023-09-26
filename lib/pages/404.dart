import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Error404 extends StatelessWidget {
  const Error404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/Error404.svg')
        ],
      ),
    );
  }
}
