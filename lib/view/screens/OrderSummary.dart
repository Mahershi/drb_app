import 'package:drb/services/cart_service.dart';
import 'package:flutter/material.dart';

import '../../utilities/constants.dart';
import '../components/app_bar_2.dart';
import '../components/custom_spacer.dart';
import 'CartBody.dart';

class OrderSummary extends StatefulWidget{
  String subtotal;
  String tax;
  String total;
  String order_id;

  OrderSummary({required this.total, required this.tax, required this.subtotal, required this.order_id});
  @override
  PageState createState() => PageState();
}

class PageState extends State<OrderSummary>{
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
                child: Container(
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    child: Text(
                                      "Order Summary",
                                      style: font.merge(TextStyle(
                                          fontSize: head2
                                      )),
                                    )
                                ),
                                CustomSpacer(height: 20,),
                                Container(
                                    child: Text(
                                      "# " + widget.order_id,
                                      style: font.merge(TextStyle(
                                          fontSize: head2,
                                        fontWeight: FontWeight.w700
                                      )),
                                    )
                                ),

                              ],
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
                                      "\$ " + widget.subtotal,
                                      style: font.merge(TextStyle(
                                          fontSize: body1,
                                          letterSpacing: 1.1

                                        // fontWeight: FontWeight.w600
                                      )),
                                    ),
                                    CustomSpacer(height: 10,),
                                    Text(
                                      "\$ " + widget.tax,
                                      style: font.merge(TextStyle(
                                          fontSize: body1,
                                          letterSpacing: 1.1

                                        // fontWeight: FontWeight.w600
                                      )),
                                    ),
                                    CustomSpacer(height: 20,),
                                    Text(
                                      '\$ ' + widget.total,
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
                        Expanded(
                            child: CartBody(refresh: (){}, placeOrder: (){}, summaryView: true,)
                        )
                      ]
                  ),
                )

            ),
        ]
      )
    ));
  }
}