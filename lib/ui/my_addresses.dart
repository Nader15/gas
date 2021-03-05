import 'package:flutter/material.dart';
import 'package:gas/utils/colors_file.dart';
import 'package:gas/utils/custom_widgets/drawer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class MyAddresses extends StatefulWidget {
  @override
  _MyAddressesState createState() => _MyAddressesState();
}

class _MyAddressesState extends State<MyAddresses> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerList(),
      appBar: AppBar(
        backgroundColor: primaryAppColor,
        title: Text(
          "عناويني",
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
      child: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  address("البيت",
                      "268 Ibn Bakkar, As Safa District, Jedda 234526651,Saudi Arabia"),
                  address("البيت",
                      "268 Ibn Bakkar, As Safa District, Jedda 234526651,Saudi Arabia"),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
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
                  Text("اضافة عنوان", style: _titleTextStyle),
                ],
              ))
        ],
      ),
    );
  }

  bool defaultAddress = false;

  Card address(String title, String location) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    defaultAddress == true
                        ? Text("(الافتراضي)", style: _titleTextStyle)
                        : Container(),
                  ],
                ),
                defaultAddress == false
                    ? TextButton(
                        onPressed: () {
                          setState(() {
                            defaultAddress = !defaultAddress;
                          });
                        },
                        child: Text("تعيين كأفتراضي", style: _titleTextStyle))
                    : Container()
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              location,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("تعديل", style: _bttnTextStyle),
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "حذف",
                    style: _bttnTextStyle,
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

TextStyle _bttnTextStyle =
    TextStyle(color: greenAppColor, fontSize: 15, fontWeight: FontWeight.w100);
TextStyle _titleTextStyle =
    TextStyle(color: greenAppColor, fontSize: 15, fontWeight: FontWeight.w100);
