import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:touirst_guide_project/Screens/LoginScreen/clippath.dart';
import 'package:touirst_guide_project/Screens/RegisterScreen/registerscreen.dart';

class NewLoginScreen extends StatefulWidget {
  static const routeName = 'login_screen';
  const NewLoginScreen({Key? key}) : super(key: key);

  @override
  State<NewLoginScreen> createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  bool rememberMe = true;
  bool passwordVisible = true;
  String packageVersion = "";
  TextEditingController emailTextEditingController = TextEditingController();
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
                          hintText: 'User Email',
                          prefixIcon: Icon(Icons.email_outlined)),
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  rememberMe = !rememberMe;
                                  setState(() {});
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  width: size.width * 0.05,
                                  height: size.height * 0.025,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: rememberMe
                                              ? Colors.green
                                              : Colors.black)),
                                  child: Center(
                                      child: rememberMe
                                          ? Icon(
                                              Icons.done,
                                              size: 15,
                                              color: Colors.green,
                                            )
                                          : Container()),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text('Remember me')
                            ],
                          ),
                        ),
                        Container(
                          child: InkWell(
                            onTap: () {
                            
                            },
                            child: Text(
                              'Forget Password',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                       
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
