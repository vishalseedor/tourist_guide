import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<String>names=['Kerala Tourist Places','TamilNadu Tourist Places','Karnataka Tourist Places','Delhi Tourist Places','Mumbai Tourist Places','Gujrat Tourist Places'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        title: Text('Category Packages',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
        
        
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 16,crossAxisSpacing: 16,childAspectRatio: 0.9), itemBuilder: (context, index) {
          return Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(color: Color.fromARGB(255, 190, 175, 169),borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                
              ],
            ),
            
          );
        },),
      ),
      
    );
  }
}