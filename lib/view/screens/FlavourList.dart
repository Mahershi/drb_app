import 'package:drb/controllers/flavour_controller.dart';
import 'package:drb/services/cart_service.dart';
import 'package:drb/utilities/constants.dart';
import 'package:drb/utilities/global_vars.dart';
import 'package:drb/view/components/custom_spacer.dart';
import 'package:drb/view/components/icon_buttons.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../models/flavour_model.dart';
import '../../models/product_meta_model.dart';

class FlavourList extends StatefulWidget{
  List<Flavour> flavours;
  ProductMeta product;
  bool static;
  Function? refresh;
  bool summaryView;

  FlavourList({required this.flavours, required this.product, this.static = false, this.refresh, this.summaryView = false});
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<FlavourList> with RouteAware{
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
  void didChangeDependencies(){
    super.didChangeDependencies();
    GlobalVars.routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose(){
    GlobalVars.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext(){
    super.didPopNext();
    setState(() { });
  }

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      shrinkWrap: widget.static,
      physics: widget.static ? NeverScrollableScrollPhysics() : AlwaysScrollableScrollPhysics(),
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
                  Visibility(
                    visible: !widget.summaryView,
                    child: CustomIconButton(
                        iconPath: 'assets/img/minus.png',
                        iconColor: Colors.black,
                        iconSize: body1,
                        onTap: (){
                          MyCart.decreaseCount(product: widget.flavours[index].product_id!, flavour: widget.flavours[index]);
                          con!.decreaseQt();
                          setState((){});
                          if(widget.static){
                            widget.refresh!();
                          }
                        }
                    ),
                  ),
                  CustomSpacer(width: 20,),
                  Text(
                    MyCart.getCount(product: widget.flavours[index].product_id!, flavour: widget.flavours[index]).toString(),
                    style: font.merge(TextStyle(
                      fontSize: body1
                    )),
                  ),
                  CustomSpacer(width: 20,),
                  Visibility(
                    visible: !widget.summaryView,
                    child: CustomIconButton(
                        iconPath: 'assets/img/add.png',
                        iconColor: Colors.black,
                        iconSize: body1,
                        onTap: (){
                          MyCart.increaseCount(product: widget.flavours[index].product_id!, flavour: widget.flavours[index]);
                          con!.increaseQt();
                          setState((){});
                          if(widget.static){
                            widget.refresh!();
                          }
                        }
                    ),
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