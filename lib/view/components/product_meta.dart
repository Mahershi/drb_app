import 'package:drb/app_config.dart';
import 'package:drb/utilities/constants.dart';
import 'package:drb/view/components/custom_spacer.dart';
import 'package:flutter/material.dart';

import '../../models/product_meta_model.dart';


class ProductMetaView extends StatelessWidget{
  ProductMeta product;

  ProductMetaView({required this.product});
  @override
  Widget build(BuildContext context){
    return Container(
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: borderRadius20
                ),
                child: ClipRRect(
                  borderRadius: borderRadius20,
                  child: Image.network(
                    AppConfig.config.baseUrl + product.image_url!,
                  ),
                ),
              ),
              CustomSpacer(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.brand!.brand! + ' ' + product.category!.category! + " " + product.size! + " " + product.size_unit!,
                    style: font.merge(TextStyle(
                        fontSize: head3
                    )),
                  ),
                  CustomSpacer(height: 10,),
                  Text(
                    product.nic! + " " + product.nic_unit!,
                    style: font.merge(TextStyle(
                        fontSize: body1
                    )),
                  ),
                  CustomSpacer(height: 20,),

                  Row(
                    children: [
                      Text(
                        "\$ ",
                        style: font.merge(TextStyle(
                            fontSize: head4,
                          fontWeight: FontWeight.w600
                        )),
                      ),
                      product.on_sale! ? Row(
                        children: [
                          Text(
                            product.price!,
                            style: font.merge(TextStyle(
                                fontSize: head4,
                                fontWeight: FontWeight.w600,
                              decoration: TextDecoration.lineThrough
                            )),
                          ),
                          CustomSpacer(width: 10,),
                          Text(
                            product.sale_price!,
                            style: font.merge(TextStyle(
                                fontSize: head4,
                                fontWeight: FontWeight.w600,
                            )),
                          ),
                        ],
                      ) : Text(
                        product.price!,
                        style: font.merge(TextStyle(
                            fontSize: head4,
                            fontWeight: FontWeight.w600,
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              // border: testBorder
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: product.discounts!.map((e){
                return Container(
                  padding: ei4,
                  child: Text(
                    e.qty! + " for \$ " + e.dis_price!,
                    style: font.merge(TextStyle(
                      fontSize: body1,
                      fontWeight: FontWeight.w600
                    )),
                  )
                );
              }).toList(),
            ),
          )
        ],
      )
    );
  }
}