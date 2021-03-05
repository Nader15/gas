import 'package:flutter/material.dart';
import 'package:gas/utils/colors_file.dart';
import 'package:gas/utils/custom_widgets/custom_divider.dart';
import 'package:gas/utils/custom_widgets/drawer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerList(),
      appBar: AppBar(
        backgroundColor: primaryAppColor,
        title: Text("التنبيهات"),
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
                            "عنوان التنبية",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "أحصل علي تبديل مجاني للاسطوانة عند استبدال عدد 7 اسطوانات خلال عام واحد",
                            style: TextStyle(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "حذف",
                                    style: TextStyle(
                                        color: greenAppColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
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
                            "عنوان التنبية",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "أحصل علي تبديل مجاني للاسطوانة عند استبدال عدد 7 اسطوانات خلال عام واحد",
                            style: TextStyle(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "حذف",
                                    style: TextStyle(
                                        color: greenAppColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "مسح الكل",
                            style: TextStyle(
                                color: greenAppColor,
                                fontWeight: FontWeight.bold),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "مسح المحدد",
                            style: TextStyle(
                                color: greenAppColor,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  )
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
