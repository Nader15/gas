import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas/utils/colors_file.dart';
import 'package:gas/utils/custom_widgets/custom_divider.dart';
import 'package:gas/utils/custom_widgets/drawer.dart';
import 'package:gas/utils/navigator.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:gas/ui/payment.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 3.5,
                decoration: BoxDecoration(
                    color: redColor, borderRadius: BorderRadius.circular(5)),
                alignment: Alignment.center,
                child: Text("60  ريال",
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 18,
                        color: whiteColor)),
              ),
            ),
            InkWell(
              onTap: () {
                navigateAndKeepStack(context, Payment());
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                alignment: Alignment.center,
                child: Text("اتمام عملية الشراء",
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 18,
                        color: whiteColor)),
              ),
            ),
          ],
        ),
      ),
      drawer: drawerList(),
      appBar: AppBar(
        backgroundColor: primaryAppColor,
        title: Text(
          "تفاصيل الطلب",
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
                  children: [
                    Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            order(),
                            order(),
                          ],
                        ),
                      ),
                    ),
                    details(),
                    delivery()
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

  bool defaultAddress = false;

  Widget order() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/new_tube.png",
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "أسطوانة حديد 11 كجم",
                  style: TextStyle(color: greenAppColor),
                ),
                Row(
                  children: [
                    Container(
                        height: 22,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(color: greenAppColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  value++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: greenAppColor,
                                size: 20,
                              ),
                            ),
                            Text(
                              "$value",
                              style: TextStyle(color: greenAppColor),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  value--;
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                color: greenAppColor,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.delete_forever,
                        color: redColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: greenAppColor)),
              child: Text(
                "15.25 ر.س",
                style: TextStyle(color: greenAppColor),
              ),
            ),
          ],
        ),
        CustomDivider()
      ],
    );
  }

  Widget details() {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "قيمة المنتجات",
                  style: TextStyle(color: greenAppColor, fontSize: 20),
                ),
                Text(
                  "3",
                  style: TextStyle(color: greenAppColor, fontSize: 20),
                ),
                Text(
                  "45.75 ريال",
                  style: TextStyle(color: greenAppColor, fontSize: 20),
                ),
              ],
            ),
            CustomDivider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "قيمة التوصيل",
                  style: TextStyle(color: greenAppColor, fontSize: 20),
                ),
                Text(
                  "15.25 ريال",
                  style: TextStyle(color: greenAppColor, fontSize: 20),
                ),
              ],
            ),
            CustomDivider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الضريبة",
                  style: TextStyle(color: greenAppColor, fontSize: 20),
                ),
                Text(
                  "15 %",
                  style: TextStyle(color: greenAppColor, fontSize: 20),
                ),
                Text(
                  "6.86 ريال",
                  style: TextStyle(color: greenAppColor, fontSize: 20),
                ),
              ],
            ),
            CustomDivider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الاجمالي",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "67.86 ريال",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    height: 22,
                    width: 22,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: greenAppColor)),
                    child: Icon(
                      Icons.add,
                      color: greenAppColor,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("اضافة كود / كوبون", style: _titleTextStyle),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "XKFON",
                  style: TextStyle(color: greenAppColor, fontSize: 20),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.delete_forever,
                    color: redColor,
                  ),
                ),
              ],
            ),
            CustomDivider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.library_add_check_outlined,
                      color: greenAppColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "رصيد متاح",
                      style: TextStyle(color: greenAppColor, fontSize: 20),
                    ),
                  ],
                ),
                Text(
                  "7.86 ريال",
                  style: TextStyle(color: greenAppColor, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget delivery() {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الموعد",
                  style: TextStyle(color: greenAppColor, fontSize: 20),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 30,
                      child: TextFormField(
                        decoration: InputDecoration(
                            alignLabelWithHint: false,
                            contentPadding: EdgeInsets.zero,
                            hintStyle: TextStyle(color: grey),
                            hintText: "اليوم",
                            border: OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 80,
                      height: 30,
                      child: TextFormField(
                        decoration: InputDecoration(
                            alignLabelWithHint: false,
                            contentPadding: EdgeInsets.zero,
                            hintStyle: TextStyle(color: grey),
                            hintText: "الساعة",
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.library_add_check_outlined,
                      color: greenAppColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "فوري",
                      style: TextStyle(color: greenAppColor, fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الموقع",
                  style: TextStyle(color: greenAppColor, fontSize: 20),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 30,
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: greenAppColor,
                        ),
                        alignLabelWithHint: false,
                        contentPadding: EdgeInsets.zero,
                        hintText: "حي الصفا ، شارع ابو محجن 10201",
                        border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
TextStyle _titleTextStyle =
    TextStyle(color: greenAppColor, fontSize: 15, fontWeight: FontWeight.w100);
