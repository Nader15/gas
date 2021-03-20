import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gas/utils/toast.dart';
import 'package:http/http.dart' as http;
import 'package:xs_progress_hud/xs_progress_hud.dart';

class Api {
  BuildContext context;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  Api(this.context, this.scaffoldKey);

   String baseUrl = 'http://18.188.206.243:8001/api/';
   String products = "Products";
   String forgetPassword = "ForgetPassword";
   String verifyCode = "VerifyCode";
   String customersAddresses = "CustomersAddresses";
   String basket = "basket";
   String orders = "Orders";
   String orderStatusDetails = "OrderStatusDetails";
   String checkCoupon = "check_coupon";

  Future<dynamic> getProducts() async {
    String url = "";
    String getProducts = "";

    // TODO: implement getStudents
    final response = await http.get(
      "${url}$getProducts",

      // body: {
      //   "ngo_id" : "${StaticVars.Base_NgoId}"
      // },
      headers: {
        HttpHeaders.authorizationHeader: '',
      },
    );
    print("ResponseInfo ${json.decode(response.body)}");
    XsProgressHud.hide();

    if (response.statusCode == 200) {
      // return EventDetailsModel.fromJson(json.decode(response.body));
      // return EventDetailsModel.fromJson(json.decode(response.body));

    } else {
      FN_showToast('Error', context, Colors.red, scaffoldKey);
      return false;
    }
  }

  Future loginFunc(
    String password,
  ) async {
    String url = "";
    //TklwOrrqCqzmwLVHYFZslvdgWU660xPZLUEjRtOvTMmcOG2UH41TX4PiDkgo
    var response = await http.post(url, body: {
      "password": password
    }, headers: {
      HttpHeaders.authorizationHeader: 'Bearer ',
    });
    print("PhoneBody ${response.body}");
    print("PhoneBody ${response.statusCode}");
    if (response.statusCode == 200) {
      if (!response.body.contains("error")) {
        FN_showToast(
            'Successfully updated', context, Colors.green, scaffoldKey);

        return true;
        // if(response.statusCode == 200){

      } else {
        FN_showToast('${json.decode(response.body)['error']}', context,
            Colors.red, scaffoldKey);
        return false;
      }
    } else {
      FN_showToast('Send Code Failed', context, Colors.red, scaffoldKey);
      return false;
    }
  }
}
