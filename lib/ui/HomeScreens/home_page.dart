import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas/ui/HomeScreens/products.dart';
import 'package:gas/ui/HomeScreens/recharge.dart';
import 'package:gas/ui/TestLocalCart/test_products.dart';
import 'package:gas/ui/cart.dart';
import 'package:gas/utils/colors_file.dart';
import 'package:gas/utils/custom_widgets/drawer.dart';
import 'package:gas/ui/HomeScreens/new_products.dart';
import 'package:gas/utils/global_vars.dart';
import 'package:gas/utils/navigator.dart';

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
            title: Text(
              getTranslated(context, "TheProducts"),
              style: TextStyle(fontWeight: FontWeight.w100),
            ),
            actions: [
              IconButton(icon: Icon(
                Icons.shopping_cart,
                size: 30.0,
              ), onPressed: () {
                navigateAndKeepStack(context, TestProducts());
              })
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
                        text: getTranslated(context, "Recharge"),
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
                        text: getTranslated(context, "New"),
                      ),
                    ),
                    Container(
                      height: 70,
                      child: Tab(
                        text: getTranslated(context, "Products"),
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
