import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallet/assets/Colors.dart';

class PortfolioListShimmer extends StatelessWidget {
  const PortfolioListShimmer({Key? key}) : super(key: key);

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
          itemCount: 10,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 48.0,
              height: 48.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 20.0,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      Container(
                        width: 20.0,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40.0,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      Container(
                        width: 80.0,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
