
import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';


import 'package:provider/provider.dart';
import 'package:touirst_guide_project/Screens/PackageBookingpage/pages/orderemptyscreen.dart';
import 'package:touirst_guide_project/Screens/PackageBookingpage/provider/packagebookprovider.dart';
import 'package:touirst_guide_project/Screens/PackageBookingpage/widgets/orderwidget.dart';
import 'package:touirst_guide_project/Screens/ProfileScreen/userprovider.dart';
import '../../../ExtraScreens/loadingscreen.dart';

class MyOrdersScreen extends StatefulWidget { 
    static const routeName = 'all_orders_screen';
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
    @override
  void initState() {
     final userProvider = Provider.of<UserProvider>(context, listen: false);
    Provider.of<OrderProvider>(context, listen: false)
        .getAllOrdersData(context: context, userid: userProvider.currentUserId);
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final order=Provider.of<OrderProvider>(context);
    return Scaffold(
        appBar: AppBar(
        
        leading:  IconButton(onPressed: (){
          Navigator.pop(context);
        // ignore: prefer_const_constructors
        },icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.green,
        title: const Text('My Orders',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
      ),
    body:SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              SizedBox(height: size.height*0.01),
     Padding(
       padding: const EdgeInsets.only(left: 30),
       child: Text('My Orders Nears You',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
     ),
            SizedBox(height: size.height*0.01),
       
               FadeInUp(
                duration: const Duration(milliseconds: 1500),
                 child: order.loadingSpinner
                              ? const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    LoadingScreen(title: 'Loading'),
                                    CircularProgressIndicator(
                                      color:Colors.green,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                 
                                  ],
                                )
                              : order.orders.isEmpty
                                  ? OrderEmptyScreen()
                                  : SizedBox(
                                      //height: size.height * 0.6,
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                        itemCount: order.orders.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                     
                        itemBuilder: (context, index) {
                          return AllOrdersWidget(
                           orderid: order.orders[index].orderId,
                           packageid: order.orders[index].packageId,
                           packagename: order.orders[index].packageName,
                           price: order.orders[index].totalPrice,
                           description: order.orders[index].activities,
                           orderstatus: order.orders[index].status,
                           orderDate: order.orders[index].date,
                           image: order.orders[index].photo,
                           
                 
                           
                         
                          
                            );
                        },
                      )
                                    ),
               ),
            
          ],
        ),
      ),
    ),  
    );
  }
}