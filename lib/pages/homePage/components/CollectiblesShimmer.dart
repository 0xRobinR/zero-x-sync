import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallet/assets/Colors.dart';

class CollectiblesShimmer extends StatelessWidget {
  const CollectiblesShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Shimmer.fromColors(
          baseColor: colorApp,
          highlightColor: Colors.grey.shade800,
          enabled: true,
          child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => const ListItemShimmer(),
            itemCount: 5,
          ),
        )
    );
  }
}

class ListItemShimmer extends StatelessWidget {
  const ListItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.grey,
        )
      )
    );
  }
}
