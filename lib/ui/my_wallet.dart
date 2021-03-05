import 'package:flutter/material.dart';
import 'package:gas/utils/colors_file.dart';
import 'package:gas/utils/custom_widgets/custom_divider.dart';
import 'package:gas/utils/custom_widgets/drawer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class MyWallet extends StatefulWidget {
  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerList(),
      appBar: AppBar(
        backgroundColor: primaryAppColor,
        title: Text("محفظتي"),
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: _mainForm(context),
      ),
    );
  }

  Form _mainForm(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "الرصيد",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "30",
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: greenAppColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "ريال",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: greenAppColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 22,
                                    width: 22,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border:
                                            Border.all(color: greenAppColor)),
                                    child: Icon(
                                      Icons.add,
                                      color: greenAppColor,
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "اضافة رصيد",
                                    style: TextStyle(
                                        color: greenAppColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "أكواد الخصم",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "تاريخ الانتهاء",
                                style: TextStyle(
                                  color: greenAppColor,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "القيمة",
                                style: TextStyle(
                                  color: greenAppColor,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "XKFON",
                                style: TextStyle(
                                    color: greenAppColor, fontSize: 20),
                              ),
                              Text(
                                "1/2/2022",
                                style: TextStyle(
                                    color: greenAppColor, fontSize: 15),
                              ),
                              Text(
                                "5%",
                                style: TextStyle(
                                    color: greenAppColor, fontSize: 15),
                              ),
                            ],
                          ),
                          CustomDivider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "BO2RT1",
                                style: TextStyle(
                                    color: greenAppColor, fontSize: 20),
                              ),
                              Text(
                                "1/2/2022",textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: greenAppColor, fontSize: 15),
                              ),
                              Text(
                                "10ريال",
                                style: TextStyle(
                                    color: greenAppColor, fontSize: 15),
                              ),
                            ],
                          ),
                          CustomDivider(),

                          TextButton(
                              onPressed: () {},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 22,
                                    width: 22,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border:
                                            Border.all(color: greenAppColor)),
                                    child: Icon(
                                      Icons.add,
                                      color: greenAppColor,
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "اضافة كود / كوبون",
                                    style: TextStyle(
                                        color: greenAppColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "تبديل مجاني",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "أحصل علي تبديل مجاني للاسطوانة عند استبدال عدد 7 اسطوانات خلال عام واحد",
                            style: TextStyle(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "الرصيد",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: greenAppColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "1/7",
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: greenAppColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
