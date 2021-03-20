import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gas/utils/global_vars.dart';
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
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + products;

    // TODO: implement getStudents
    final response = await http.get(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: Tocken
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
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + products;

    var response = await http.post(completeUrl, body: {
      "password": password
    }, headers: {
      HttpHeaders.authorizationHeader: Tocken,
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
