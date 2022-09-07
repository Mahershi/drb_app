import 'package:drb/controllers/flavour_controller.dart';
import 'package:drb/services/cart_service.dart';
import 'package:drb/utilities/constants.dart';
import 'package:drb/view/components/custom_spacer.dart';
import 'package:drb/view/components/icon_buttons.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../models/flavour_model.dart';
import '../../models/product_meta_model.dart';

class FlavourList extends StatefulWidget{
  List<Flavour> flavours;
  ProductMeta product;

  FlavourList({required this.flavours, required this.product});
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<FlavourList>{
  FlavourController? con;
  PageState() : super(FlavourController()){
    con = controller as FlavourController;
  }

  @override
  void initState(){
    super.initState();
    con!.init(pr: widget.product);
    con!.getDiscountList(product: widget.product);
  }

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: widget.flavours.length,
      itemBuilder: (context, index){
        return Container(
          // height: 200,
          padding: ei20,
          decoration: BoxDecoration(
            // border: testBorder
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.flavours[index].flavour!,
                style: font.merge(TextStyle(
                  fontSize: body2
                )),
              ),
              Row(
                children: [
                  CustomIconButton(
                      iconPath: 'assets/img/minus.png',
                      iconColor: Colors.black,
                      iconSize: body1,
                      onTap: (){
                        MyCart.decreaseCount(product: widget.flavours[index].product_id!, flavour: widget.flavours[index]);
                        con!.decreaseQt();
                        setState((){});
                      }
                  ),
                  CustomSpacer(width: 20,),
                  Text(
                    MyCart.getCount(product: widget.flavours[index].product_id!, flavour: widget.flavours[index]).toString(),
                    style: font.merge(TextStyle(
                      fontSize: body1
                    )),
                  ),
                  CustomSpacer(width: 20,),
                  CustomIconButton(
                      iconPath: 'assets/img/add.png',
                      iconColor: Colors.black,
                      iconSize: body1,
                      onTap: (){
                        MyCart.increaseCount(product: widget.flavours[index].product_id!, flavour: widget.flavours[index]);
                        con!.increaseQt();
                        setState((){});
                      }
                  )
                ],
              )
            ],
          )
        );
      },
    );
  }
}