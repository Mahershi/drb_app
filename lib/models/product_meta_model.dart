import 'dart:ffi';

import '../utilities/custom_trace.dart';
import 'brand_model.dart';
import 'category_model.dart';
import 'discount_model.dart';

class ProductMeta{
  String? id;

  Brand? brand;
  Category? category;
  String? nic;
  String? size;
  String? nic_unit;
  String? size_unit;

  String? price;
  String? sale_price;

  bool? on_sale;
  bool? strong;
  bool? popular;

  int? priority;

  String? image_url;

  List<Discount> discounts = [];

  ProductMeta.fromJson({jsonMap}){
    print("\nJSONMAP");
    try{
      for(var inst in jsonMap['discount']){
        this.discounts.add(Discount.getById(id: inst['id'].toString()));
      }

      this.brand = Brand.getById(id: jsonMap['brand']['id'].toString());
      this.category = Category.getById(id: jsonMap['category']['id'].toString());

      this.nic = jsonMap['nic'] ?? '';
      this.size = jsonMap['size'] ?? '';
      this.nic_unit = jsonMap['nic_unit']['unit_label'] ?? '';
      this.size_unit = jsonMap['size_unit']['unit_label'] ?? '';

      this.price = jsonMap['price'].toString() ?? '';
      this.sale_price = jsonMap['sale_price'].toString() ?? '';
      this.on_sale = jsonMap['on_sale'] ?? false;
      this.priority = jsonMap['priority'] ?? 0;
      this.popular = jsonMap['popular'] ?? false;
      this.strong = jsonMap['strong'] ?? false;

      this.image_url = jsonMap['image'] ?? '';
      print(this.image_url);
      print(this.brand!.brand);

    }
    catch(e){
      CustomTrace(StackTrace.current, message: e.toString());
    }
  }
}