import 'package:flutter/material.dart';
import 'package:gas/utils/global_vars.dart';
import 'package:shared_preferences/shared_preferences.dart';

String UserAuth="UserAuth";
String TalaentId="TalaentId";
String TalaentName="TalaentName";
String TalaentEmail="TalaentEmail";

Future<String> getUserTocken(BuildContext context,) async {
  // save the chosen locale
  var prefs = await SharedPreferences.getInstance();
  UserTocken="${prefs.getString(UserAuth)}";
  Id=prefs.getInt(TalaentId);
  UserName=prefs.getString(TalaentName);
  UserEmail=prefs.getString(TalaentEmail);
  print("UserTocken  ${UserTocken}");
  return prefs.getString(UserAuth);

}

Future setUserTocken({ String auth_token, int talaentId, String talentName, String talentEmail}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(UserAuth , "Bearer $auth_token");
  await prefs.setString(TalaentName , talentName);
  await prefs.setString(TalaentEmail , talentEmail);
  await prefs.setInt(TalaentId , talaentId);

}
Future clearAllData({ String auth_token}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();

}