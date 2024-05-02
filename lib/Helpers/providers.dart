

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:touirst_guide_project/CategoryScreen/provider/categoryprovider.dart';
import 'package:touirst_guide_project/Screens/PackageBookingpage/provider/packagebookprovider.dart';
import 'package:touirst_guide_project/Screens/ProfileScreen/userprovider.dart';
import 'package:touirst_guide_project/Screens/ViewPackageScreen/provider/tourpackageprovider.dart';

List<SingleChildWidget> multiprovider = [
  ChangeNotifierProvider(create: (context)=>PackageProvider()),
  ChangeNotifierProvider(create: (context) => CategoryProvider()),
  ChangeNotifierProvider(create: (context)=>UserProvider()),
  ChangeNotifierProvider(create: (context)=>OrderProvider())

];
