import 'package:drb/services/cart_service.dart';
import 'package:drb/utilities/constants.dart';
import 'package:drb/view/components/custom_spacer.dart';
import 'package:flutter/material.dart';

import '../../models/product_meta_model.dart';

class ProductShort extends StatefulWidget{
  ProductMeta product;

  ProductShort({required this.product});

  @override
  PageState createState() => PageState();
}

class PageState extends State<ProductShort>{
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius12,
        color: primaryColor.withOpacity(0.5)
      ),
      padding: ei16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.brand!.brand!,
                style: font.merge(TextStyle(
                  fontSize: head4
                )),
              ),
              CustomSpacer(height: 8,),
              Text(
                widget.product.size! + " " + widget.product.size_unit! + " " + widget.product.nic! + widget.product.nic_unit!,
                style: font.merge(TextStyle(
                    fontSize: body2
                )),
              )
            ],
          ),
          Text(
            '\$ ' + MyCart.products[widget.product.id!]['total'].toStringAsFixed(2),
            style: font.merge(TextStyle(
                fontSize: head4,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.1
            )),
          )
        ],
      )
    );
  }

}