import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas/utils/colors_file.dart';
import 'package:gas/utils/custom_widgets/custom_divider.dart';
import 'package:gas/utils/custom_widgets/drawer.dart';
import 'package:gas/utils/global_vars.dart';
import 'package:gas/utils/navigator.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:gas/ui/orders_list.dart';

class OrderStatus extends StatefulWidget {
  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerList(),
      appBar: AppBar(
        backgroundColor: primaryAppColor,
        title: Text(
          getTranslated(context, "OrderStatus2"),
          style: TextStyle(fontWeight: FontWeight.w100),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.directions_car),
              onPressed: () {
                navigateAndKeepStack(context, OrdersList());
              })
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
                  children: [
                    Card(
                      color: redColor,
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(getTranslated(context, "OrderStatus2"),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 18,
                                      color: whiteColor)),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Text(
                                    getTranslated(context, "OrderWithDriver"),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 30,
                                        color: whiteColor)),
                              ),
                            ],
                          ),
                        ),
                      ),
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
                                Text(getTranslated(context, "OrderNumber"),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/images/new_tube.png",
                                  width: 30,
                                ),
                                Text(
                                  "?????????????? ???????? 1 ??????",
                                  style: TextStyle(
                                      color: greenAppColor, fontSize: 20),
                                ),
                                Text(
                                  "1",
                                  style: TextStyle(
                                      color: greenAppColor, fontSize: 20),
                                ),
                              ],
                            ),
                            CustomDivider(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/images/new_tube.png",
                                  width: 30,
                                ),
                                Text(
                                  "?????????????? ???????? 1 ??????",
                                  style: TextStyle(
                                      color: greenAppColor, fontSize: 20),
                                ),
                                Text(
                                  "1",
                                  style: TextStyle(
                                      color: greenAppColor, fontSize: 20),
                                ),
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
                                    child: Text(
                                        getTranslated(
                                            context, "InvoiceDetails"),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 12,
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
                                        child: Text(
                                            getTranslated(context, "EditOrder"),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w100,
                                                fontSize: 12,
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
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              getTranslated(context, "DeliveryLocation"),
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 18,
                                  color: greenAppColor),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 120,
                              decoration: BoxDecoration(
                                  color: greyPrimaryColor.withOpacity(.3),
                                  borderRadius: BorderRadius.circular(5)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: redColor,
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getTranslated(context, "RequiredAmount"),
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 18,
                                  color: whiteColor),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("60",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 50,
                                        color: whiteColor)),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(getTranslated(context, "SR"),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 30,
                                        color: whiteColor)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
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
}

TextStyle _titleTextStyle =
    TextStyle(color: greenAppColor, fontSize: 15, fontWeight: FontWeight.w100);
