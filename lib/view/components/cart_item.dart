import 'package:drb/controllers/cartitem_controller.dart';
import 'package:drb/services/cart_service.dart';
import 'package:drb/view/components/product_short.dart';
import 'package:drb/view/screens/FlavourList.dart';
import 'package:drb/view/screens/ListScreen.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class CartItem extends StatefulWidget{
  String productId;
  Function refresh;
  bool summaryView;

  CartItem({required this.productId, required this.refresh, this.summaryView = false});
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<CartItem>{
  CartItemController? con;

  PageState() : super(CartItemController()){
    con = controller as CartItemController;
  }

  @override
  void initState(){
    super.initState();
    con!.init(productId: widget.productId);
  }

  @override
  void didUpdateWidget(StatefulWidget oldWidget){
    super.didUpdateWidget(oldWidget);
    con!.init(productId: widget.productId);
  }

  @override
  Widget build(BuildContext context){
    return con!.loaded ? Column(
      children: [
        ProductShort(product: con!.product!),
        FlavourList(flavours: con!.flavours, product: con!.product!, static: true, refresh: refresh, summaryView: widget.summaryView,)
      ],
    ) : Text("Loading");
  }

  void refresh(){
    widget.refresh();
  }
}