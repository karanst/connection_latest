import 'dart:convert';
import 'package:connection/Helper/Drawer.dart';
import 'package:connection/Presentation/MyProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Helper/CustomColors.dart';
// import '../../AppBar/CustomAppBar.dart';
// import '../../buttons/CustomButton.dart';
import '../Helper/Api.path.dart';
import '../Models/EditPreofileModel.dart';
import '../Models/MyProfileModel.dart';
import 'AppBar/CustomAppBar.dart';
// import 'Edit_Profile_Screen.dart';
import 'package:http/http.dart' as http;
import 'NotificationScreen.dart';
import 'buttons/CustomButton.dart';


class EditProfileScreen extends StatefulWidget {
  const  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController namectr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController mobileCtr = TextEditingController();

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

  EditPreofileModel? editPreofileModel;
  editProfile() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString('user_id');
    print("User Id is ${user_id.toString()}");
    var headers = {
      'Cookie': 'ci_session=cb032c6fb796a191891d1d3ab1426e0ab73e551f'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}user_edit'));
    request.fields.addAll({
      'id': user_id.toString(),
      'email': emailCtr.text,
      'username': namectr.text,
      'mobile': mobileCtr.text,
      'profile_pic': ''
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      // final result = await response.stream.bytesToString();
      var editprofile = EditPreofileModel.fromJson(jsonDecode(finalResponse));
      print("Edit Profile>>>>${EditPreofileModel}");
      setState(() {
        editPreofileModel = editprofile;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=> UserProfileScreen()));
      Fluttertoast.showToast(msg: '${jsonResponse['message']}');
    }
    else {
      print(response.reasonPhrase);
    }
  }

  // var filesPath;
  // String? fileName;
  // final ImagePicker _picker = ImagePicker();
  // File? imageFile;

  // _getFromGallery() async {
  //   PickedFile? pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.gallery,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //     });
  //     Navigator.pop(context);
  //   }
  // }
  // _getFromCamera() async {
  //   PickedFile? pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //     });
  //     Navigator.pop(context);
  //   }
  // }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: GetDrawer(),
        appBar: AppBar(
          /*leading: InkWell(
              onTap: () {
                const GetDrawer();
              },
              child: Icon(Icons.dehaze_rounded,color: Colors.white)),*/
          actions: [
            Icon(Icons.chat_rounded,color: Colors.white),
            SizedBox(width: 30,),
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(Icons.notifications_active_outlined,color: Colors.white,),
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
                children: [
              // CustomAppBar(
              //   text: 'Submit Your Details',
              // ),

              SizedBox(height: 30,),
              Column(
                children: [
                  // GestureDetector(
                  //   onTap: (){
                  //     showModalBottomSheet(
                  //         context: context,
                  //         builder: (context){
                  //           return Container(
                  //             height: 250,
                  //             decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
                  //             ),
                  //             child: Column(
                  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text("Take Image From", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                  //                 ListTile(leading: Image.asset('assets/ProfileAssets/cameraicon.png', scale: 1.5,),
                  //                   title: Text('Camera', style: TextStyle(fontWeight: FontWeight.bold)),
                  //                   onTap: (){
                  //                     _getFromCamera();
                  //                   },
                  //                 ),
                  //                 ListTile(leading: Image.asset('assets/ProfileAssets/galleryicon.png', scale: 1.5,),
                  //                   title: const Text('Gallery', style: TextStyle(fontWeight: FontWeight.bold)),
                  //                   onTap: (){
                  //                     _getFromGallery();
                  //                   },
                  //                 ),
                  //                 ListTile(leading: Image.asset('assets/ProfileAssets/cancelicon.png', scale: 1.5,),
                  //                   title: const Text('Cancel',style: TextStyle(fontWeight: FontWeight.bold)),
                  //                   onTap: (){
                  //                     Navigator.pop(context);
                  //                   },
                  //                 )
                  //               ],
                  //             ),
                  //           );
                  //         });
                  //   },
                  //   child: Align(
                  //     alignment: Alignment.center,
                  //     child: Stack(
                  //       children: [
                  //         myProfileModel == null || myProfileModel == "" || myProfileModel != null ?
                  //         Container(
                  //           width: 120,
                  //           height: 120,
                  //           decoration: BoxDecoration(
                  //               shape: BoxShape.circle,
                  //               // color: whiteColor
                  //           ),
                  //           child:myProfileModel != null ? ClipRRect(
                  //               borderRadius: BorderRadius.circular(100),
                  //               child:Image.network("${myProfileModel?.user?.profilePic}",fit: BoxFit.fill,)) : Image.asset('assets/images/EditProfileimage.png'),
                  //         ) :
                  //         Container(
                  //           width: 120,
                  //           height: 120,
                  //           decoration: BoxDecoration(
                  //               shape: BoxShape.circle,
                  //               color: whiteColor
                  //           ),
                  //           child: ClipRRect(
                  //             borderRadius: BorderRadius.circular(100),
                  //             child:Image.network("${myProfileModel?.user?.profilePic}",fit: BoxFit.fill,),
                  //           ),
                  //         ),
                  //         Positioned(
                  //           bottom: 20,
                  //           right: 10,
                  //           child: Container(
                  //             width: 30,
                  //             height: 30,
                  //             decoration: const BoxDecoration(
                  //                 color: Colors.white,
                  //                 shape: BoxShape.circle
                  //             ),
                  //             child: Image.asset('assets/ProfileAssets/camera_Icon.png', scale: 1.8,),
                  //           ),),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Image.network("${myProfileModel?.user?.profilePic}"),
                  // Image.asset('assets/images/EditProfileimage.png',height: 120,width: 120,),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.edit,size: 23),
                      SizedBox(width: 5,),
                      Text('Upload User Profile Photo'),
                    ],
                  ),
                  SizedBox(height: 40,),
                  Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width/1.3,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter some text';
                          }
                          return null;
                        },
                        controller: namectr,
                        decoration: InputDecoration(hintText: '${myProfileModel?.user?.username}'),)),
                  Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width/1.3,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter some text';
                          }
                          return null;
                        },
                        controller: emailCtr,
                        decoration: InputDecoration(hintText: '${myProfileModel?.user?.email}'),)),
                  Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width/1.3,
                      child: TextFormField(
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter some text';
                          }
                          return null;
                        },
                        controller: mobileCtr,
                        decoration: InputDecoration(hintText: '${myProfileModel?.user?.mobile}'),)),
                  // Container(
                  //     height: 80,
                  //     width: MediaQuery.of(context).size.width/1.3,
                  //     child: TextField(decoration: InputDecoration(hintText: 'Driver License No.'),)),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 35.0),
                  //       child: Text('Upload The Following Things. (Required)',style: TextStyle(color: CustomColors.grayColor,fontSize: 15),),
                  //     ),
                  //     SizedBox(height: 10,),
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 35.0),
                  //       child: Row(
                  //         children: [
                  //           Text('01 : Vehicle Photo',style: TextStyle(fontWeight: FontWeight.w600),),
                  //           SizedBox(width: 150,),
                  //           Text('03 : Permit',style: TextStyle(fontWeight: FontWeight.w600),),
                  //
                  //         ],
                  //       ),
                  //     ),
                  //     SizedBox(height: 20,),
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 35.0),
                  //       child: Row(
                  //         children: [
                  //           Text('02 : Police Verification\nCertificate',style: TextStyle(fontWeight: FontWeight.w600),),
                  //           SizedBox(width: 70,),
                  //           Text('04 : RC (Registration\n Certificate)',style: TextStyle(fontWeight: FontWeight.w600),)
                  //         ],
                  //       ),
                  //     ),
                  //     SizedBox(height: 20,),
                  //     Row(
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(left: 38.0),
                  //           child: Container(
                  //               height: 50,
                  //               width: 50,
                  //               decoration: BoxDecoration(
                  //                   color: Colors.white,
                  //                   border: Border.all( color: Colors.black,
                  //                   ),
                  //                   borderRadius: BorderRadius.circular(20)),
                  //               child: Icon(Icons.upload)),
                  //         ),
                  //         SizedBox(width: 10,),
                  //         Image.asset('assets/images/EditProfileScreenimage.png',height: 50,width: 50,),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              SizedBox(height: 40),
              CustomAppBtn(
                height: 50,
                width: MediaQuery.of(context).size.width/1.2,
                title: 'Send',
                onPress: () {
                  editProfile();
                }
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => EditProfileScreen()));
                // },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
