
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:touirst_guide_project/CategoryScreen/categoryscreen.dart';
import 'package:touirst_guide_project/Screens/PackageBookingpage/pages/orderscreen.dart';
import 'package:touirst_guide_project/Screens/ProfileScreen/profilescreen.dart';
import 'package:touirst_guide_project/Screens/ViewPackageScreen/pages/viewpackagescreen.dart';




class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final pages = [const ViewPackageScreen(), const CategoryScreen(), const MyOrdersScreen(), const ProfilePage()];
  int currentPageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     
     
      body: pages[currentPageIndex],
    bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      unselectedIconTheme:IconThemeData(color: Colors.grey),
 // backgroundColor:appbarRightColor,
  type: BottomNavigationBarType.fixed,
  currentIndex: currentPageIndex,
  onTap: (index) {
    setState(() {
      currentPageIndex = index;
    });
  },
  selectedLabelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold), 
  unselectedLabelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),// Set the color for the selected label text
  items:  [
    BottomNavigationBarItem(
      backgroundColor: Colors.black,
      icon: Icon(EvaIcons.homeOutline,color: Colors.grey,),
      label: "Home",
      activeIcon: Icon(EvaIcons.home,color:Colors.green),
    ),
    BottomNavigationBarItem(
      icon: const Icon(EvaIcons.bookOutline,color: Colors.grey,),
      label: "Category",
      activeIcon: Icon(EvaIcons.book,color:Colors.green),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.event,color:  Colors.grey,),
      label: "Booking",
      activeIcon: Icon(Icons.event_outlined,color: Colors.green),
    ),
    BottomNavigationBarItem(
      icon: Icon(EvaIcons.personOutline,color: Colors.grey,),
      label: "Profile",
      activeIcon: Icon(EvaIcons.person,color:Colors.green),
    ),
  ],
),

    );
  }
}
