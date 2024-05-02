import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touirst_guide_project/Screens/BottomNavigationScreen/bottomnavigationscreen.dart';
import 'package:touirst_guide_project/Screens/LoginScreen/clippath.dart';
import 'package:http/http.dart'as http;
import 'package:touirst_guide_project/Screens/ProfileScreen/profilemodel.dart';
import 'package:touirst_guide_project/Screens/ProfileScreen/userprovider.dart';
import 'package:touirst_guide_project/Screens/RegisterScreen/registerscreen.dart';

class NewLoginScreen extends StatefulWidget {
  //static const routeName = 'login_screen';
  const NewLoginScreen({Key? key}) : super(key: key);

  @override
  State<NewLoginScreen> createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  bool rememberMe = true;
  bool passwordVisible = true;
  String packageVersion = "";
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   void loginTouristGuide(String mobile, String password) async {
    const url = 'http://campus.sicsglobal.co.in/Project/Tourist_Guide/api/user_login.php';

    Map<String, String> body = {'mobile': mobile, 'password': password};

  try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
      );
      print(url);
      var jsonData = json.decode(response.body);
      print(jsonData);
      print(jsonData["status"]);
      if (response.statusCode == 200) {
        if (jsonData['status'] == true) {
          //      getstorage.write("phone",loginModel!.phone.toString());
          // getstorage.write("password",loginModel!.password.toString());
          // getstorage.read(phone);
          // phone=getstorage.read("phone");

          List user = jsonData['userData'];
          if (user.isNotEmpty) {
            ProfileModel userdata = ProfileModel.fromJson(user[0]);
            String userId = userdata.id;
            Provider.of<UserProvider>(context, listen: false)
                .setCurrentUserId(userId);
            print(userId);
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor:  Color.fromARGB(255, 23, 77, 25),
              content: const Text(
                'Login Successful!',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: const Duration(seconds: 4),
            ),
          );

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const BottomNavigationScreen()));
          print(body);
          print("Response body${response.body}");

          print('Login successful');
        } else if (jsonData['status'] == false) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Color.fromARGB(255, 23, 77, 25), 
              content: const Text(
                'Invalid mobile and password',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: const Duration(seconds: 4),
            ),
          );
          print('Error: ${response.statusCode}');
        }
      } else {
        print('fffff');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  
  


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
           
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    Text(
                      'Welcome',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  
                   Text(
                      'Tourist Guide',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: TextFormField(
                        controller: emailTextEditingController,
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
                        obscureText: passwordVisible,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                            hintText: 'Password',
                            prefixIcon:const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                icon: Icon(passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility))),
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
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                              if (_formKey.currentState!.validate()) {
                              loginTouristGuide(
                                emailTextEditingController.text.toString(),
                                passwordController.text.toString(),
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
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                       
                        // Expanded(
                        //   flex: 2,
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       _launchInBrowser(
                        //           Uri.parse('https://www.seedors.com/'));
                        //     },
                        //     child: Container(
                        //       margin: const EdgeInsets.symmetric(
                        //           vertical: 15, horizontal: 25),
                        //       width: size.width * 0.3,
                        //       height: size.height * 0.06,
                        //       decoration: BoxDecoration(
                        //           color: Colors.white,
                        //           border: Border.all(color: Colors.grey),
                        //           borderRadius: BorderRadius.circular(20)),
                        //       child: Center(
                        //         child: Text(
                        //           'Register',
                        //           style: TextStyle(color: Colors.black),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an Account ?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            SizedBox(width: size.width*0.02,),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,MaterialPageRoute(builder:(context)=>const RegisterScreen()));
                              },
                              child: Text('Register',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),))
                          ],
                        )
                    // Container(
                    //   width: size.width,
                    //   margin: const EdgeInsets.all(10),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Icon(
                    //         Icons.language,
                    //         color: appbarRightColor,
                    //       ),
                    //       SizedBox(
                    //         width: size.width * 0.03,
                    //       ),
                    //       Text('www.seedors.com')
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            
              Image.asset(
                'assets/loginimage.png',
                width: size.width,
                height: size.height * 0.29,
              ),
            ],
          ),
        
        ],
      ),
    );
  }
}
