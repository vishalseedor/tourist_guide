import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:touirst_guide_project/Screens/BottomNavigationScreen/bottomnavigationscreen.dart';
import 'package:touirst_guide_project/Screens/LoginScreen/clippath.dart';
import 'package:touirst_guide_project/Screens/ViewPackageScreen/viewpackagescreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool rememberMe = true;
  bool passwordVisible = true;
  TextEditingController firstnamecontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();
  TextEditingController addressnamecontroller=TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  
  


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
           
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Text(
                    'Welcome',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                
                 Text(
                    'REGISTER',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                 SizedBox(height: size.height*0.04),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: TextFormField(
                      controller: emailController,
                      autocorrect: true,
                      keyboardType: TextInputType.text,
                      decoration:const InputDecoration(
                         border: OutlineInputBorder(),
                          hintText: 'First Name',
                          prefixIcon: Icon(Icons.person_outline_outlined)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: TextFormField(
                      
                      controller: passwordController,
                      autocorrect: true,
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                          hintText: 'Last Name',
                          prefixIcon:const Icon(Icons.person_outline_outlined),
                          //     onPressed: () {
                          //       setState(() {
                          //         passwordVisible = !passwordVisible;
                          //       });
                          //     },
                          //     icon: Icon(passwordVisible
                          //         ? Icons.visibility_off
                          //         : Icons.visibility))
                                  
                                  ),
                    ),
                  ),
                    Container(
                    margin: const EdgeInsets.all(15),
                    child: TextFormField(
                      controller: emailController,
                      autocorrect: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration:const InputDecoration(
                         border: OutlineInputBorder(),
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
                  ),
                    Container(
                    margin: const EdgeInsets.all(15),
                    child: TextFormField(
                      controller: emailController,
                      autocorrect: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration:const InputDecoration(
                         border: OutlineInputBorder(),
                          hintText: 'Phone',
                          prefixIcon: Icon(Icons.phone_android_outlined)),
                    ),
                  ),
                    Container(
                    margin: const EdgeInsets.all(15),
                    child: TextFormField(
                      controller: emailController,
                      autocorrect: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration:const InputDecoration(
                         border: OutlineInputBorder(),
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline_rounded)),
                    ),
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                       Navigator.push(context,MaterialPageRoute(builder: (context)=>const BottomNavigationScreen()));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                          width: size.width * 0.3,
                          height: size.height * 0.06,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                     
                   
                    ],
                  ),
                  
                 
                ],
              ),
            
            
            ],
          ),
        
        ],
      ),
    );
  }
}
