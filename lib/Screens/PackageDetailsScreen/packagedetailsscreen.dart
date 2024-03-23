import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class PackageDetailsScreen extends StatefulWidget {
  const PackageDetailsScreen({super.key});

  @override
  State<PackageDetailsScreen> createState() => _PackageDetailsScreenState();
}

class _PackageDetailsScreenState extends State<PackageDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        title: Text('Package Details',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/package3.png'),fit: BoxFit.cover)),
            ),
            
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                'Taj Mahal',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)
              ),
                   const SizedBox(height: 10),
              Text('Package : ₹ 15000.0',   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,color: Colors.green
                  ),),
               Text(
                 "${'Members : 10 '}",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,color: Colors.green
                  ),
               ),
              
              const SizedBox(height: 20),
              Text("Description",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
            
              Text('The Taj Mahal is an iconic mausoleum located in Agra, India, and is widely regarded as one of the most beautiful buildings in the world. It was commissioned in 1632 by the Mughal emperor Shah Jahan in memory of his favorite wife, Mumtaz Mahal, who died during childbirth. The construction of the Taj Mahal took over 20 years to complete and involved thousands of artisans and craftsmen.'),
             
              const SizedBox(height: 20),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(EvaIcons.car,color: Colors.white,),
                    SizedBox(width:10),
                    Text('Book Package',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                  ],
                ),
              )
            
            
              ],
            ),
          )
        
           
         
          ],
        ),
      ),
      
    );
    
  }
}