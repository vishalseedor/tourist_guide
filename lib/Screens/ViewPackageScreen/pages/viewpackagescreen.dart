
import 'package:animate_do/animate_do.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touirst_guide_project/ExtraScreens/loadingscreen.dart';
import 'package:touirst_guide_project/Screens/PackageDetailsScreen/packagedetailsscreen.dart';
import 'package:touirst_guide_project/Screens/ViewPackageScreen/provider/tourpackageprovider.dart';
import 'package:touirst_guide_project/Screens/ViewPackageScreen/widgets/packagewidget.dart';
import 'package:touirst_guide_project/onboadingcontents.dart';



class ViewPackageScreen extends StatefulWidget {
      static const routeName = 'all_package_screen';
  const  ViewPackageScreen({super.key});

  @override
  State<ViewPackageScreen> createState() => _ViewPackageScreenState();
}

class _ViewPackageScreenState extends State<ViewPackageScreen> {
  @override
  void initState() {
    Provider.of<PackageProvider>(context, listen: false)
        .getAllProductData(context: context);

    super.initState();
  }
 
 

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
      final garden = Provider.of<PackageProvider>(context);
   
   
    return Scaffold(
       appBar: AppBar(
        
        toolbarHeight: 80,
      
        backgroundColor:Colors.white,
        centerTitle: false,
        
        
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "TOURIST GUIDE",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)
            ),
            Text("Enjoy your package", style: TextStyle(color: Colors.black,fontSize: 13))
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/new.png',height: 40,width: 40),
          )
//Icon(IconlyBold.notification,color: Colors.white,)
        ],
      ),
      //  drawer:  Drawer(
        
      // ),
      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    // Expanded(
                    //   child: TextFormField(
                    //     //controller: searchController,
                    //     keyboardType: TextInputType.text,
                    //     decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.all(12.0),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(99),
                    //         borderSide: BorderSide.none,
                    //       ),
                    //       fillColor: Colors.grey[200],
                    //       filled: true,
                    //       prefixIcon: Icon(
                    //         Icons.search,
                    //       ),
                    //       hintText: "Search here...",
                    //       hintStyle: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     ),
                    //     style: const TextStyle(color: Colors.black),
                    //     onChanged: (value) {
                    //       if (value != "") {
                    //         String searchQuery = value.toLowerCase();
                    //         print("hhhhhhhhh");
                    //       //  garden.getSearchData(value: searchQuery);
                    //       }
                    //     },
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 12),
                    //   child: IconButton.filled(
                    //     onPressed: () {},
                    // //    icon: const Icon(IconlyLight.filter),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: SizedBox(
              height: 170,
              child: Card(
                color: Colors.grey.shade300,
                elevation: 0.1,
                shadowColor: Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tourist Guide",
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.red,fontWeight: FontWeight.bold
                                  ),
                            ),
                            const Text("Get free support from our customer service"),
                            FilledButton(
                              style: FilledButton.styleFrom(backgroundColor:Colors.green),
                              onPressed: () {},
                              child: const Text("Call now"),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/register.png',
                        width: 160,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured Garden Packages",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              FadeInUp(
                duration: const Duration(milliseconds: 1500),
                child: garden.loadingSpinner
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const LoadingScreen(title: 'Loading'),
                          CircularProgressIndicator(
                            color: Colors.green,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    : garden.products.isEmpty
                        ? Center(
                            child: const Text(
                            'No Garden Packages...',
                            style: TextStyle(color: Colors.green),
                          ))
                        :
                                 SizedBox(
                                    height: size.height * 0.6,
                                    child: GridView.builder(
                                      itemCount: garden.products.length,
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.72,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 16,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return SingleChildScrollView(
                                          child: AllPackageWidget(
                                            id: garden.products[index].id,
                                            name: garden.products[index].packageName,
                                            image: garden.products[index].image,

                                           
                                            
                                          ),
                                        );
                                      },
                                    ),
                                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
