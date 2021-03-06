import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas/utils/colors_file.dart';
import 'package:gas/utils/custom_widgets/custom_divider.dart';
import 'package:gas/utils/custom_widgets/drawer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class OrdersList extends StatefulWidget {
  @override
  _OrdersListState createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerList(),
      appBar: AppBar(
        backgroundColor: primaryAppColor,
        title: Text(
          "الطلبات",
          style: TextStyle(fontWeight: FontWeight.w100),
        ),
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("طلب قائم",
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 20,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("رقم الطلب",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 20,
                                    )),
                                Text("12012121",
                                    style: TextStyle(
                                      fontSize: 20,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("حالة الطلب",
                                    style: TextStyle(
                                      color: greenAppColor,
                                      fontWeight: FontWeight.w100,
                                      fontSize: 20,
                                    )),
                                Text("الطلب مع السائق",
                                    style: TextStyle(
                                      color: redColor,
                                      fontSize: 25,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: greenAppColor,
                                        borderRadius: BorderRadius.circular(5)),
                                    alignment: Alignment.center,
                                    child: Text("تفاصيل الفاتورة",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 18,
                                            color: whiteColor)),
                                  ),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border:
                                                Border.all(color: Colors.blue)),
                                        alignment: Alignment.center,
                                        child: Text("تعديل الطلب",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w100,
                                                fontSize: 18,
                                                color: Colors.blue)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.delete_forever,
                                      color: redColor,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.alternate_email,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("طلبات سابقة",
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 20,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.7,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("الرقم",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 18,
                                      )),
                                  Text("التاريخ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 18,
                                      )),
                                  Text("الحالة",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 18,
                                      )),
                                  Text("القيمة",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 18,
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            recentOrders(true),
                            recentOrders(true),
                            recentOrders(false),
                            recentOrders(true),
                            recentOrders(true),
                            recentOrders(true),
                            SizedBox(
                              height: 20,
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
      ),
    );
  }

  Widget recentOrders(bool status) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("12500",
                      style: TextStyle(
                        color: status == true ? greenAppColor : redColor,
                        fontWeight: FontWeight.w100,
                        fontSize: 18,
                      )),
                  Text("1/2/2022",
                      style: TextStyle(
                        color: status == true ? greenAppColor : redColor,
                        fontWeight: FontWeight.w100,
                        fontSize: 18,
                      )),
                  Text(status == true ? "تم الاستلام" : "ملغي",
                      style: TextStyle(
                        color: status == true ? greenAppColor : redColor,
                        fontWeight: FontWeight.w100,
                        fontSize: 18,
                      )),
                  Text("45",
                      style: TextStyle(
                        color: status == true ? greenAppColor : redColor,
                        fontWeight: FontWeight.w100,
                        fontSize: 18,
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: status == true ? greenAppColor : redColor,
              ),
              child: Text(
                "التفاصيل",
                style: TextStyle(color: whiteColor),
              ),
            )
          ],
        ),
        CustomDivider(),
      ],
    );
  }
}

TextStyle _titleTextStyle =
    TextStyle(color: greenAppColor, fontSize: 15, fontWeight: FontWeight.w100);
