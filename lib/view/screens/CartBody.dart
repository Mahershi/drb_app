import 'package:drb/controllers/cart_controller.dart';
import 'package:drb/services/cart_service.dart';
import 'package:drb/utilities/constants.dart';
import 'package:drb/view/components/cart_item.dart';
import 'package:drb/view/components/custom_spacer.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class CartBody extends StatefulWidget{
  Function refresh;
  Function placeOrder;
  bool summaryView;

  CartBody({required this.refresh, required this.placeOrder, this.summaryView = false});
  @override
  PageState createState() => PageState();
}

class PageState extends State<CartBody>{

  @override
  Widget build(BuildContext context){
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ListView.builder(
          itemBuilder: (context, index){
            return Container(
              padding: index == MyCart.products.keys.length - 1 ? EdgeInsets.only(bottom: 50) : EdgeInsets.zero,
              child: CartItem(productId: MyCart.products.keys.toList()[index], refresh: widget.refresh, summaryView: widget.summaryView,)
            );
          },
          itemCount: MyCart.products.keys.length,
        ),
        ! widget.summaryView ? InkWell(
          onTap: (){
            widget.placeOrder();
          },
          child: Container(
            padding: ei20,
            decoration: BoxDecoration(
              borderRadius: borderRadius12,
              color: secondaryColor
            ),
            child: Text(
              "Place Order",
              style: font.merge(TextStyle(
                fontSize: body3,
                color: secondaryTextColor
              )),
            )
          ),
        ) : Container()
      ],
    );
  }

  // void refresh(){
  //   this.setState(() { });
  // }
}