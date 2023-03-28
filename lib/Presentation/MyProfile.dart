// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../Helper/Api.path.dart';
// import '../Models/MyProfileModel.dart';
//
// class MyProfileScreeen extends StatefulWidget {
//   const MyProfileScreeen({Key? key}) : super(key: key);
//
//   @override
//   State<MyProfileScreeen> createState() => _MyProfileScreeenState();
// }
//
// class _MyProfileScreeenState extends State<MyProfileScreeen> {
//
//   MyProfileModel? myProfileModel;
//   userProfile() async{
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? user_id = prefs.getString('user_id');
//     print("User Id is ${user_id.toString()}");
//     var headers = {
//       'Cookie': 'ci_session=cb032c6fb796a191891d1d3ab1426e0ab73e551f'
//     };
//     var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}user_data'));
//     request.fields.addAll({
//       'user_id': user_id.toString(),
//     });
//
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       print(await response.stream.bytesToString());
//     }
//     else {
//       print(response.reasonPhrase);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//
//     ]));
//   }
// }

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Helper/CustomColors.dart';
import 'package:http/http.dart' as http;
// import '../../AppBar/CustomAppBar.dart';
// import '../../buttons/CustomButton.dart';
import '../Helper/Api.path.dart';
import '../Models/MyProfileModel.dart';
import 'AppBar/CustomAppBar.dart';
import 'EditProfile.dart';
import 'NotificationScreen.dart';
import 'buttons/CustomButton.dart';


class UserProfileScreen extends StatefulWidget {
  const  UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userProfile();
  }

  MyProfileModel? myProfileModel;

  userProfile() async{
    print("My Profile api ");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString('user_id');
    print("User Id is ${user_id.toString()}");
    var headers = {
      'Cookie': 'ci_session=cb032c6fb796a191891d1d3ab1426e0ab73e551f'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}user_data'));
    request.fields.addAll({
      'user_id': user_id.toString(),
    });

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      var userprofile = MyProfileModel.fromJson(jsonDecode(finalResponse));
      print("Profile Here>>>>>>${MyProfileModel}");
      setState(() {
        myProfileModel = userprofile;
      });
      // Fluttertoast.showToast(msg: '${jsonResponse['message']}');
    }
    else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            const CustomAppBar(
              text: 'Submit Your Details',
            ),
            SizedBox(height: 30,),
            Column(
              children: [
                Image.network("${myProfileModel?.user?.profilePic}"),
                // Image.asset('assets/images/RideCompleteimage.png',height: 150,width: 150,),
                Text('User Profile Photo'),
                SizedBox(height: 40,),
                Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width/1.3,
                    child: TextField(decoration: InputDecoration(hintText: '${myProfileModel?.user?.username}'),)),
                Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width/1.3,
                    child: TextField(decoration: InputDecoration(hintText: '${myProfileModel?.user?.email}'),)),
                Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width/1.3,
                    child: TextField(decoration: InputDecoration(hintText: '${myProfileModel?.user?.mobile}'))),
                // Container(
                //     height: 80,
                //     width: 330,
                //     child: TextField(decoration: InputDecoration(hintText: '123456987454'),)),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     const Text('Upload The Following Things. (Required)',style: TextStyle(color: CustomColors.grayColor),),
                //     SizedBox(height: 10,),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 18.0),
                //       child: Row(
                //         children: const [
                //           Text('01 : Vehicle Photo'),
                //           SizedBox(width: 150,),
                //           Text('03 : Permit'),
                //         ],
                //       ),
                //     ),
                //     SizedBox(height: 20,),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 18.0),
                //       child: Row(
                //         children: const [
                //           Icon(Icons.upload),
                //           SizedBox(width: 270,),
                //           Icon(Icons.upload),
                //         ],
                //       ),
                //     ),
                //     SizedBox(height: 20,),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 18.0),
                //       child: Row(
                //         children: const [
                //           Text('02 : Police Verification\nCertificate'),
                //           SizedBox(width: 70,),
                //           Text('04 : RC (Registration\n Certificate)')
                //         ],
                //       ),
                //     ),
                //     SizedBox(height: 20,),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 18.0),
                //       child: Row(
                //         children: [
                //           Icon(Icons.upload),
                //           SizedBox(width: 270,),
                //           Icon(Icons.upload),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
            SizedBox(height: 40,),
            CustomAppBtn(
              height: 50,
              width: MediaQuery.of(context).size.width/1.2,
              title: 'Edit',
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>EditProfileScreen()));
              },
            ),
          ]),
        ),
      ),
    );
  }
}
