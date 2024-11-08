import 'package:crafty_bay/presentation/screens/category_list_screen.dart';
import 'package:crafty_bay/presentation/screens/home_screen.dart';
import 'package:crafty_bay/presentation/screens/wish_list_screen.dart';
import 'package:crafty_bay/presentation/state_holder/category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/home_slider_controller.dart';
import 'package:crafty_bay/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holder/new_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/popular_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/special_product_list_controller.dart';
import 'package:crafty_bay/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'card_list_screen.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  final MainBottomNavBarController _navBarController =
  Get.find<MainBottomNavBarController>();

  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Get.find<HomeSliderController>().getSliders();
    Get.find<CategoryListController>().getCategoryList();
    Get.find<PopularProductListController>().getPopularProductList();
    Get.find<NewProductListController>().getNewProductList();
    Get.find<SpecialProductListController>().getSpecialProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavBarController>(
        builder: (_) {
          return _screens[_navBarController.selectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavBarController>(
          builder: (_) {
            return BottomNavigationBar(
              currentIndex: _navBarController.selectedIndex,
              onTap: _navBarController.changeIndex,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Category'),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
                BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_rounded), label: 'Wishlist'),
              ],
            );
          }
      ),
    );
  }
}