import 'package:drb/models/cart_model.dart';

import '../models/flavour_model.dart';
import '../models/product_meta_model.dart';

class MyCart{
  static Map<dynamic, dynamic> products = {

  };

  static CartModel cart = CartModel();

  static void clearCart(){
    products = {};
  }

  static void printProducts(){
    print(products);
  }

  static void increaseCount({product, flavour}){
    putIfAbsent(flavour: flavour, product: product);
    products[product]['flavour'][flavour.id!]['count'] += 1;
  }

  static void decreaseCount({product, required Flavour flavour}) {
    putIfAbsent(flavour: flavour, product: product);
    if(products[product]['flavour'][flavour.id!]['count'] == 1){
      products[product]['flavour'].remove(flavour.id!);
    }
    else {
      products[product]['flavour'][flavour.id!]['count'] -= 1;
    }
  }

  static int getCount({product, required Flavour flavour}){
    if(products[product] == null){
      return 0;
    }
    if(products[product]['flavour'][flavour.id!] == null){
      return 0;
    }
    else{
      return products[product]['flavour'][flavour.id!]['count'];
    }
  }

  static double getTotalPrice({product}){
    if(products[product] == null){
      return 0.0;
    }else{
      return products[product]['total'];
    }
  }

  static int getTotalQty({product}){
    if(products[product] == null){
      return 0;
    }else{
      return products[product]['qty'];
    }
  }

  static putIfAbsent({product, required Flavour flavour}){
    if(products[product] == null){
      products[product] = {
        'flavour': {
          flavour.id!: {
            'count': 0,
            'model': flavour
          }
        },
        'total': 0.0,
        'qty': 0
      };
    }else if(products[product]['flavour'][flavour.id!] == null){
      products[product]['flavour'][flavour.id!] = {
        'count': 0,
        'model': flavour
      };
    }
  }

}