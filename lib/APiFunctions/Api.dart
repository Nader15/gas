import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gas/APiFunctions/sharedPref/SharedPrefClass.dart';
import 'package:gas/ui/HomeScreens/ProductsModel.dart';
import 'package:gas/ui/LoginScreens/UserModel.dart';
import 'package:gas/ui/TestLocalCart/CartModel.dart';
import 'package:gas/ui/UserAddresses/UserAddresses_Model.dart';
import 'package:gas/utils/global_vars.dart';
import 'package:gas/utils/toast.dart';
import 'package:http/http.dart' as http;
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:xs_progress_hud/xs_progress_hud.dart';

class Api {
  BuildContext context;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  Api(this.context, this.scaffoldKey);

  String baseUrl = 'http://18.188.206.243:8001/api/';
  String products = "Products";
  String forgetPassword = "ForgetPassword/";
  String verifyCode = "VerifyCode/";
  String customersAddresses = "CustomersAddresses/";
  String basket = "basket";
  String orders = "Orders";
  String orderStatusDetails = "OrderStatusDetails";
  String checkCoupon = "check_coupon";

  Future loginFunc(
    String phone,
  ) async {
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + forgetPassword;

    var response = await http.post(
      completeUrl,
      body: {"telephoneno": "+966" + phone},
    );
    print("PhoneBody ${response.body}");
    print("PhoneBody ${{"telephoneno": "+966" + phone}}");
    print("PhoneBody ${response.statusCode}");
    XsProgressHud.hide();
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

  Future verifyCodeApi(String code, String phone) async {
    XsProgressHud.show(context);
    final String completeUrl = baseUrl + verifyCode;
    var data = {"validationCode": code, "telephoneno": "+966" + phone};
    var userToJson = json.encode(data);
    final response = await http.post(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // HttpHeaders.authorizationHeader: Token
      },
      body: userToJson,
    );
    print(userToJson);
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      print("body :" + json.decode(response.body).toString());
      // return true;
      return UserModel.fromJson(json.decode(response.body));
    } else {
      print("body :" + json.decode(response.body).toString());
      FN_showToast('?????? ?????????????? ?????? ????????', context, Colors.red, scaffoldKey);
      return false;
    }
  }

  Future<dynamic> getProducts({String filterName}) async {
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + products+"/?category=$filterName";

    // TODO: implement getStudents
    final response = await http.get(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: BaseToken
      },
    );
    print("ResponseInfo ${json.decode(response.body)}");
    print("ResponseInfo ${completeUrl}");
    print("ResponseInfo ${BaseToken}");
    XsProgressHud.hide();

    if (response.statusCode == 200) {
      return ProductsModel.fromJson(json.decode(response.body));
      // return EventDetailsModel.fromJson(json.decode(response.body));

    } else {
      FN_showToast('Error', context, Colors.red, scaffoldKey);
      return false;
    }
  }

  Future ordersListApi(GlobalKey<ScaffoldState> _scaffoldKey) async {
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + orders;
    final response = await http.get(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: BaseToken
      },
    );
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      print("body :" + json.decode(response.body).toString());
      // return OrdersListModel.fromJson(dataContent);
    } else {
      print("body :" + json.decode(response.body).toString());
      FN_showToast(
          '${json.decode(response.body)}', context, Colors.red, scaffoldKey);
      return false;
    }
  }

  Future cancelOrder(GlobalKey<ScaffoldState> _scaffoldKey, int Id) async {
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + orders;
    var data = {"order_id": "12321"};
    var userToJson = json.encode(data);
    final response = await http.post(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: BaseToken
      },
      body: userToJson,
    );
    Map<String, dynamic> dataContent = json.decode(response.body);

    print("dataContent:: ${dataContent}");
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      print("body :" + json.decode(response.body).toString());
      return true;
    } else {
      print("body :" + json.decode(response.body).toString());
      FN_showToast(
          '${json.decode(response.body)}', context, Colors.red, scaffoldKey);
      return false;
    }
  }

  Future orderStatus(GlobalKey<ScaffoldState> _scaffoldKey, int Id) async {
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + orderStatusDetails;
    var data = {"order_id": "12321"};
    var userToJson = json.encode(data);
    final response = await http.post(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: BaseToken
      },
      body: userToJson,
    );
    Map<String, dynamic> dataContent = json.decode(response.body);

    print("dataContent:: ${dataContent}");
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      print("body :" + json.decode(response.body).toString());
      return true;
    } else {
      print("body :" + json.decode(response.body).toString());
      FN_showToast(
          '${json.decode(response.body)}', context, Colors.red, scaffoldKey);
      return false;
    }
  }

  Future checkCouponApi(GlobalKey<ScaffoldState> _scaffoldKey, int Id) async {
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + checkCoupon;
    var data = {"coupon": "12321"};
    var userToJson = json.encode(data);
    final response = await http.post(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: BaseToken
      },
      body: userToJson,
    );
    Map<String, dynamic> dataContent = json.decode(response.body);

    print("dataContent:: ${dataContent}");
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      print("body :" + json.decode(response.body).toString());
      return true;
    } else {
      print("body :" + json.decode(response.body).toString());
      FN_showToast(
          '${json.decode(response.body)}', context, Colors.red, scaffoldKey);
      return false;
    }
  }

  Future customersAddressesApi(
      GlobalKey<ScaffoldState> _scaffoldKey, String Id) async {
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + customersAddresses + Id;

    final response = await http.get(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: BaseToken
      },
    );
    Map<String, dynamic> dataContent = json.decode(response.body);

    print("dataContent:: ${dataContent}");
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      print("body :" + json.decode(response.body).toString());
      return UserAddresses.fromJson(dataContent);
    } else {
      print("body :" + json.decode(response.body).toString());
      FN_showToast(
          '${json.decode(response.body)}', context, Colors.red, scaffoldKey);
      return false;
    }
  }

  Future addOrderApi(GlobalKey<ScaffoldState> _scaffoldKey) async {
    XsProgressHud.show(context);
    final String completeUrl = baseUrl + basket;
    var data = {"order_id": "12321"};
    var userToJson = json.encode(data);
    final response = await http.post(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: BaseToken
      },
      body: userToJson,
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      print("body :" + json.decode(response.body).toString());
      return true;
    } else {
      print("body :" + json.decode(response.body).toString());
      FN_showToast(
          '${json.decode(response.body)}', context, Colors.red, scaffoldKey);
      return false;
    }
  }

  checkItemsInCart(ProductItem productItem){



    for(int x=0;x<cartList.length;x++){
      print("elementname  ${cartList[x].name}");
      if(productItem.id==cartList[x].id){
        print("increseeee");

          cartList[x].quantity +=1;


        return ;

      }

    }

      print ("add new ");
      cartList.add(CartModel(price:productItem.unitprice ,name:translator.currentLanguage == 'ar'
          ?productItem.productnameAr
          : "${productItem.productnameEn}",id: productItem.id,image:  productItem.photoUrl,quantity: 1 ));


  }
}
