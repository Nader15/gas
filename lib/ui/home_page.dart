import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas/utils/colors_file.dart';
import 'package:gas/utils/custom_widgets/drawer.dart';
import 'package:gas/ui/products.dart';
import 'package:gas/ui/new_products.dart';
import 'package:gas/ui/recharge.dart';

class HomePage extends StatefulWidget {
  final int currentIndex;

  HomePage({this.currentIndex});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerList(),
      key: _drawerKey,
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
            ],
            backgroundColor: primaryAppColor,
            leading: IconButton(
              onPressed: () => _drawerKey.currentState.openDrawer(),
              icon: Icon(Icons.menu),
            ),
            bottom: PreferredSize(
              preferredSize: Size.square(80),
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 80,
                color: whiteColor,
                child: TabBar(
                  unselectedLabelColor: blackColor.withOpacity(0.5),
                  indicatorColor: Colors.transparent,
                  labelColor: primaryAppColor,
                  tabs: [
                    Container(
                      height: 70,
                      child: Tab(
                        text: "اعادة تعبئة",
                        icon: Image.asset(
                          "assets/images/rechrge_tube.png",
                          width: 20,
                        ),
                      ),
                    ),
                    Container(
                      height: 70,
                      child: Tab(
                        icon: Image.asset(
                          "assets/images/new_tube.png",
                          width: 30,
                        ),
                        text: "جديد",
                      ),
                    ),
                    Container(
                      height: 70,
                      child: Tab(
                        text: "منتجات",
                        icon: Image.asset(
                          "assets/images/products.png",
                          width: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            title: Text(
              "المنتجات",
              style: TextStyle(fontWeight: FontWeight.w100),
            ),
          ),
          body: TabBarView(
            children: [
              Recharge(),
              NewProducts(),
              Products(),
            ],
          ),
        ),
      ),
    );
  }
}
