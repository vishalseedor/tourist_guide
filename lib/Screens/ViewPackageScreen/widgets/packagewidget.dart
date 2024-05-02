import 'package:flutter/material.dart';
import 'package:touirst_guide_project/Screens/PackageDetailsScreen/packagedetailsscreen.dart';


class AllPackageWidget extends StatefulWidget {
  final String id;
  final String name;
  final String image;

  const AllPackageWidget(
      {super.key,
      required this.id,
      required this.name,
      required this.image
 
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
        Navigator.of(context).pushNamed(PackageDetailsScreen.routeName,arguments:widget.id);
          },
          child: Material(
            child: Container(
             
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(widget.image),
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
                  child: Text(widget.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)
                ),
              ),
            ),
          ),
        ),
           ),
     );

    
  }
}
