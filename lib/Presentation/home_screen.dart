

import 'dart:convert';

import 'package:connection/Helper/CustomColors.dart';
import 'package:connection/Presentation/RideScreens/rides_screen.dart';
import 'package:connection/Presentation/buttons/CustomButton.dart';
import 'package:connection/Presentation/tiffin_Service_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/Api.path.dart';
import '../Helper/Drawer.dart';
import '../Models/AccomodationdetailsModel.dart';
import '../Models/CaregoriesModel.dart';
import '../Models/TifinDetailsModel.dart';
import 'AccomodationDetails.dart';
import 'MyProfile.dart';
import 'NotificationScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> party = [
    {
      'image': "assets/images/homeScreenimage1.png",
      'text': 'Name Of Tiffin Centre',
      'address': 'E-9, Sai Plaza, under Andhra Bank Main Rd,\n H I G L I G, '
          'LIG Colony, Indore,',
      "time": "10:00 Am To 7:00 Pm",
    },
    {
      'image': "assets/images/homeScreenimage1.png",
      'text': 'Name Of Tiffin Centre',
      'address': 'E-9, Sai Plaza, under Andhra Bank Main Rd,\n H I G L I G, '
          'LIG Colony, Indore,',
      "time": "10:00 Am To 7:00 Pm",
    },

    {
      'image': "assets/images/homeScreenimage1.png",
      'text': 'Name Of Tiffin Centre',
      'address': 'E-9, Sai Plaza, under Andhra Bank Main Rd,\n H I G L I G, '
          'LIG Colony, Indore,',
      "time": "10:00 Am To 7:00 Pm",
    },
    // {"image": "assets/images/2022.png", "name":"Party night" ,"location":"assets/images/location.png","address": "Palsia, Indore"},
  ];

  List<Map<String, dynamic>> party2 = [
    {
      'image': "assets/images/HomeScreenContainerimage.png",
      'title': 'Accommodation',
      'Subtitle': '2351 Hotels',
      "Color": "1",
    },
    {
      'image': "assets/images/HomeScreenContainerimage.png",
      'title': 'Accommodation',
      'Subtitle': '2351 Hotels',
      "Color": "2",
    },
    {
      'image': "assets/images/HomeScreenContainerimage.png",
      'title': 'Accommodation',
      'Subtitle': '2351 Hotels',
      "Color": "3",
    },
    {
      'image': "assets/images/HomeScreenContainerimage.png",
      'title': 'Accommodation',
      'Subtitle': '2351 Hotels',
      "Color": "4",
    },
    {
      'image': "assets/images/HomeScreenContainerimage.png",
      'title': 'Accommodation',
      'Subtitle': '2351 Hotels',
      "Color": "5",
    },
    {
      'image': "assets/images/HomeScreenContainerimage.png",
      'title': 'Accommodation',
      'Subtitle': '2351 Hotels',
      "Color": "6",
    },
    {
      'image': "assets/images/HomeScreenContainerimage.png",
      'title': 'Accommodation',
      'Subtitle': '2351 Hotels',
      "Color": "7",
    },
    {
      'image': "assets/images/HomeScreenContainerimage.png",
      'title': 'Accommodation',
      'Subtitle': '2351 Hotels',
      "Color": "8",
    },
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // Color? clr;
  // Widget categoryCard(int index, ){
  //   if(party2[index]['color']== "1" ){
  //     clr = CustomColors.lightBlue ;
  //   } else if(party2[index]['color']== "2" ){
  //     clr = CustomColors.lightgreen ;
  //   }else if(party2[index]['color']== "3" ){
  //     clr = CustomColors.redColor ;
  //   } else if(party2[index]['color']== "4" ){
  //     clr = CustomColors.lightgreen ;
  //   } else if(party2[index]['color']== "5" ){
  //     clr = CustomColors.lightgreen ;
  //   }else if(party2[index]['color']== "6" ){
  //     clr = CustomColors.lightgreen ;
  //   }else if(party2[index]['color']== "7" ){
  //     clr = CustomColors.lightgreen ;
  //   }else if(party2[index]['color']== "8" ){
  //     clr = CustomColors.lightgreen ;
  //   }
  //
  //   return  Container(
  //     height: 220,
  //     decoration: BoxDecoration(
  //         color: Colors.lightBlue,
  //         borderRadius: BorderRadius.circular(15)),
  //     child: Column(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.only(top: 10.0),
  //           child: Image.asset(
  //             party2[index]['image'],
  //             height: 60,
  //             width: 100,
  //             // fit: BoxFit.fill,
  //           ),
  //         ),
  //         SizedBox(height: 20,),
  //         Text(
  //           party2[index]['title'],
  //           style: TextStyle(
  //               fontSize: 10, fontWeight: FontWeight.w700,color: Colors.white),
  //         ),
  //         Text(
  //           party2[index]['Subtitle'],
  //           style: TextStyle(
  //               fontSize: 10, fontWeight: FontWeight.w700,color: Colors.white),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  TifinDetailsModel? tifinDetailsModel;

  getTifinDetails() async {
    print("Tifin Details");
    var headers = {
      'Cookie': 'ci_session=fa4c23d2aef0ebe3b055a25eb6398f603323b320'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${ApiPath.baseUrl}get_tiffin_vendor'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      var getTifin = TifinDetailsModel.fromJson(jsonDecode(finalResponse));
      print("Profile Here>>>>>>${TifinDetailsModel}");
      setState(() {
        tifinDetailsModel = getTifin;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  CaregoriesModel? categoriesmodel;

  getCategories() async {
    var headers = {
      'Cookie': 'ci_session=fa4c23d2aef0ebe3b055a25eb6398f603323b320'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${ApiPath.baseUrl}get_main_categories'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      var getCategories = CaregoriesModel.fromJson(jsonDecode(finalResponse));
      setState(() {
        categoriesmodel = getCategories;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  AccomodationdetailsModel? accomodationdetailsModel;

  accodomationList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString('user_id');
    var headers = {
      'Cookie': 'ci_session=f39a53b47d4ae69d6958691534596e54ef9fb9cc'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${ApiPath.baseUrl}get_accodomation_list'));
    request.fields.addAll({
      'user_id': user_id.toString(),
    });

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      var accomodationList =
          AccomodationdetailsModel.fromJson(jsonDecode(finalResponse));
      setState(() {
        accomodationdetailsModel = accomodationList;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<bool> showExitPopup() async {
    print('${accomodationdetailsModel?.data?[0].mrpPrice}____________');
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => Stack(
            children: [
              AlertDialog(
                backgroundColor: CustomColors.lightBlue,
                title: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  height: MediaQuery.of(context).size.height / 1.7,
                  width: MediaQuery.of(context).size.width / 1,
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 225.0, left: 5),
                      child: Center(
                        child: Container(
                          height: 25,
                          width: 90,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffF79E3F)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, left: 20),
                            child: Text('Room Price',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xffF79E3F),
                                    fontWeight: FontWeight.w800)),
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 58.0,left: 65),
                    //   child: Container(
                    //     height: 40,
                    //     width: 140,
                    //     decoration: BoxDecoration(
                    //       border: Border.all(color: Color(0xffF79E3F)),
                    //     ),
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Text('Dishes Available',style: TextStyle(fontSize: 15),),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 78.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.red,
                              ),
                              Text(
                                '${accomodationdetailsModel?.data![0].address}',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: CustomColors.primaryColor),
                              ),
                            ],
                          ),
                          Text(
                            '${accomodationdetailsModel?.data?[0].artistName}',
                            style: TextStyle(
                                fontSize: 20, color: CustomColors.primaryColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 28.0),
                            child: Container(
                              height: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: CustomColors.primaryColor),
                              ),
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, left: 15),
                                  child: Row(
                                    children: [
                                      Text('Move in Date:',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: CustomColors.redColor)),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                          '${accomodationdetailsModel!.data![0].date}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  CustomColors.primaryColor)),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text('Availability:',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: CustomColors.redColor)),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text('Avaliable',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  CustomColors.primaryColor)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30.0, left: 15),
                                  child: Row(
                                    children: [
                                      Text('No. Of Persion:',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: CustomColors.redColor)),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                          '${accomodationdetailsModel!.data![0].noOfPerson}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  CustomColors.primaryColor)),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text('Sharing:',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: CustomColors.redColor)),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                          '${accomodationdetailsModel!.data![0].sharing}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  CustomColors.primaryColor)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30.0, left: 20),
                                  child: Row(
                                    children: [
                                      Text('Contact No:',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: CustomColors.redColor)),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                          '${accomodationdetailsModel!.data![0].mobile}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  CustomColors.primaryColor)),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text('Preferred Food:',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: CustomColors.redColor)),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                          '${accomodationdetailsModel!.data![0].foodType}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  CustomColors.primaryColor)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30.0, left: 15),
                                  child: Row(
                                    children: [
                                      Text('Address:',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: CustomColors.redColor)),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                          '${accomodationdetailsModel!.data![0].address}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  CustomColors.primaryColor)),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 28.0),
                            child: Container(
                              height: 80,
                              width: 300,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: CustomColors.primaryColor),
                              ),
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 40.0, left: 30),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              '${accomodationdetailsModel?.data?[0].mrpPrice}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: CustomColors
                                                      .primaryColor)),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '/ Person',
                                            style: TextStyle(
                                                color: CustomColors.redColor),
                                          )
                                        ],
                                      ),
                                      // SizedBox(width: 20,),
                                      // Row(
                                      //   children: [
                                      //     Text('Monthly :',style: TextStyle(fontSize:8,color: CustomColors.primaryColor)),
                                      //     Text('\$30',style: TextStyle(color: CustomColors.redColor),)
                                      //
                                      //   ],
                                      // ),
                                      // SizedBox(width: 20,),
                                      // Row(
                                      //   children: [
                                      //     Text('Yearly :',style: TextStyle(fontSize: 8,color: CustomColors.primaryColor)),
                                      //     Text('\$50',style: TextStyle(color: CustomColors.redColor),)
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 1.2,
                              decoration: BoxDecoration(
                                color: CustomColors.redColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('Contact Now',
                                    style: TextStyle(
                                        color: CustomColors.primaryColor)),
                              ))
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 58.0, left: 130),
                child: CircleAvatar(
                    maxRadius: 70,
                    backgroundImage:
                        AssetImage('assets/images/DialogueboxImage.png')),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      return getTifinDetails();
    });
    Future.delayed(Duration(milliseconds: 500), () {
      return getCategories();
    });
    accodomationList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: GetDrawer(),
        appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[CustomColors.AppbarColor1, CustomColors.AppbarColor2]),
              ),
            ),
          // backgroundColor:
          /*leading: InkWell(
              onTap: () {
                const GetDrawer();
              },
              child: Icon(Icons.dehaze_rounded,color: Colors.white)),*/
          actions: [
            Icon(Icons.chat_rounded, color: Colors.white),
            SizedBox(
              width: 30,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()));
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.notifications_active_outlined,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomColors.TransparentColor),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Icon(
                        Icons.search,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(top: 15, left: 5),
                    border: InputBorder.none,
                    hintText: "Explore Now",
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 238.0),
                child: Text(
                  'Popular Near you',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 15),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: false,
                      scrollDirection: Axis.horizontal,
                      itemCount: tifinDetailsModel?.data?.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: Card(
                            color: CustomColors.TransparentColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    height: 125,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: tifinDetailsModel == null ||
                                                tifinDetailsModel == ""
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : Image.network(
                                                "${tifinDetailsModel?.data?[index].profileImage}",
                                                fit: BoxFit.fill,
                                              ))),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 13),
                                      child: tifinDetailsModel
                                                      ?.data?[index].uname ==
                                                  null ||
                                              tifinDetailsModel
                                                      ?.data?[index].uname ==
                                                  ""
                                          ? Text("---")
                                          : Text(
                                              "${tifinDetailsModel?.data?[index].uname}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Container(
                                      height: 7,
                                      width: 7,
                                      decoration: BoxDecoration(
                                          color: CustomColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Container(
                                          height: 2,
                                          width: 2,
                                          decoration: BoxDecoration(
                                              color: CustomColors.Darkgreen,
                                              borderRadius:
                                                  BorderRadius.circular(50))),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10),
                                  child: Text(
                                    "${tifinDetailsModel?.data?[index].address}",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                // Padding(
                                //   padding:
                                //   const EdgeInsets.only(right: 100.0, top: 10),
                                //   child: Text(
                                //     "${tifinDetailsModel.data[index].t}",
                                //     style: TextStyle(
                                //         fontSize: 10, fontWeight: FontWeight.w700),
                                //   ),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 160, top: 10, right: 10),
                                  child: CustomAppBtn(
                                    onPress: () {
                                      showExitPopup();
                                      // showDialog(
                                      //   context: context,
                                      //   builder: (BuildContext context) {
                                      //     return Container(
                                      //       height: 500,
                                      //      width: MediaQuery.of(context).size.width/1.1,
                                      //      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                                      //       child: Expanded(
                                      //         child: Column(
                                      //           children: [
                                      //             AlertDialog(
                                      //               backgroundColor: CustomColors.secondaryColor,
                                      //               title: const Center(
                                      //                   child: Text('Hotel Elite', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color:CustomColors.primaryColor),
                                      //                   ),
                                      //               ),
                                      //               content: const Center(
                                      //                 child: Text("Contact Us on:", style: TextStyle(color: CustomColors.redColor),
                                      //               ),
                                      //               ),
                                      //               actions: [
                                      //                 Center(
                                      //                   child: ElevatedButton(
                                      //                     child: Text('Contact Now'),
                                      //                     style: ElevatedButton.styleFrom(
                                      //                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                      //                       primary: CustomColors.redColor,
                                      //                       textStyle: const TextStyle(
                                      //                           color: Colors.white,
                                      //                           fontSize: 13,
                                      //                           fontStyle: FontStyle.normal),
                                      //                     ),
                                      //                     onPressed: () {},
                                      //                   ),
                                      //                 ),
                                      //               ],
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     );
                                      //   },
                                      // );
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>RideScreen()));
                                    },
                                    height: 30,
                                    width:
                                        MediaQuery.of(context).size.width / 3.4,
                                    title: 'Know more',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Explore Categories',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 160,
                  ),
                  TextButton(onPressed: () {}, child: Text('See all')),
                ],
              ),
              SizedBox(
                height: 550,
                width: 500,
                child: categoriesmodel == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : categoriesmodel! == null
                        ? const Center(
                            child: Text(
                              "No data to show",
                              style: TextStyle(fontFamily: 'Lora'),
                            ),
                          )
                        : GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                               const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 150,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    crossAxisCount: 3),
                            itemCount: categoriesmodel?.data?.length,
                            itemBuilder: (BuildContext, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                child: InkWell(
                                  onTap: () {
                                    if(index == 0) {
                                      print('${index}__________');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AccommodationScreen()));
                                    }else if(index == 1){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TiffinService()));
                                    }else if(index == 2){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RideScreen()));
                                    }
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height /
                                        1.5,

                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "${categoriesmodel!.data![index].image}"),
                                        )),
                                    // width: MediaQuery.of(context).size.width/1.1,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 80),
                                        Text(
                                          "${categoriesmodel!.data![index].name}",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: CustomColors.primaryColor,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          "${categoriesmodel!.data![index].count}",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: CustomColors.primaryColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
