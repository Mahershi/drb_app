import 'package:drb/controllers/homescreen_controller.dart';
import 'package:drb/models/user_model.dart';

import '../models/brand_model.dart';
import '../models/category_model.dart';
import '../models/discount_model.dart';
import '../models/store_model.dart';

import 'package:drb/services/product_repo.dart' as pr;

class GlobalVars{
  static List<Discount>? discounts;
  static List<Store>? stores;
  static Store? currentStore;
  static User? currentUser;
  static List<Category>? categories;
  static List<Brand>? brands;
  static HomeScreenController? hsCon;
  static bool? show_strong;
  static bool? show_new;
  static bool? show_popular;
  static bool? show_sale;
  static String? sale_label;
  static String? popular_label;
  static String? strong_label;
  static String? new_label;

  static Map<String, dynamic> repoMap = {
    'strong': pr.fetchStrong,
    'new': pr.fetchNew,
    'popular': pr.fetchPopular,
    'sale': pr.fetchOnSale
  };
}