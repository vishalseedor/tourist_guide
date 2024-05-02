import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';


import 'package:provider/provider.dart';
import 'package:touirst_guide_project/CategoryScreen/provider/categoryprovider.dart';
import 'package:touirst_guide_project/CategoryScreen/widgets/allcategorywidget.dart';
import 'package:touirst_guide_project/ExtraScreens/loadingscreen.dart';


class CategoryScreen extends StatefulWidget { 
    static const routeName = 'all_category_screen';
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
    @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false)
        .getAllCategoryData(context: context);
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final category=Provider.of<CategoryProvider>(context);
    return Scaffold(
        appBar: AppBar(
        
        leading:  IconButton(onPressed: (){
          Navigator.pop(context);
        // ignore: prefer_const_constructors
        },icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.green,
        title: const Text('Category Packages',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
      ),
    body:SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
     Text('Category Packages Nears You',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(height: size.height*0.02),
            FadeInUp(
               duration:  const Duration(milliseconds: 1500),
              child: category.loadingSpinner
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
                            : category.categories.isEmpty
                                ? const Center(
                                    child: Text(
                                    'No Categoeies...',
                                    style: TextStyle(color:Colors.green),
                                  ))
                                : SizedBox(
                                    //height: size.height * 0.6,
                                    child: GridView.builder(
                                      scrollDirection: Axis.vertical,
                      itemCount: category.categories.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                       // childAspectRatio: 0.98,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) {
                        return AllCategoryWidget(
                          id: category.categories[index].id,
                          name: category.categories[index].name,
                          image: category.categories[index].photo,
                        
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