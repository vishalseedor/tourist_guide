import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:touirst_guide_project/Screens/LoginScreen/loginscreen.dart';
import 'package:touirst_guide_project/Screens/ProfileScreen/editprofilescreen.dart';
import 'package:touirst_guide_project/Screens/ProfileScreen/userprovider.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   @override
     void initState() {
  Provider.of<UserProvider>(context,listen: false).getUserData(context: context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.arrow_back,color: Colors.white,),
        backgroundColor: Colors.green,
        title: const Text('Profile',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
           Container(height: 200,width: double.infinity,decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
            Stack(
          children: [
            CircleAvatar(
        backgroundColor: Color(0xff00A3FF),
        backgroundImage: AssetImage("assets/profile.png"),
        radius: 60.0,
            ),
           
          ]
        ),
            Consumer<UserProvider>(builder: (context, value, child) {
                  String userName = "";
                  for (var i = 0; i < value.users.length; i++) {
                    userName = value.users[i].firstname;
                  }
                  return Text(
                    userName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  );
                }),
             
           ],
         ),
           ),
           SizedBox(height: 30,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Column(
                 
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('First Name',style: TextStyle(fontWeight: FontWeight.w900),),
                        Consumer<UserProvider>(builder: (context, value, child) {
                  String userName = "";
                  for (var i = 0; i < value.users.length; i++) {
                    userName = value.users[i].firstname;
                    print(userName+'vvvvvvvvv');
                  }
                  return Text(
                    '$userName',
                    style:Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold,fontSize: 14),
                  );
                }),
                      ],
                    ),
                     SizedBox(height: 20),
                  
                     Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Last Name',style: TextStyle(fontWeight: FontWeight.w900)),
                        Consumer<UserProvider>(builder: (context, value, child) {
                  String userAddress = "";
                  for (var i = 0; i < value.users.length; i++) {
                    userAddress = value.users[i].lastname;
                    print(userAddress+'vvvvvvvvv');
                  }
                  return Text(
                    '$userAddress',
                    style:Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold,fontSize: 14),
                  );
                }),
                      ],
                    ),
                      SizedBox(height: 20),
                  
                     Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('City',style: TextStyle(fontWeight: FontWeight.w900)),
                       Consumer<UserProvider>(builder: (context, value, child) {
                  String userAddress = "";
                  for (var i = 0; i < value.users.length; i++) {
                    userAddress = value.users[i].city;
                    print(userAddress+'vvvvvvvvv');
                  }
                  return Text(
                    '$userAddress',
                    style:Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold,fontSize: 14),
                  );
                }),
                      ],
                    ),
                      SizedBox(height: 20),
                 
                     Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Phone',style: TextStyle(fontWeight: FontWeight.w900)),
                        Consumer<UserProvider>(builder: (context, value, child) {
                  String userAddress = "";
                  for (var i = 0; i < value.users.length; i++) {
                    userAddress = value.users[i].mobile;
                    print(userAddress+'vvvvvvvvv');
                  }
                  return Text(
                    '$userAddress',
                    style:Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold,fontSize: 14),
                  );
                }),
                      ],
                    )
                  ],
                  
                ),
              ),
             ),
            
           ),
           SizedBox(height: 20),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: InkWell(
              onTap: () {
              Navigator.push(context,MaterialPageRoute(builder:(context)=>const ProfileEditScreen()));
              },
               child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                  child: Row(
                   
                    children: [
                      Icon(Icons.person,color: Colors.red,),
                      SizedBox(width: 20),
                      Text('Edit Profile',style: TextStyle(fontWeight: FontWeight.w900),)
                    ],
                  ),
                ),
               ),
             ),
           ),
              SizedBox(height: 10),
            Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: InkWell
             (
              onTap: () {
              // Navigator.push(context,MaterialPageRoute(builder:(context)=>const SupportScreen()));
              },
               child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                  child: Row(
                   
                    children: [
                      Icon(Icons.support,color: Colors.blue,),
                      SizedBox(width: 20),
                      Text('Support',style: TextStyle(fontWeight: FontWeight.w900),)
                    ],
                  ),
                ),
               ),
             ),
           ),
             
           SizedBox(height: 10),
            Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: InkWell(
              onTap: () {
              showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Logout',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                        ),
                        content:
                            const Text('Are you sure want to exit this app?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
                        actions: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const NewLoginScreen()));
                            },
                            child: const Text(
                              'OK',
                              style: TextStyle(
                                fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor:Colors.green,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              // Close the dialog
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'CANCEL',
                              style: TextStyle(
                                 fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                          )
                        ],
                      );
                    },
                  );
              },
               child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                  child: Row(
                   
                    children: [
                      Icon(Icons.logout,color: Colors.purple),
                      SizedBox(width: 20),
                      Text('Logout',style: TextStyle(fontWeight: FontWeight.w900),)
                    ],
                  ),
                ),
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}