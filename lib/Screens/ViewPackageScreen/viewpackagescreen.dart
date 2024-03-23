
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:touirst_guide_project/Screens/PackageDetailsScreen/packagedetailsscreen.dart';
import 'package:touirst_guide_project/onboadingcontents.dart';



class ViewPackageScreen extends StatefulWidget {
  const  ViewPackageScreen({super.key});

  @override
  State<ViewPackageScreen> createState() => _ViewPackageScreenState();
}

class _ViewPackageScreenState extends State<ViewPackageScreen> {
 
 final List<String>images=['assets/package1.jpg','assets/package2.png','assets/package3.png','assets/package4.png'];
 final List<String>names=['Munnar','Efil Tower','Taj Mahal','Ooty'];
 

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
   
   
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
//Icon(IconlyBold.notification,color: Colors.white,)
        ],
      ),
       drawer:  Drawer(
        
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search here...",
                      isDense: true,
                      contentPadding: const EdgeInsets.all(12.0),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(99),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(99),
                        ),
                      ),
                      prefixIcon: const Icon(EvaIcons.search),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 12),
                //   child: IconButton.filled(
                //     onPressed: () {}, icon: const Icon(IconlyLight.filter,)),
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
                "Featured TourPackage Lists",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {},
                child: const Text("See all"),
              ),
            ],
          ),
           
         
                        
          GridView.builder(
            itemCount:  images.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
             return  Padding(
       padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
       child: AspectRatio(
        aspectRatio: 2 / 2.2,
        child: GestureDetector(
          onTap: () {
     Navigator.push(context,MaterialPageRoute(builder: (context)=>const PackageDetailsScreen()));
          },
          child: Material(
            child: Container(
             
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(images[index]),
                  fit: BoxFit.cover
                )
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0),
                    ]
                  )
                ),
                child: 
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(names[index], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)
                ),
              ),
            ),
          ),
        ),
           ),
     );
            },
          )
        ],
      ),
    );
  }
}
