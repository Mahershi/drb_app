import 'package:drb/controllers/flavourbase_controller.dart';
import 'package:drb/view/components/custom_spacer.dart';
import 'package:drb/view/components/product_meta.dart';
import 'package:drb/view/screens/FlavourGrid.dart';
import 'package:drb/view/screens/FlavourList.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../models/product_meta_model.dart';
import '../../utilities/constants.dart';
import '../components/app_bar_2.dart';


class FlavoursBaseScreen extends StatefulWidget{
  ProductMeta product;

  FlavoursBaseScreen({required this.product});
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<FlavoursBaseScreen>{
  FlavourBaseController? con;

  PageState() : super(FlavourBaseController()){
    con = controller as FlavourBaseController;
  }

  bool gridView = false;

  @override
  void initState(){
    super.initState();
    print("PI: ");
    print(widget.product.id!);
    con!.getFlavours(product: widget.product);
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
                child: CustomAppBar2()
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
                    padding: ei20,
                    width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width * navFraction,
                    decoration: BoxDecoration(
                      // border: testBorder
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: radius30, topRight: radius30)
                    ),
                    child: Column(
                      children: [
                        ProductMetaView(product: widget.product,),
                        CustomSpacer(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Flavours",
                              style: font.merge(TextStyle(
                                fontSize: body1,
                                color: primaryTextColor
                              )),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.,
                              children: [
                                InkWell(
                                  onTap: (){
                                    this.setState(() {
                                      gridView = !gridView;
                                    });
                                  },
                                  child: Container(
                                    padding: ei4,
                                    decoration: BoxDecoration(
                                      color: gridView ? Colors.transparent : primaryColor,
                                      borderRadius: borderRadius12
                                    ),
                                    child: Icon(
                                      Icons.list_outlined
                                    )
                                  ),
                                ),
                                CustomSpacer(width: 20,),
                                InkWell(
                                  onTap: (){
                                    this.setState(() {
                                      gridView = !gridView;
                                    });
                                  },
                                  child: Container(
                                    padding: ei4,
                                    decoration: BoxDecoration(
                                        color: !gridView ? Colors.transparent : primaryColor,
                                        borderRadius: borderRadius12
                                    ),
                                    child: Icon(
                                      Icons.grid_view_outlined
                                    )
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        CustomSpacer(height: 20,),
                        Expanded(
                          child: gridView ? FlavourList(flavours: con!.flavours, product: widget.product,) : FlavourList(flavours: con!.flavours, product: widget.product,)
                        )
                      ],
                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}