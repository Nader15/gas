import 'package:flutter/material.dart';
import 'package:gas/ui/home_page.dart';
import 'package:gas/utils/colors_file.dart';
import 'package:gas/utils/navigator.dart';
import 'package:gas/ui/my_addresses.dart';
import 'package:gas/ui/my_wallet.dart';
import 'package:gas/ui/notifications.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class drawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        color: primaryAppColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Container(
                height: 100,
                child: CircleAvatar(
                  backgroundColor: whiteColor,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: whiteColor,
                size: 30,
              ),
              title: Text(
                translator.translate('appTitle'),
                style: _textStyle,
              ),
              onTap: () {
                navigateAndClearStack(context, HomePage());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: whiteColor,
                size: 30,
              ),
              title: Text(
                "عناويني",
                style: _textStyle,
              ),
              onTap: () {
                navigateAndClearStack(context, MyAddresses());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: whiteColor,
                size: 30,
              ),
              title: Text(
                "محفظتي",
                style: _textStyle,
              ),
              onTap: () {
                navigateAndClearStack(context, MyWallet());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: whiteColor,
                size: 30,
              ),
              title: Text(
                "التنبيهات",
                style: _textStyle,
              ),
              onTap: () {
                navigateAndClearStack(context, Notifications());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: whiteColor,
                size: 30,
              ),
              title: Text(
                translator.translate('changeLanguage'),
                style: _textStyle,
              ),
              onTap: () {
                translator.setNewLanguage(
                  context,
                  newLanguage: translator.currentLanguage == 'ar' ? 'en' : 'ar',
                  remember: true,
                  restart: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle _textStyle = TextStyle(
  color: whiteColor,
  fontSize: 24,
);
