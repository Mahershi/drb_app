import 'package:drb/models/flavour_model.dart';
import 'package:drb/models/product_meta_model.dart';
import 'package:drb/services/cart_service.dart';
import 'package:drb/services/product_repo.dart';
import 'package:drb/view/components/alert_dialog.dart';
import 'package:drb/view/components/loader.dart';
import 'package:drb/view/screens/OrderSummary.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:drb/services/order_service.dart' as os;
import '../utilities/scripts.dart';

class CartController extends ControllerMVC{
  double subtotal = 0.0;
  double tax = 0.0;
  double total = 0.0;
  int qty = 0;

  Future<void> processCart() async{
    subtotal = 0.0;
    tax = 0.0;
    total = 0.0;
    qty = 0;

    for(var entry in MyCart.products.entries){
      subtotal += entry.value['total'];
      qty += entry.value['qty'] as int;
    }

    tax = 25/100 * subtotal;
    total = subtotal + tax;

    this.setState(() { });
  }

  void refresh(){
    processCart();
    this.setState(() { });
  }

  void placeOrder() async {
    Scripts.showLoader(this.state!.context);
    // await Future.delayed(Duration(seconds: 3));

    print("Placing order");
    List<Map<dynamic, dynamic>> order_details = [];
    for(var entry in MyCart.products.entries){
      Map<dynamic, dynamic> item = {};
      item['product'] = entry.key.toString();
      item['total'] = total.toStringAsFixed(2);
      item['qty'] = qty;
      item['subtotal'] = subtotal.toStringAsFixed(2);
      item['tax'] = tax.toStringAsFixed(2);
      item['flavours'] = [];

      for(var en in entry.value['flavour'].entries){
        item['flavours'].add(
          {
            'flavour_id': en.key,
            'count': en.value['count']
          }
        );
      }
      order_details.add(item);

      print(item);
    }
    print(order_details);
    var resp = await os.place_order(order_details: order_details);
    if(isSuccess(resp)){
      Navigator.of(this.state!.context).pushAndRemoveUntil(MaterialPageRoute(builder: (_){
        return OrderSummary(order_id: resp['data']['id'].toString(), total: resp['data']['total'], tax: resp['data']['tax'], subtotal: resp['data']['subtotal']);
      }), (route) => false);
    }
  }


}