import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

String baseUrl = "https://test.ictv.net/api/";
String UserTocken = "";
String UserName = "";
String UserEmail = "";
int Id = 0;

String getTranslated(BuildContext context, String key) {
  return translator.translate(key);
}
