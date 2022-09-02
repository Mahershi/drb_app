import 'package:drb/models/product_meta_model.dart';
import 'package:drb/utilities/global_vars.dart';
import 'package:drb/view/components/custom_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../utilities/scripts.dart';
import '../view/components/subcat_heading.dart';
import '../view/screens/ListScreen.dart';

class CategoryBodyController extends ControllerMVC{
  String? catId;
  List<Widget>? children;

  void init({catId}){
    this.catId = catId;
    children = [];
  }

  Future<void> fetchBody() async {
    print("Body fetch");
    if(GlobalVars.show_new!){
      var data = await GlobalVars.repoMap['new'](catId: catId);
      if(isSuccess(data)){
        List<ProductMeta> products = [];
        for(var inst in data['data']){
          var p = ProductMeta.fromJson(jsonMap: inst);
          products.add(p);
        }
        // for(var p in products){
        //   print(p.brand!.brand!);
        // }
        var wid = Column(
          children: [
            SubCatHeading(
                title: GlobalVars.new_label!,
                buttonTitle: '',
                onTap: (){}
            ),
            ListScreen(products: products,),
            CustomSpacer(height: 28,)
          ],
        );
        children!.add(wid);
      }

    }
    if(GlobalVars.show_popular!){
      var data = await GlobalVars.repoMap['popular'](catId: catId);
      if(isSuccess(data)){
        List<ProductMeta> products = [];
        for(var inst in data['data']){
          products.add(ProductMeta.fromJson(jsonMap: inst));
        }
        var wid = Column(
          children: [
            SubCatHeading(
                title: GlobalVars.popular_label!,
                buttonTitle: '',
                onTap: (){}
            ),
            ListScreen(products: products,),
          ],
        );
        children!.add(wid);
      }
    }
    if(GlobalVars.show_sale!){
      var data = await GlobalVars.repoMap['sale'](catId: catId);
      if(isSuccess(data)){
        List<ProductMeta> products = [];
        for(var inst in data['data']){
          products.add(ProductMeta.fromJson(jsonMap: inst));
        }
        var wid = Column(
          children: [
            SubCatHeading(
                title: GlobalVars.sale_label!,
                buttonTitle: '',
                onTap: (){}
            ),
            ListScreen(products: products,),
          ],
        );
        children!.add(wid);
      }
    }
    if(GlobalVars.show_strong!){
      var data = await GlobalVars.repoMap['strong'](catId: catId);
      if(isSuccess(data)){
        List<ProductMeta> products = [];
        for(var inst in data['data']){
          products.add(ProductMeta.fromJson(jsonMap: inst));
        }
        var wid = Column(
          children: [
            SubCatHeading(
                title: GlobalVars.strong_label!,
                buttonTitle: '',
                onTap: (){}
            ),
            ListScreen(products: products,),
          ],
        );
        children!.add(wid);
      }
    }
    this.state!.setState(() { });
  }

}