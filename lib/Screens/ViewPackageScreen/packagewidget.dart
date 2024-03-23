import 'package:flutter/material.dart';


class AllPackageWidget extends StatefulWidget {

  const AllPackageWidget(
      {super.key,
 
      });

  @override
  State<AllPackageWidget > createState() => _AllPackageWidgetState();
}

class _AllPackageWidgetState extends State<AllPackageWidget> {
 
 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

     return  Padding(
       padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
       child: AspectRatio(
        aspectRatio: 2 / 2.2,
        child: GestureDetector(
          onTap: () {
     
          },
          child: Material(
            child: Container(
             
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(''),
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
                  child: Text('', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)
                ),
              ),
            ),
          ),
        ),
           ),
     );

    
  }
}
