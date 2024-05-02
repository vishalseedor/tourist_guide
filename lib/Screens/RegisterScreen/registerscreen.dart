import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touirst_guide_project/Screens/BottomNavigationScreen/bottomnavigationscreen.dart';
import 'package:http/http.dart'as http;
import 'package:touirst_guide_project/Screens/LoginScreen/loginscreen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool rememberMe = true;
  bool passwordVisible = true;
  final _formKey = GlobalKey<FormState>();
Future<void>registerTourist(

String firstname,String lastname,String email,String mobile,String password,String gender,String age,String city,String state) async {
  const url = 'http://campus.sicsglobal.co.in/Project/Tourist_Guide/api/user_registration.php';

  Map<String, String> body = {
  
    'firstname':firstname ,
    'lastname': lastname,
    'email': email,
    'mobile': mobile,
    'password': password,
    'gender': gender,
    'age': age,
    'city':city,
    'state':state,
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      body: body,
      
    );
      var jsonData=json.decode(response.body);

    if (response.statusCode == 200) {
         if(jsonData['status']==true){
          ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor: Colors.green,
          content: Text('Registration Successful!',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          duration: Duration(seconds: 4),
        ),
      );
      Navigator.push(context,MaterialPageRoute(builder:(context)=>const NewLoginScreen()));
      print(body);
      print("Response body${response.body}");
    
      }
      print(body);
      print("Response body${response.body}");
      print('Registration successful');
      print(body);
      print("Response body${response.body}");
      print('Registration successful');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor: Colors.green,
          content: Text('Already email and password Exists',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          duration: Duration(seconds: 4),
        ),
      );
      print('Error: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
}
  TextEditingController firstnamecontroller=TextEditingController();
  TextEditingController lastnamecontroller=TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobilecontroller=TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();
  TextEditingController agecontroller=TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();



  
  
  
  


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
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
                          controller: firstnamecontroller,
                          autocorrect: true,
                          keyboardType: TextInputType.text,
                          decoration:const InputDecoration(
                             border: OutlineInputBorder(),
                              hintText: 'First Name',
                              prefixIcon: Icon(Icons.person_outline_outlined)),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'Please enter your firstname';
                                }
                                else{
                                  return null;
                                }
                              },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: TextFormField(
                          
                          controller: lastnamecontroller,
                          autocorrect: true,
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                              hintText: 'Last Name',
                              prefixIcon:const Icon(Icons.person_outline_outlined),
                             
                                      ),
                                       validator: (value) {
                                if(value!.isEmpty){
                                  return 'Please enter your lastname';
                                }
                                else{
                                  return null;
                                }
                              },
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
                               validator: (value) {
                                if(value!.isEmpty){
                                  return 'Please enter your email';
                                }
                                else{
                                  return null;
                                }
                              },
                        ),
                      ),
                        Container(
                        margin: const EdgeInsets.all(15),
                        child: TextFormField(
                          controller: mobilecontroller,
                          autocorrect: true,
                          keyboardType: TextInputType.emailAddress,
                          decoration:const InputDecoration(
                             border: OutlineInputBorder(),
                              hintText: 'Mobile',
                              prefixIcon: Icon(Icons.phone_android_outlined)),
                               validator: (value) {
                                if(value!.isEmpty){
                                  return 'Please enter your mobile';
                                }
                                else{
                                  return null;
                                }
                              },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: TextFormField(
                          controller: passwordController,
                          autocorrect: true,
                          keyboardType: TextInputType.text,
                          decoration:const InputDecoration(
                             border: OutlineInputBorder(),
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock_outline)),
                               validator: (value) {
                                if(value!.isEmpty){
                                  return 'Please enter your password';
                                }
                                else{
                                  return null;
                                }
                              },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: TextFormField(
                          controller: gendercontroller,
                          autocorrect: true,
                          keyboardType: TextInputType.text,
                          decoration:const InputDecoration(
                             border: OutlineInputBorder(),
                              hintText: 'Gender',
                              prefixIcon: Icon(Icons.person_outline)),
                               validator: (value) {
                                if(value!.isEmpty){
                                  return 'Please enter your gender';
                                }
                                else{
                                  return null;
                                }
                              },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: TextFormField(
                          controller: agecontroller,
                          autocorrect: true,
                          keyboardType: TextInputType.emailAddress,
                          decoration:const InputDecoration(
                             border: OutlineInputBorder(),
                              hintText: 'Age',
                              prefixIcon: Icon(Icons.person_outline)),
                               validator: (value) {
                                if(value!.isEmpty){
                                  return 'Please enter your age';
                                }
                                else{
                                  return null;
                                }
                              },
                        ),
                      ),
                       Container(
                        margin: const EdgeInsets.all(15),
                        child: TextFormField(
                          controller: stateController,
                          autocorrect: true,
                          keyboardType: TextInputType.emailAddress,
                          decoration:const InputDecoration(
                             border: OutlineInputBorder(),
                              hintText: 'State',
                              prefixIcon: Icon(Icons.location_city)),
                               validator: (value) {
                                if(value!.isEmpty){
                                  return 'Please enter your state';
                                }
                                else{
                                  return null;
                                }
                              },
                        ),
                      ),
                        Container(
                        margin: const EdgeInsets.all(15),
                        child: TextFormField(
                          controller: cityController,
                          autocorrect: true,
                          keyboardType: TextInputType.emailAddress,
                          decoration:const InputDecoration(
                             border: OutlineInputBorder(),
                              hintText: 'City',
                              prefixIcon: Icon(Icons.location_city)),
                               validator: (value) {
                                if(value!.isEmpty){
                                  return 'Please enter your city';
                                }
                                else{
                                  return null;
                                }
                              },
                        ),
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                               if (_formKey.currentState!.validate()) {
                                    registerTourist(
                         firstnamecontroller.text.toString(),
                         lastnamecontroller.text.toString(),
                         emailController.text.toString(),
                         mobilecontroller.text.toString(),
                         passwordController.text.toString(),
                         gendercontroller.text.toString(),
                         agecontroller.text.toString(),
                         cityController.text.toString(),
                         stateController.text.toString()
                       
                  
                   );
              
              
                 
                    } 
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
            ),
          ),
        
        ],
      ),
    );
  }
}
