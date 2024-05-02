import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:touirst_guide_project/Screens/BottomNavigationScreen/bottomnavigationscreen.dart';
import 'package:touirst_guide_project/Screens/ProfileScreen/userprovider.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  File? image;
  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     final imageTemporary = File(image.path);
  //     setState(() {
  //       this.image = imageTemporary;
  //     });
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image:$e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = Provider.of<UserProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Profile',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                    ),
                //    imageProfile()
                    // SizedBox(
                    //   child: CircleAvatar(
                    //     radius: 40.0,
                    //     backgroundColor: Colors.white,
                    //     child: CircleAvatar(
                    //       child: Align(
                    //         alignment: Alignment.bottomRight,
                    //         child: CircleAvatar(
                    //           backgroundColor: Colors.black,
                    //           radius: 12.0,
                    //           child: Icon(
                    //             Icons.camera_alt,
                    //             size: 15.0,
                    //             color: Colors.white,
                    //           ),
                    //         ),
                    //       ),
                    //       radius: 30,
                    //       backgroundImage: AssetImage('assets/profile.png'),
                    //     ),
                    //   ),
                    // ),
                    // CircleAvatar(
                    //   radius: 30,
                    //   child: Image.asset('assets/profile.png'),
                    // ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                const Text(
                  'User Name',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),

                SizedBox(height: size.height * 0.01),
                SizedBox(
                  height: size.height * 0.07,
                  child: TextFormField(
                    controller: userNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                         fillColor: Colors.grey[200],
                         filled: true,
                        hintText: 'Enter User Name',
                        
                        hintStyle: TextStyle(fontSize: 13),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none
                        )),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                const Text(
                  'Phone Number',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                // SizedBox(
                //   width: size.width * 0.01,
                // ),

                SizedBox(height: size.height * 0.01),
                SizedBox(
                  height: size.height * 0.07,
                  child: TextFormField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration:  InputDecoration(
                       fillColor: Colors.grey[200],
                       filled: true,
                        hintText: 'Enter Phone Number',
                        hintStyle: TextStyle(fontSize: 13),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                        )),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                const Text(
                  'Email State',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),

                SizedBox(height: size.height * 0.01),
                SizedBox(
                  height: size.height * 0.07,
                  child: TextFormField(
                    controller: stateController,
                    keyboardType: TextInputType.emailAddress,
                    decoration:  InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                        hintText: 'Enter State',
                        hintStyle: TextStyle(fontSize: 13),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                        )),
                  ),
                ),

                SizedBox(height: size.height * 0.01),
                // const Text(
                //   'Sponser ID ',
                //   style: TextStyle(
                //       color: Colors.black, fontWeight: FontWeight.w500),
                // ),
                // SizedBox(height: size.height * 0.01),
                // SizedBox(
                //   height: size.height * 0.07,
                //   child: TextFormField(
                //     //controller: emailController,
                //     keyboardType: TextInputType.text,
                //     decoration: const InputDecoration(
                //         hintText: 'Enter Sponser ID',
                //         hintStyle: TextStyle(fontSize: 13),
                //         border: OutlineInputBorder()),
                //   ),
                // ),
                // const Text(
                //   'Sponser link',
                //   style: TextStyle(
                //       color: Colors.black, fontWeight: FontWeight.w500),
                // ),

                // SizedBox(height: size.height * 0.01),
                // SizedBox(
                //   height: size.height * 0.07,
                //   child: TextFormField(
                //     //controller: emailController,
                //     keyboardType: TextInputType.emailAddress,
                //     decoration: const InputDecoration(
                //         hintText: 'Enter Sponser link',
                //         hintStyle: TextStyle(fontSize: 13),
                //         border: OutlineInputBorder()),
                //   ),
                // ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                // Spacer(),
                // SizedBox(
                //   height: size.height * 0.39,
                // ),
                SizedBox(
                  height: size.height * 0.049,
                  width: size.width * 0.93,
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor:const Color.fromARGB(255, 11, 95, 14),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        updateProfileApi();
                      },
                      child: const Text(
                        'Update',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context, builder: (builder) => bottomsheet());
          },
          // child: image != null
          //     ? Image.file(image!)
          //     : CircleAvatar(
          //         radius: 30,
          //         backgroundImage: AssetImage('assets/person.png'),
          //       )
          child: CircleAvatar(
            radius: 28,
            child: ClipOval(
              child: image != null
                  ? Image.file(image!)
                  : Image.network('assets/profile.png'),
            ),
          ),
        ),
        const Positioned(
            bottom: 30.0,
            top: 50.0,
            left: 55,
            child: Icon(
              Icons.camera_alt,
              color: Colors.black,
              size: 28,
            ))
      ],
    );
  }

  Widget bottomsheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text(
            'Choose Profile photo',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera,
                    color: Colors.teal,
                  ),
                  label: const Text(
                    'Camera',
                    style: TextStyle(color: Colors.black),
                  )),
              TextButton.icon(
                  onPressed: () {
                 //   pickImage();
                  },
                  icon: const Icon(
                    Icons.image,
                    color: Colors.teal,
                  ),
                  label: const Text(
                    'Gallery',
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          )
        ],
      ),
    );
  }

  Future<dynamic> updateProfileApi() async {
    try {
      final user = Provider.of<UserProvider>(context, listen: false);
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://campus.sicsglobal.co.in/Project/Tourist_Guide/api/edit_profile.php'),
      );
      print(
          'http://campus.sicsglobal.co.in/Project/Tourist_Guide/api/edit_profile.php');
      request.fields.addAll({
        'firstname': userNameController.text.trim(),
        'lastname':'llll',
        'phone': phoneNumberController.text.trim(),
        'password': '2017',
        'state': stateController.text.trim(),
        'city': 'Varkala',
        'userid': user.currentUserId ?? "1"
      });
        if (image != null) {
      request.files.add(await http.MultipartFile.fromPath('photo', image!.path));
    }
      http.StreamedResponse response = await request.send();

      print(await response.stream.bytesToString());
      print(""" 'name': ${userNameController.text.trim()},
        'phone': ${phoneNumberController.text.trim()},
      
        'password': '123',
        'address': ${stateController.text.trim()},
        'state': 'Kerala.',
        'user_type': 'Consumer',
        'userid': ${user.currentUserId}?? "1" """);
      if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor:Color.fromARGB(255, 31, 82, 32),
                                  content: const Text("Profile Updated successfully...!",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const BottomNavigationScreen()));

        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }
}
