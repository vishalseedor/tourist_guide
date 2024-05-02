
import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:touirst_guide_project/Screens/PackageBookingpage/pages/globalsnackbar.dart';
import 'package:touirst_guide_project/Screens/PackageBookingpage/pages/productsnackbar.dart';
import 'package:touirst_guide_project/Screens/PackageBookingpage/provider/packagebookprovider.dart';
import 'package:touirst_guide_project/Screens/ProfileScreen/userprovider.dart';
import 'package:touirst_guide_project/Screens/ViewPackageScreen/provider/tourpackageprovider.dart';


class PackageDetailsScreen extends StatefulWidget {
static const routeName = 'package_details_screen';
  final String id;
  const PackageDetailsScreen({super.key,
  required this.id});



  @override
  State<PackageDetailsScreen> createState() => _PackageDetailsScreenState();
}

class _PackageDetailsScreenState extends State<PackageDetailsScreen> {
  

  // late TapGestureRecognizer readMoreGestureRecognizer;
  // bool showMore = false;

  // @override
  // void initState() {
  //   super.initState();
  //   readMoreGestureRecognizer = TapGestureRecognizer()
  //     ..onTap = () {
  //       setState(() {
  //         showMore = !showMore;
  //       });
  //     };
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   readMoreGestureRecognizer.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    GlobalSnackBar _snackBar =GlobalSnackBar();
  ProductSnackBar _productSnackBar=ProductSnackBar();
      final garden = Provider.of<PackageProvider>(context,listen: false);
       final user=Provider.of<UserProvider>(context,listen: false);
      final order=Provider.of<OrderProvider>(context,listen: false);
      final gardenData =
        Provider.of<PackageProvider>(context).products.firstWhere((element) => element.id == widget.id);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tour Package Details",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(IconlyLight.buy),
        //   ),
        // ],
      ),
      body: FadeInUp(
        duration: const Duration(milliseconds: 1500),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              height: 250,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(gardenData.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Text(
              gardenData.packageName,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold,fontSize: 19),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
                
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "₹ ${gardenData.totalPrice}",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold,fontSize: 18)),
                      TextSpan(
                          text: "  /  ${gardenData.foodIncluded}",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold,color: Colors.green)),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 16,
                  color: Colors.yellow.shade800,
                ),
                Text(
                  "${gardenData.noOfDays} (192)",
                ),
                const Spacer(),
                // SizedBox(
                //   height: 30,
                //   width: 30,
                //   child: IconButton.filledTonal(
                //     padding: EdgeInsets.zero,
                //     onPressed: () {},
                //     iconSize: 18,
                //     icon: const Icon(Icons.remove),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 12),
                //   child: Text(
                //     "2 ${gardenData.unitType}",
                //     style: Theme.of(context).textTheme.titleMedium!.copyWith(
                //           fontWeight: FontWeight.bold,
                //         ),
                //   ),
                // ),
                // SizedBox(
                //   height: 30,
                //   width: 30,
                //   child: IconButton.filledTonal(
                //     padding: EdgeInsets.zero,
                //     onPressed: () {},
                //     iconSize: 18,
                //     icon: const Icon(Icons.add),
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 20),
            Text("Description",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
        
            Text(gardenData.activities),
            // RichText(
            //   text: TextSpan(
            //     style: Theme.of(context).textTheme.bodyMedium,
            //     children: [
            //       TextSpan(
            //         text: showMore
            //             ? gardenData.description
            //             : '${gardenData.description.substring(0, gardenData.description.length - 100)}...',
            //       ),
            //       TextSpan(
            //         recognizer: readMoreGestureRecognizer,
            //         text: showMore ? " Read less" : " Read more",
            //         style: TextStyle(
            //           color: Theme.of(context).colorScheme.primary,
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Package Details",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                     const SizedBox(height: 10),
                Text('Hotel Name : ${gardenData.hotel}', style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),),
                   Text('Transporation Included : ${gardenData.transportationIncluded}', style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),),
                   Text('Package Name: ${gardenData.packageName}', style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),),
                   Text('Food Included : ${gardenData.foodIncluded}', style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),),
                   Text('No Of Days : ${gardenData.noOfDays}', style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
           
            // SizedBox(
            //   height: 90,
            //   child: ListView.separated(
            //     physics: const BouncingScrollPhysics(),
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) {
            //       return Container(
            //         height: 90,
            //         width: 80,
            //         margin: const EdgeInsets.only(bottom: 16),
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //             image: NetworkImage(gardenData.photo),
            //             fit: BoxFit.cover,
            //           ),
            //           borderRadius: BorderRadius.circular(8),
            //         ),
            //       );
            //     },
            //     separatorBuilder: (__, _) => const SizedBox(
            //       width: 10,
            //     ),
            //     itemCount: garden.gardens.length,
            //   ),
            // ),
            const SizedBox(height: 20),
            FilledButton.icon(
                onPressed: () async{
                  final provider =
                                    Provider.of<OrderProvider>(context,listen: false);
                                bool isInCart = provider.orders.any(
                                    (item) => item.packageId == gardenData.id);
                                if (isInCart) {
                                   ScaffoldMessenger.of(context).showSnackBar(
                                 _productSnackBar.productSnackbar(context: context)
                                
                                );
                              
                                
                                } else {
                                   order.BookTourPackage(
                                    packageid: gardenData.id.toString(),
                                    userid: user.currentUserId.toString(),
                                   );
                                 
                                ScaffoldMessenger.of(context).showSnackBar(
                                 _snackBar.customSnackbar(context: context)
                                 
                                );
                               
                                }
        
                },
                icon: const Icon(Icons.bookmark),
                label: const Text("Book Package"))
          ],
        ),
      ),
    );
  }
}
