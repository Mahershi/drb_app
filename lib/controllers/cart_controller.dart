import 'package:drb/models/flavour_model.dart';
import 'package:drb/models/product_meta_model.dart';
import 'package:drb/services/cart_service.dart';
import 'package:drb/services/product_repo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../utilities/scripts.dart';

class CartController extends ControllerMVC{
  Future<void> processCart() async{
    // ProductMeta? curProd;
    // for(var prod in MyCart.products.keys){
    //   int count = 0;
    //   ProductMeta? temp;
    //   for(Flavour flav in MyCart.products[prod].keys){
    //     print("Flavour: " + flav.flavour! + ": " + MyCart.products[prod][flav].toString());
    //     if(MyCart.products[prod][flav] > 0){
    //       count += MyCart.products[prod][flav] as int;
    //       var resp = await getProduct(prod_id: prod);
    //       if(isSuccess(resp)){
    //         temp = ProductMeta.fromJson(jsonMap: resp['data']);
    //         if(MyCart.cart.products![temp] == null){
    //           MyCart.cart.products![temp] = {
    //             'flavours': [],
    //             'final': 0
    //           };
    //         }
    //         MyCart.cart.products![temp]!['flavours'].add(flav);
    //       }
    //
    //     }
    //   }
    //   if(count > 0){
    //     var final_price = applyDiscount(prod: temp!, count: count);
    //     MyCart.cart.products![temp]!['final'] = final_price;
    //
    //   }
    // }
  }

  dynamic applyDiscount({required ProductMeta prod, count}){
    var qty = [];
    var price = [];
    for(var dis in prod.discounts){
      qty.add(dis.qty);
      price.add(dis.dis_price);
    }
    print(qty);
    print(price);

    return 0;
  }
}