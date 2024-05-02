



import 'package:flutter/material.dart';
import 'package:touirst_guide_project/CategoryScreen/categoryscreen.dart';
import 'package:touirst_guide_project/Screens/PackageBookingpage/pages/orderscreen.dart';
import 'package:touirst_guide_project/Screens/PackageDetailsScreen/packagedetailsscreen.dart';
import 'package:touirst_guide_project/Screens/ViewPackageScreen/pages/viewpackagescreen.dart';



var customRoutes = <String, WidgetBuilder>{
    'all_category_screen': (context) => const CategoryScreen(),
    'all_package_screen':(context)=>const ViewPackageScreen(),
     'all_orders_screen':(context)=>const MyOrdersScreen(),
        'package_details_screen': (context) {
           String id = ModalRoute.of(context)!.settings.arguments.toString();
           return PackageDetailsScreen(
           id: id,
    ); 
  },
       
};
