import 'package:drb/services/brand_repo.dart';
import 'package:drb/services/categories_repo.dart';
import 'package:drb/services/settings_repo.dart';
import 'package:drb/utilities/global_vars.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:drb/services/user_repo.dart' as ur;

import '../models/brand_model.dart';
import '../models/category_model.dart';
import '../models/discount_model.dart';
import '../models/user_model.dart';
import '../utilities/scripts.dart';

class LoginController extends ControllerMVC{
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> login() async{
    var resp = await ur.login(username: username.value.text, password: password.value.text);
    if(isSuccess(resp)){
      GlobalVars.currentUser = User.fromJson(jsonMap: resp['data']['user'], token: resp['data']['token']);
      print(GlobalVars.currentUser!.username);

      await getBrands();
      await getCategories();
      await getDiscount();

      Navigator.of(this.state!.context).pushNamedAndRemoveUntil('/HomeScreen', (route) => false);
    }else{
      print("Failed");
    }
  }

  Future<void> getBrands() async{
    GlobalVars.brands = [];
    var resp = await fetchBrands();
    if(isSuccess(resp)){
      for(var inst in resp['data']){
        GlobalVars.brands!.add(Brand.fromJson(jsonMap: inst));
      }
    }

  }

  Future<void> getCategories() async{
    GlobalVars.categories = [];
    var resp = await fetchCategories();
    if(isSuccess(resp)){
      for(var inst in resp['data']){
        GlobalVars.categories!.add(Category.fromJson(jsonMap: inst));
      }
    }
  }

  Future<void> getDiscount() async{
    GlobalVars.discounts = [];
    var resp = await fetchDiscounts();

    if(isSuccess(resp)){
      for(var inst in resp['data']){
        GlobalVars.discounts!.add(Discount.fromJson(jsonMap: inst));
      }
    }
    print("Discounts");
    for(var b in GlobalVars.discounts!){
      print(b.dis_price! + " " + b.qty! + " " + b.id!);
    }
  }
}