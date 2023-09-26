import 'package:flutter/material.dart';
import 'package:wallet/pages/homePage/index.dart';

class HomeHelper extends StatelessWidget {
  const HomeHelper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (ctx, innerBoxScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Collapsing Toolbar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Image.network(
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  fit: BoxFit.cover,
                )),
          ),
        ];
      },
      body: const HomePage(pageNumber: "1",)
    );
  }
}
