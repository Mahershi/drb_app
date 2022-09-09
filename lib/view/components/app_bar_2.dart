import 'package:drb/services/cart_service.dart';
import 'package:drb/utilities/global_vars.dart';
import 'package:drb/view/components/custom_spacer.dart';
import 'package:drb/view/components/icon_buttons.dart';
import 'package:flutter/material.dart';

import '../../utilities/constants.dart';

class CustomAppBar2 extends StatefulWidget{
  bool showCart;

  CustomAppBar2({this.showCart = true});
  @override
  PageState createState() => PageState();
}

class PageState extends State<CustomAppBar2>{
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            GlobalVars.currentStore!.name!,
            style: font.merge(TextStyle(
                fontSize: head2
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomIconButton(
                iconPath: 'assets/img/search.png',
                iconSize: appBarIconSize,
                iconColor: secondaryColor,
                onTap: (){},
              ),
              CustomSpacer(width: 30,),
              CustomIconButton(
                iconPath: 'assets/img/bag.png',
                iconSize: appBarIconSize,
                iconColor: secondaryColor,
                onTap: (){
                  if(widget.showCart){
                    GlobalVars.cartOpen = true;
                    Navigator.of(context).pushNamed('/CartScreen');
                  }
                },
              ),
              CustomSpacer(width: 30,),
              CustomIconButton(
                iconPath: 'assets/img/setting.png',
                iconSize: appBarIconSize,
                iconColor: secondaryColor,
                onTap: (){
                  Navigator.of(context).pushNamed('/SettingsScreen');
                },
              ),
              CustomSpacer(width: 30,),

              CustomIconButton(
                iconPath: 'assets/img/add.png',
                iconSize: appBarIconSize,
                iconColor: secondaryColor,
                onTap: (){
                  newSession();
                },
              ),

            ],
          )
        ],
      ),
    );
  }

  void newSession(){
    MyCart.clearCart();
    Navigator.of(context).pushNamedAndRemoveUntil('/HomeScreen', (route) => false);
  }
}