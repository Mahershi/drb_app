import 'package:drb/services/cart_service.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../models/flavour_model.dart';
import '../models/product_meta_model.dart';
import 'package:drb/services/product_repo.dart' as pr;
import 'package:drb/services/flavour_repo.dart' as fr;

import '../utilities/scripts.dart';

class CartItemController extends ControllerMVC{
  ProductMeta? product;
  List<Flavour> flavours = [];
  // List<int> qty = [];
  // double total = 0.0;
  bool loaded = false;

  Future<void> init({required String productId}) async{
    this.flavours = [];
    // this.total = MyCart.products[productId]['total'];
    this.product = ProductMeta.fromJson(jsonMap: (await getProductMeta(productId: productId)));


    for(var entry in MyCart.products[productId]['flavour'].entries){
      var resp = await getFlavour(flavourId: entry.key, catId: this.product!.category!.id!);
      // this.qty.add(entry.value['count']);
      this.flavours.add(Flavour.fromJson(jsonMap: resp));
    }

    print("Flavours");
    for(var f in this.flavours){
      print(f.flavour!);
    }
    // print(this.qty);
    // print(this.total);
    this.setState(() {
      loaded = true;
    });
  }

  Future<dynamic> getProductMeta({required String productId}) async {
    var resp = await pr.getProduct(prod_id: productId);
    if(isSuccess(resp)){
      return resp['data'];
    }
    return null;
  }

  Future<dynamic> getFlavour({required String flavourId, required String catId}) async {
    print("CAT ID: " + catId);
    var resp = await Scripts.flavourFetchMap[catId](flavourId: flavourId);
    if(isSuccess(resp)){
      return resp['data'];
    }
    return null;
  }

}