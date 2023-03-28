// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../Helper/CustomColors.dart';
// import 'package:http/http.dart' as http;
//
// import '../Helper/Api.path.dart';
// import '../Models/AccomodationdetailsModel.dart';
// import '../Models/CitiesModel.dart';
// import 'AppBar/CustomAppBar.dart';
//
// class AccomodationCreatePost extends StatefulWidget {
//   const AccomodationCreatePost({Key? key}) : super(key: key);
//
//   @override
//   State<AccomodationCreatePost> createState() => _AccomodationCreatePostState();
// }
//
// class _AccomodationCreatePostState extends State<AccomodationCreatePost> {
//
//
//   List<Data> cityList = [];
//   String? categoryValue;
//
//   _getCities() async {
//     var uri = Uri.parse('${ApiPath.getCitiesUrl}');
//     var request =  http.MultipartRequest("GET", uri);
//     Map<String, String> headers = {
//       "Accept": "application/json",
//     };
//     // print(baseUrl.toString());
//     request.headers.addAll(headers);
//     // request.fields['type_id'] = "1";
//     // request.fields['vendor_id'] = userID;
//     var response = await request.send();
//     print(response.statusCode);
//     String responseData = await response.stream.transform(utf8.decoder).join();
//     var userData = json.decode(responseData);
//     if (mounted) {
//       setState(() {
//         // collectionModal = AllCateModel.fromJson(userData);
//         cityList = CitiesModel.fromJson(userData).data!;
//         // print(
//         //     "ooooo ${collectionModal!.status} and ${collectionModal!.categories!.length} and ${userID}");
//       });
//     }
//     print(responseData);
//   }
//
//
//   createAccomodationForm() async {
//     var headers = {
//       'Cookie': 'ci_session=43aff87f68a58e20a70c2d26db1788da55160f34'
//     };
//     var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}create_accodomation'));
//     request.fields.addAll({
//       'service_name': 'demo',
//       'user_id': '48',
//       'price': '500',
//       'city_id': '42',
//       'date': '2023-01-31',
//       'no_of_person': '4',
//       'available_for': 'couple',
//       'sharing': 'private',
//       'room_type': 'apartment',
//       'rent_type': 'per person',
//       'utilities': 'included',
//       'address': 'indore mp',
//       'food_type': 'veg',
//       'mobile': '8349922853',
//       'note': 'demo',
//     });
//     request.files.add(await http.MultipartFile.fromPath('services_image[]', '/C:/Users/Alphawizz/Downloads/Screenshot_20230310-193717.png'));
//     request.headers.addAll(headers);
//
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
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _getCities();
//   }
//   @override
//   Widget build(BuildContext context) {
//     //  int? value;
//     // _value1=_value1!
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(children: [
//             Stack(
//               children: [
//                 Container(
//                     height: MediaQuery.of(context).size.height / 3,
//                     decoration: const BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage(
//                                 'assets/images/rideScreenimage3.png'),
//                             fit: BoxFit.fill)),
//                     child: CustomAppbar2(
//                       Text2: 'Create Post',
//                     )),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 130.0,left: 5,right: 5),
//                   child: Container(
//                     height: MediaQuery.of(context).size.height /0.8,
//                     width: MediaQuery.of(context).size.width/1.02,
//                     child: Card(
//                       elevation: 40,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Padding(
//                               padding:
//                               const EdgeInsets.only(top: 5.0, bottom: 10),
//                               child: Material(
//                                 // color: splashcolor,
//                                   elevation: 1,
//                                   borderRadius: BorderRadius.circular(10),
//                                   child: Container(
//                                     padding: EdgeInsets.all(12),
//                                     width: MediaQuery.of(context).size.width,
//                                     height: 60,
//                                     child:
//                                     Row(
//                                       children: [
//                                         Image.asset('assets/images/FormCityimage.png',height: 25,width: 25,),
//                                         const SizedBox(width: 15),
//                                         Container(
//                                           width: MediaQuery.of(context).size.width -80,
//                                           child: DropdownButton(
//                                             // Initial Value
//                                             value: categoryValue,
//                                             underline: Container(),
//                                             isExpanded: true,
//                                             // Down Arrow Icon
//                                             icon: const Icon(Icons.keyboard_arrow_down, color: CustomColors.lightblack,),
//                                             hint: const Text("Select City", style: TextStyle(
//                                                 color: CustomColors.lightblack
//                                             ),),
//                                             // Array list of items
//                                             items: cityList.map((items) {
//                                               return DropdownMenuItem(
//                                                 value: items.id,
//                                                 child: Container(
//                                                     child: Text(items.name.toString())),
//                                               );
//                                             }).toList(),
//                                             // After selecting the desired option,it will
//                                             // change button value to selected value
//                                             onChanged: (String? newValue) {
//                                               setState(() {
//                                                 categoryValue = newValue!;
//                                                 print(
//                                                     "selected category ${categoryValue}");
//                                               });
//                                             },
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                               )
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 28.0),
//                             child: Material(
//                               // color: splashcolor,
//                               elevation: 1,
//                               borderRadius: BorderRadius.circular(10),
//                               child: Container(
//                                   width: MediaQuery.of(context).size.width / 1.0,
//                                   height: 110,
//                                   child: Column(children: [
//                                     Row(
//                                       children: [
//                                         Image.asset('assets/images/CreatPostSearchimage.png',height: 40,width: 40,),
//                                         SizedBox(width: 20,),
//                                         Text('I am looking accommodation for..'),
//                                       ],
//                                     ),
//                                     Container(
//                                       width: 380,
//                                       child: Divider(
//                                         color: CustomColors.lightgray,
//                                         thickness: 0.7,
//                                       ),
//                                     ),
//                                     Row(
//                                       children: [
//                                         Image.asset('assets/images/CreatPostAccomondationimage.png',height: 40,width: 40,),
//                                         SizedBox(width: 20,),
//                                         Text('I have accommodation available for.'),
//                                       ],
//                                     ),
//                                   ],)
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 28.0),
//                             child: Material(
//                               // color: splashcolor,
//                               elevation: 1,
//                               borderRadius: BorderRadius.circular(10),
//                               child: Container(
//                                   width: MediaQuery.of(context).size.width ,
//                                   height: 60,
//                                   child: Column(children: [
//                                     Row(
//                                       children: [
//                                         Image.asset('assets/images/CreateFormimage2.png',height: 40,width: 40,),
//                                         SizedBox(width: 20,),
//                                         Text('Move in Date'),
//                                         SizedBox(width: 150,),
//                                         Icon(Icons.date_range,size: 30,color: Colors.lightBlue,)
//                                       ],
//                                     ),
//
//
//                                   ],)
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 28.0),
//                             child: Material(
//                               // color: splashcolor,
//                               elevation: 1,
//                               borderRadius: BorderRadius.circular(10),
//                               child: Container(
//                                   width: MediaQuery.of(context).size.width / 1.0,
//                                   height: 60,
//                                   child: Column(children: [
//                                     Row(
//                                       children: [
//                                         Image.asset('assets/images/usericon.png',height: 40,width: 40,),
//                                         SizedBox(width: 20,),
//                                         Text('How Many Person'),
//                                         SizedBox(width: 150,),
//                                         Icon(Icons.arrow_drop_down_sharp,size: 30,)
//                                       ],
//                                     ),
//
//
//                                   ],)
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 28.0),
//                             child: Material(
//                               // color: splashcolor,
//                               elevation: 1,
//                               borderRadius: BorderRadius.circular(10),
//                               child: Container(
//                                   width: MediaQuery.of(context).size.width / 1.0,
//                                   height: 60,
//                                   child: Column(children: [
//                                     Row(
//                                       children: [
//                                         Image.asset('assets/images/CreatPostCalendarImage.png',height: 40,width: 40,),
//                                         SizedBox(width: 20,),
//                                         Text('Available For :'),
//                                         Radio(
//                                             value: 2,
//                                             groupValue: 'null',
//                                             onChanged: (index) {}),
//                                         Text('Girl'),
//                                         Radio(
//                                             value: 0,
//                                             groupValue: 'null',
//                                             onChanged: (index) {}),
//                                         Text('Boy'),
//                                         Radio(
//                                             value: 2,
//                                             groupValue: 'null',
//                                             onChanged: (index) {}),
//                                       ],
//                                     ),
//                                   ],)
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 28.0),
//                             child: Material(
//                               // color: splashcolor,
//                               elevation: 1,
//                               borderRadius: BorderRadius.circular(10),
//                               child: Container(
//                                   width: MediaQuery.of(context).size.width / 1.0,
//                                   height: 60,
//                                   child: Column(children: [
//                                     Row(
//                                       children: [
//                                         Image.asset('assets/images/CreatPostSharingimage.png',height: 40,width: 40,),
//                                         SizedBox(width: 20,),
//                                         Text('Sharing :'),
//                                         Radio(
//                                             value: 2,
//                                             groupValue: 'null',
//                                             onChanged: (index) {}),
//                                         Text('Private'),
//                                         Radio(
//                                             value: 0,
//                                             groupValue: 'null',
//                                             onChanged: (index) {}),
//                                         Text('Shared'),
//                                       ],
//                                     ),
//
//
//                                   ],)
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 28.0),
//                             child: Material(
//                               // color: splashcolor,
//                               elevation: 1,
//                               borderRadius: BorderRadius.circular(10),
//                               child: Container(
//                                   width: MediaQuery.of(context).size.width / 1.0,
//                                   height: 90,
//                                   child: Column(children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(right: 240.0),
//                                       child: Text('Upload Photo',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Row(
//                                         children: [
//                                           Image.asset('assets/images/CreatePostuploadImage.png',height: 50,width: 60,),
//                                           SizedBox(width: 20,),
//                                           Image.asset('assets/images/CreatePostImage1.png',height: 50,width: 60,),
//                                           SizedBox(width: 10,),
//                                           Image.asset('assets/images/CreatePostImage2.png',height: 50,width: 60,),
//                                         ],
//                                       ),
//                                     ),
//
//
//                                   ],)
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 28.0,),
//                             child: Material(
//                               // color: splashcolor,
//                               elevation: 1,
//                               borderRadius: BorderRadius.circular(10),
//                               child: Container(
//                                   width: MediaQuery.of(context).size.width / 1.0,
//                                   height: 110,
//                                   child: Column(children: [
//                                     Row(
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Image.asset('assets/images/CreatePostImageIcon1.png',height: 40,width: 40,),
//                                         ),
//                                         SizedBox(width: 20,),
//                                         Text('Types:'),
//                                         Radio(
//                                             value: 2,
//                                             groupValue: 'null',
//                                             onChanged: (index) {}),
//                                         Text('Room'),
//                                         Radio(
//                                             value: 0,
//                                             groupValue: 'null',
//                                             onChanged: (index) {}),
//                                         Text('Apartment'),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.only(left: 68.0,),
//                                           child: Radio(
//                                               value: 2,
//                                               groupValue: 'null',
//                                               onChanged: (index) {}),
//                                         ),
//                                         SizedBox(width: 10,),
//                                         Text('House'),
//                                         Radio(
//                                             value: 2,
//                                             groupValue: 'null',
//                                             onChanged: (index) {}),
//                                         Text('Basement'),
//                                       ],
//                                     ),
//                                   ],)
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 28.0),
//                             child: Material(
//                               // color: splashcolor,
//                               elevation: 1,
//                               borderRadius: BorderRadius.circular(10),
//                               child: Container(
//                                   width: MediaQuery.of(context).size.width / 1.0,
//                                   height: 60,
//                                   child: Column(children: [
//                                     Row(
//                                       children: [
//                                         Image.asset('assets/images/CreatPostSharingimage.png',height: 40,width: 40,),
//                                         SizedBox(width: 20,),
//                                         Text('Sharing :'),
//                                         // Radio(
//                                         //     value: 1,
//                                         //     groupValue: _value1,
//                                         //     onChanged: (value) {
//                                         //       setState(() {
//                                         //         _value1 = value!;
//                                         //         roleUser = true;
//                                         //       });
//                                         //     }),
//                                         Text(
//                                           "Company",
//                                         ),
//                                         Text('Private'),
//                                         Radio(
//                                             value: 0,
//                                             groupValue: 'null',
//                                             onChanged: (index) {}),
//                                         Text('Shared'),
//                                       ],
//                                     ),
//                                   ],)
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
