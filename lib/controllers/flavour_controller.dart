import 'package:drb/services/cart_service.dart';
import 'package:drb/utilities/scripts.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../models/product_meta_model.dart';

class FlavourController extends ControllerMVC{
  List<double> prices = [];
  List<int> qty = [];
  int quantity_orders = 0;
  double total_price = 0;
  ProductMeta? product;

  void init({required ProductMeta pr}){
    this.product = pr;
    this.quantity_orders = MyCart.getTotalQty(product: this.product!.id!);
    this.total_price = MyCart.getTotalPrice(product: this.product!.id!);
    print("Price: " + this.total_price.toString());
    print("Qty: " + this.quantity_orders.toString());
  }

  void getDiscountList({required ProductMeta product}){
    var l = Scripts.discountToList(discounts: product.discounts);
    prices = l[0];
    qty = l[1];

    prices.insert(0, double.parse(product.price!));
    qty.insert(0, 1);
    
    prices = List.from(prices.reversed);
    qty = List.from(qty.reversed);
    print("Prices");
    print(prices);
    print("QTY");
    print(qty);
  }

  void increaseQt(){
    quantity_orders += 1;
    applyDiscPrice();
  }

  void decreaseQt(){
    quantity_orders -=1;
    applyDiscPrice();
  }

  void applyDiscPrice(){
    this.total_price = 0;
    int count = this.quantity_orders;
    // for(var i=)
    for(var i=0; i<this.prices.length; i++){
      if(count >= this.qty[i]){
        count -= this.qty[i];
        this.total_price += this.prices[i];
        i --;
      }
    }

    print(this.quantity_orders);
    print(this.total_price);

    if(this.quantity_orders == 0){
      MyCart.products.remove(this.product!.id!);
    }else{
      MyCart.products[this.product!.id!]['total'] = this.total_price;
      MyCart.products[this.product!.id!]['qty'] = this.quantity_orders;
    }
    MyCart.printProducts();
  }
}