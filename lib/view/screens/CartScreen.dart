import 'package:drb/controllers/cart_controller.dart';
import 'package:drb/services/cart_service.dart';
import 'package:drb/utilities/global_vars.dart';
import 'package:drb/view/components/custom_spacer.dart';
import 'package:drb/view/screens/CartBody.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../utilities/constants.dart';
import '../components/app_bar_2.dart';

class CartScreen extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<CartScreen> with RouteAware{
  CartController? con;

  PageState() : super(CartController()){
    con = controller as CartController;
  }

  @override
  void initState(){
    super.initState();
    con!.processCart();
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    GlobalVars.routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void didPushNext(){
    super.didPushNext();
    GlobalVars.cartOpen = false;
  }

  @override
  void didPopNext(){
    super.didPopNext();
    GlobalVars.cartOpen = false;
  }

  @override
  void dispose(){
    GlobalVars.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
          backgroundColor: primaryColor,
          body: Column(
          children: [
            Container(
                padding: ei20,
                child: CustomAppBar2(showCart: false,)
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: eiTop40,
                    // alignment: Alignment.center,
                    width: 50,
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.chevron_left,
                        size: head2,
                      ),
                    ),
                  ),
                  Container(
                    padding: ei30,
                    width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width * navFraction,
                    decoration: BoxDecoration(
                      // border: testBorder
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: radius30, topRight: radius30)
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "My Cart",
                                style: font.merge(TextStyle(
                                  fontSize: head2
                                )),
                              )
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Subtotal",
                                      style: font.merge(TextStyle(
                                        fontSize: body2,
                                        // fontWeight: FontWeight.w600
                                      )),
                                    ),
                                    CustomSpacer(height: 10,),
                                    Text(
                                      "Tax",
                                      style: font.merge(TextStyle(
                                        fontSize: body2,
                                        // fontWeight: FontWeight.w600
                                      )),
                                    ),

                                  ],
                                ),
                                CustomSpacer(width: 40,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "\$ " + con!.subtotal.toStringAsFixed(2),
                                      style: font.merge(TextStyle(
                                        fontSize: body1,
                                          letterSpacing: 1.1

                                        // fontWeight: FontWeight.w600
                                      )),
                                    ),
                                    CustomSpacer(height: 10,),
                                    Text(
                                      "\$ " + con!.tax.toStringAsFixed(2),
                                      style: font.merge(TextStyle(
                                          fontSize: body1,
                                          letterSpacing: 1.1

                                        // fontWeight: FontWeight.w600
                                      )),
                                    ),
                                    CustomSpacer(height: 20,),
                                    Text(
                                      '\$ ' + con!.total.toStringAsFixed(2),
                                      style: font.merge(TextStyle(
                                        fontSize: head1,
                                        fontWeight: FontWeight.w600,
                                          letterSpacing: 1.1

                                      )),
                                    )
                                  ],
                                )
                              ],
                            ),



                          ],
                        ),
                        CustomSpacer(height: 20,),
                        con!.qty > 0? Expanded(
                          child: CartBody(refresh: con!.refresh, placeOrder: con!.placeOrder,)
                        ) : Container(
                          child: Text("Empty")
                        )
                      ],
                    )
                  ),
                  Container(
                    width: 50,
                    child: Visibility(
                      visible: false,
                      child: Container(
                        width: 50,
                        child: Icon(
                          Icons.chevron_left,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      )
    );
  }
}