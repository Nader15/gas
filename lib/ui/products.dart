import 'package:flutter/material.dart';
import 'package:gas/utils/colors_file.dart';
import 'package:gas/utils/global_vars.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                color: redColor, borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.center,
            child: Text(
                getTranslated(context, "OrderStatus"),
                style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 18,
                    color: whiteColor)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView.builder(
            itemCount: 6,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .7,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: greenAppColor)),
                        child: Text(
                          "15.5 " + getTranslated(context, "Currency"),
                          style: TextStyle(color: greenAppColor),
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          "assets/images/tube.png",
                          width: 90,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("منظم غاز 50 مل بار"),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  greenAppColor),
                            ),
                            onPressed: () {},
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                getTranslated(context, "Add"),
                                style: TextStyle(fontWeight: FontWeight.w100),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
