import 'dart:convert';
import 'package:connection/Presentation/AppBar/CustomAppBar.dart';
import 'package:connection/Presentation/create_accomodation_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Helper/CustomColors.dart';
import '../Helper/Api.path.dart';
import '../Models/AccomodationdetailsModel.dart';


// class AccommodationScreen extends StatefulWidget {
//   const AccommodationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AccommodationScreen> createState() => _AccommodationScreenState();
// }
//
// class _AccommodationScreenState extends State<AccommodationScreen> {
//   TextEditingController searchCtr = TextEditingController();
//
//   AccomodationdetailsModel? accomodationdetailsModel;
//   accodomationList() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? user_id = prefs.getString('user_id');
//     var headers = {
//       'Cookie': 'ci_session=f39a53b47d4ae69d6958691534596e54ef9fb9cc'
//     };
//     var request = http.MultipartRequest(
//         'POST', Uri.parse('${ApiPath.baseUrl}get_accodomation_list'));
//     request.fields.addAll({
//       'user_id': user_id.toString(),
//     });
//
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       var finalResponse = await response.stream.bytesToString();
//       final jsonResponse = json.decode(finalResponse);
//       var accomodationList =
//           AccomodationdetailsModel.fromJson(jsonDecode(finalResponse));
//       setState(() {
//         accomodationdetailsModel = accomodationList;
//       });
//     } else {
//       print(response.reasonPhrase);
//     }
//   }
//
//   searchAccomodation() async {
//     var headers = {
//       'Cookie': 'ci_session=bd1aeb5653cb1b5c5814febbcff1af2959efc103'
//     };
//     var request = http.MultipartRequest(
//         'POST',
//         Uri.parse(
//             'https://developmentalphawizz.com/connection/api/search_accodomation'));
//     request.fields.addAll({
//       'text': searchCtr.text,
//     });
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       print(await response.stream.bytesToString());
//     } else {
//       print(response.reasonPhrase);
//     }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Future.delayed(Duration(milliseconds: 500), () {
//       return accodomationList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> party = [
//       {
//         'image': "assets/images/Accommodationimage2.png",
//         'image1': "assets/images/rideiconImage.png",
//       },
//       {
//         'image': "assets/images/Accommodationimage3.png",
//         'image1': "assets/images/rideiconImage.png",
//       },
//
//       {
//         'image': "assets/images/Accommodationimage4.png",
//         'image1': "assets/images/rideiconImage.png",
//       },
//       {
//         'image': "assets/images/Accommodationimage5.png",
//         'image1': "assets/images/rideiconImage.png",
//       },
//       // {"image": "assets/images/2022.png", "name":"Party night" ,"location":"assets/images/location.png","address": "Palsia, Indore"},
//     ];
//
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(children: [
//             Stack(
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height / 3,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image:
//                               AssetImage('assets/images/rideScreenimage3.png'),
//                           fit: BoxFit.fill)),
//                   // child: CustomAppbar2(Text2: 'Accommodation',)
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 290.0, left: 5, right: 5),
//                   child: Material(
//                     elevation: 4,
//                     child: Container(
//                       height: MediaQuery.of(context).size.height / 1.5,
//                       width: MediaQuery.of(context).size.width * 2,
//                       child: Card(
//                         elevation: 40,
//                         child: accomodationdetailsModel == null
//                             ? Center(
//                                 child: CircularProgressIndicator(),
//                               )
//                             : accomodationdetailsModel! == null
//                                 ? Center(
//                                     child: Text(
//                                       "No data to show",
//                                       style: TextStyle(fontFamily: 'Lora'),
//                                     ),
//                                   )
//                                 : ListView.builder(
//                                     // physics: const NeverScrollableScrollPhysics(),
//                                     shrinkWrap: false,
//                                     scrollDirection: Axis.vertical,
//                                     itemCount:
//                                         accomodationdetailsModel!.data!.length,
//                                     itemBuilder: (context, index) {
//                                       return Padding(
//                                         padding: const EdgeInsets.all(4.0),
//                                         child: Card(
//                                           elevation: 4,
//                                           shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(15)),
//                                           child: Container(
//                                             padding: EdgeInsets.all(4),
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width -
//                                                 30,
//                                             child: Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Container(
//                                                   height: 80,
//                                                   width: 80,
//                                                   decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               12),
//                                                       image: DecorationImage(
//                                                           image: NetworkImage(
//                                                               "${ApiPath.imgUrl}${accomodationdetailsModel!.data![index].servicesImage![0]}"),
//                                                           fit: BoxFit.fill)),
//                                                   // child: Image.network("${ApiPath.imgUrl}${accomodationdetailsModel!.data![index].servicesImage![0]}", fit: BoxFit.fill, height: 100, width: 90,
//                                                   // ),
//                                                 ),
//                                                 SizedBox(width: 5),
//                                                 Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Row(
//                                                       children: [
//                                                         Container(
//                                                           width: 130,
//                                                           child: Row(
//                                                             children: [
//                                                              const Icon(
//                                                                   Icons
//                                                                       .location_on_outlined,
//                                                                   size: 20,
//                                                                   color: Colors
//                                                                       .red),
//                                                               SizedBox(
//                                                                   width: 5),
//                                                               Text(
//                                                                   '${accomodationdetailsModel!.data![index].address}'),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           width: 10,
//                                                         ),
//                                                         Row(
//                                                           children: const [
//                                                             Text(
//                                                               "Status :",
//                                                               style: TextStyle(
//                                                                   color: Colors
//                                                                       .red),
//                                                             ),
//                                                             SizedBox(
//                                                               width: 5,
//                                                             ),
//                                                             Text(
//                                                               'Available',
//                                                               style: TextStyle(
//                                                                   fontSize: 10),
//                                                             )
//                                                           ],
//                                                         ),
//                                                       ],
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                         top: 10.0,
//                                                         right: 180,
//                                                       ),
//                                                       child: Text(
//                                                         '\$ ${accomodationdetailsModel!.data![index].mrpPrice}',
//                                                         style: TextStyle(
//                                                             fontSize: 20),
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                         top: 8.0,
//                                                       ),
//                                                       child: Row(
//                                                         children: [
//                                                           const Padding(
//                                                             padding:
//                                                                 EdgeInsets.only(
//                                                                     right: 10),
//                                                             child: Text(
//                                                               'Move in Date :',
//                                                               style: TextStyle(
//                                                                   color: Colors
//                                                                       .red,
//                                                                   fontSize: 12),
//                                                             ),
//                                                           ),
//                                                           // SizedBox(width: 1,),
//                                                           Text(
//                                                             '${accomodationdetailsModel!.data![index].date}',
//                                                             style:
//                                                                 const TextStyle(
//                                                                     fontSize:
//                                                                         12,
//                                                                     ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding: const EdgeInsets.only(left: 130.0),
//                                                       child: ElevatedButton(
//                                                         child: Text('Know More'),
//                                                         style: ElevatedButton
//                                                             .styleFrom(
//                                                           shape: RoundedRectangleBorder(
//                                                               borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                   30)),
//                                                           primary: CustomColors
//                                                               .secondaryColor,
//                                                           textStyle:
//                                                           const TextStyle(
//                                                               color: Colors
//                                                                   .white,
//                                                               fontSize: 13,
//                                                               fontStyle:
//                                                               FontStyle
//                                                                   .normal),
//                                                         ),
//                                                         onPressed: () {},
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       );
//                                     }),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 100.0, left: 25),
//                   child: Column(
//                     children: [
//                       Text(
//                         "Accomodation",
//                         style: TextStyle(
//                             fontSize: 20, color: CustomColors.primaryColor),
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           searchAccomodation();
//                         },
//                         child: Container(
//                           height: 55,
//                           width: MediaQuery.of(context).size.width / 1.1,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: CustomColors.TransparentColor),
//                           child: TextFormField(
//                             controller: searchCtr,
//                             keyboardType: TextInputType.phone,
//                             decoration: const InputDecoration(
//                               suffixIcon: Padding(
//                                 padding: EdgeInsets.only(top: 5),
//                                 child: Icon(
//                                   Icons.search,
//                                 ),
//                               ),
//                               contentPadding: EdgeInsets.only(top: 15, left: 5),
//                               border: InputBorder.none,
//                               hintText: "Search Accommodation by city",
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 InkWell(
//                   onTap: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=> AccomodationCreatePost()));
//                   },
//                   child: Column(
//                     children: [
//                       Container(
//                         height: MediaQuery.of(context).size.height / 1.5,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           image: DecorationImage(
//                               image: AssetImage(
//                             "assets/Accomodation/banner.png",
//                           )),
//                         ),
//                         // width: MediaQuery.of(context).size.width/1.1,
//                         child: Row(
//                           children: [
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Image.asset(
//                               "assets/Accomodation/addicon.png",
//                               height: 50,
//                               width: 50,
//                             ),
//                             SizedBox(
//                               width: 15,
//                             ),
//                             Text(
//                               "Create Post",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 25,
//                                   color: CustomColors.primaryColor),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }

class AccommodationScreen extends StatefulWidget {
  const AccommodationScreen({Key? key}) : super(key: key);

  @override
  State<AccommodationScreen> createState() => _AccommodationScreenState();
}

class _AccommodationScreenState extends State<AccommodationScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController enquiryController = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();
  TextEditingController searchCtr = TextEditingController();


  String _dateValue = '';
  var dateFormate;
  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }
  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate:  DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025),
        //firstDate: DateTime.now().subtract(Duration(days: 1)),
        // lastDate: new DateTime(2022),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
                primaryColor: CustomColors.secondaryColor,
                accentColor: Colors.black,
                colorScheme:  ColorScheme.light(primary:  CustomColors.secondaryColor),
                // ColorScheme.light(primary: const Color(0xFFEB6C67)),
                buttonTheme:
                ButtonThemeData(textTheme: ButtonTextTheme.accent)),
            child: child!,
          );
        });
    if (picked != null)
      setState(() {
        String yourDate = picked.toString();
        _dateValue = convertDateTimeDisplay(yourDate);
        print(_dateValue);
        dateFormate = DateFormat("dd/MM/yyyy").format(DateTime.parse(_dateValue ?? ""));
        dobcontroller = TextEditingController(text: _dateValue);


      });
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

  searchAccomodation() async {
    var headers = {
      'Cookie': 'ci_session=bd1aeb5653cb1b5c5814febbcff1af2959efc103'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://developmentalphawizz.com/connection/api/search_accodomation'));
    request.fields.addAll({
      'text': searchCtr.text,
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  accodomationEnquiry(String? vId, serviceId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString('user_id');
    var headers = {
      'Cookie': 'ci_session=39129a4c3709e7ee501f96b2ef62b9265ca37832'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}enquiry_accommodation'));
    request.fields.addAll({
      'user_id': user_id.toString(),
      'vendor_id': vId.toString(),
      'service_id': serviceId.toString(),
      'description': enquiryController.text,
      'date':dobcontroller.text
    });

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final result = await response.stream.bytesToString();
      var finalData = json.decode(result);
      Fluttertoast.showToast(msg: "${finalData['message']}");
      Navigator.pop(context);
      setState(() {
        enquiryController.clear();
        dobcontroller.clear();
      });
    }
    else {
    print(response.reasonPhrase);
    }
  }
  Future<void> showInformationDialog(BuildContext context, Data item) async {

    return await showDialog(
        context: context,
        builder: (context) {
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: enquiryController,
                        validator: (value) {
                          return value!.isNotEmpty ? null : " Enter accommodation enquiry";
                        },
                        decoration:
                        InputDecoration(hintText: "Description"),
                      ),

                      TextFormField(
                        onTap: (){
                          _selectDate();
                        },
                        controller: dobcontroller,
                        validator: (value) {
                          return value!.isNotEmpty ? null : " Enter Your Date";
                        },
                        decoration:
                        InputDecoration(hintText: "Select Date"),
                      ),



                    ],
                  )),
              title: Text('Accommodation Enquiry'),
              actions: <Widget>[
                Center(
                  child: InkWell(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.secondaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(40)),),
                      onPressed: (){
                        if (_formKey.currentState!.validate()) {
                          // Do something like updating SharedPreferences or User Settings etc.
                          Navigator.pop(context,{
                            'description': enquiryController.text,
                            'date': dobcontroller.text
                          });
                          accodomationEnquiry(item.vId, item.id);
                        }
                      }, child: Text("Submit"),
                    ),

                  ),
                ),
              ],
            );
          });
        });
  }
  // RideListModel? rideListData;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    accodomationList();
  }
  Future<bool> detailsPopUp(Data item) async {
    return await showDialog(
      //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => Dialog(
          insetPadding: EdgeInsets.symmetric(vertical: 100),
          backgroundColor: Colors.transparent,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                    top: 70,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: CustomColors2.dialogColor,),
                      height: MediaQuery.of(context).size.height / 1.25,
                      width: double.maxFinite,

                    )),
                Positioned(
                    top: 5,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 110,
                            ),
                            CircleAvatar(
                                maxRadius: 70,
                                backgroundImage: NetworkImage(item.profileImage ?? '')),
                            SizedBox(
                              width: 70,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close,
                                      color: Colors.white, size: 30),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.red,
                                ),
                                Text(
                                  item.address.toString(),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: CustomColors.primaryColor),
                                ),
                              ],
                            ),
                            Text(
                              item.address.toString(),
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: CustomColors.primaryColor),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20),
                              padding: const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
                              height: 140,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: CustomColors.primaryColor),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                         const Text("Move in Date : ", style: TextStyle(color: Colors.red, fontSize: 11),),
                                          Text(item.date.toString(), style: const TextStyle(color: Colors.white, fontSize: 11))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("Availability : ", style: TextStyle(color: Colors.red, fontSize: 11),),
                                          Text(item.availableFor.toString(), style: const TextStyle(color: Colors.white, fontSize: 11))
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Text("No of person : ", style: TextStyle(color: Colors.red, fontSize: 11),),
                                          Text(item.noOfPerson.toString(), style: const TextStyle(color: Colors.white, fontSize: 11))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("Sharing : ", style: TextStyle(color: Colors.red, fontSize: 11),),
                                          Text(item.sharing.toString(), style: const TextStyle(color: Colors.white, fontSize: 11))
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Text("Contact No. : ", style: TextStyle(color: Colors.red, fontSize: 11),),
                                          Text(item.mobile.toString(), style: const TextStyle(color: Colors.white, fontSize: 11))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("Preferred Food : ", style: TextStyle(color: Colors.red, fontSize: 11),),
                                          Text(item.foodType.toString(), style: const TextStyle(color: Colors.white, fontSize: 11))
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Text("Address : ", style: TextStyle(color: Colors.red, fontSize: 11),),
                                          Text(item.address.toString(), style: const TextStyle(color: Colors.white, fontSize: 11))
                                        ],
                                      ),

                                    ],
                                  ),
                                ],
                              )
                              // GridView.builder(
                              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              //       crossAxisSpacing: 20,
                              //       mainAxisSpacing: 0,
                              //       childAspectRatio: 2,
                              //       crossAxisCount: 3),
                              //   physics: const NeverScrollableScrollPhysics(),
                              //   itemCount: item.description!.length,
                              //   itemBuilder: (context, i){
                              //     return  Text(item.description![i], style: const TextStyle(
                              //         color: Colors.white
                              //     ),);
                              //   }, ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: CustomColors.primaryColor),
                              ),
                              child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text('Room Price :',
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    color: CustomColors
                                                        .primaryColor)),
                                            Text(
                                              '\$ ${item.mrpPrice.toString()}',
                                              style: TextStyle(
                                                  color: CustomColors
                                                      .primaryColor),

                                            ),
                                            Text(
                                              '/ person',
                                              style: TextStyle(
                                                  color: CustomColors
                                                      .redColor),
                                            )
                                          ],
                                        ),
                                        // SizedBox(
                                        //   width: 20,
                                        // ),
                                        // Row(
                                        //   children: [
                                        //     Text('Monthly :',
                                        //         style: TextStyle(
                                        //             fontSize: 8,
                                        //             color: CustomColors
                                        //                 .primaryColor)),
                                        //     Text(
                                        //       '\$ ${item.perDayCharge.toString()}',
                                        //       style: TextStyle(
                                        //           color: CustomColors
                                        //               .redColor),
                                        //     )
                                        //   ],
                                        // ),
                                        // SizedBox(
                                        //   width: 20,
                                        // ),
                                        // Row(
                                        //   children: [
                                        //     Text('Yearly :',
                                        //         style: TextStyle(
                                        //             fontSize: 8,
                                        //             color: CustomColors
                                        //                 .primaryColor)),
                                        //     Text(
                                        //       '\$ ${item.perDayCharge.toString()}',
                                        //       style: TextStyle(
                                        //           color: CustomColors
                                        //               .redColor),
                                        //     )
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                showInformationDialog(context, item);
                              },
                              child: Text('Enquiry Now'),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(40)),
                                  fixedSize: Size(230, 40)),
                            ),

                          ],
                        ),
                      ],
                    )),
                Positioned(
                  top: 210,
                  left: 130,
                  right: 130,
                  child: Container(
                    height: 25,
                    decoration: BoxDecoration(
                      color: CustomColors2.dialogColor,
                      border: Border.all(color: CustomColors2.lightyellow),
                    ),
                    child: const Center(
                      child: Text(
                        'General info',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: CustomColors2.lightyellow,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 372,
                  left: 150,
                  right: 150,
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: CustomColors2.dialogColor,
                      border: Border.all(color: CustomColors2.lightyellow),
                    ),
                    child: const Center(
                      child: Text(
                        'Price',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: CustomColors2.lightyellow,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    ) ??
        false; //if showDialouge had returned null, then return false
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height/3,
                        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/rideScreenimage3.png'),fit:BoxFit.fill)),
                        child: CustomAppbar2(Text2: 'Accommodation',)
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120.0,left: 5,right: 5),
                      child: Container(
                        height: MediaQuery.of(context).size.height/1,
                        width: MediaQuery.of(context).size.width*2,
                        child: Card(
                          elevation: 40,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0,left: 15, right: 10),
                                child: Container(
                                  height: 55,
                                  width: MediaQuery.of(context).size.width / 1.1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: CustomColors.TransparentColor),
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    decoration: const InputDecoration(
                                      suffixIcon: Padding(
                                        padding:  EdgeInsets.only(top: 5),
                                        child: Icon(
                                          Icons.search,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.only(top: 15, left: 5),
                                      border: InputBorder.none,
                                      hintText: "Search accommodations by city",
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const AccomodationCreatePost()));
                                    },
                                    child: Container(
                                      width:320,
                                      height: 70,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage('assets/Accomodation/banner.png',),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                      child:  Padding(
                                        padding: const EdgeInsets.only(left: 8.0, top: 5),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/Accomodation/addicon.png",
                                              height: 50,
                                              width: 50,
                                            ),
                                            const SizedBox(width: 10,),
                                            const   Text('Create Post',style: TextStyle(
                                                color: CustomColors.primaryColor,fontSize: 20,fontWeight: FontWeight.w400),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                // Image.asset('assets/images/rideScreenimage.png',height: 150,width:380,),
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Container(
                                      width: 130,
                                      child: const Divider(
                                        color: CustomColors.lightgray,
                                        thickness: 0.7,
                                      ),
                                    ),
                                  ),
                                 const  SizedBox(width: 10,),
                                  const Text('OR',style: TextStyle(color: CustomColors.grayColor),),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Container(
                                      width: 150,
                                      child: const Divider(
                                        color: CustomColors.lightgray,
                                        thickness: 0.7,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              accomodationdetailsModel != null?
                              Expanded(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: false,
                                    scrollDirection: Axis.vertical,
                                    itemCount: accomodationdetailsModel!.data!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Card(
                                          elevation: 4,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(15)),
                                          child: Container(
                                            padding: EdgeInsets.all(4),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width -
                                                30,
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 80,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          12),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              "${ApiPath.imgUrl}${accomodationdetailsModel!.data![index].servicesImage![0]}"),
                                                          fit: BoxFit.fill)),
                                                  // child: Image.network("${ApiPath.imgUrl}${accomodationdetailsModel!.data![index].servicesImage![0]}", fit: BoxFit.fill, height: 100, width: 90,
                                                  // ),
                                                ),
                                                SizedBox(width: 5),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 130,
                                                          child: Row(
                                                            children: [
                                                              const Icon(
                                                                  Icons
                                                                      .location_on_outlined,
                                                                  size: 20,
                                                                  color: Colors
                                                                      .red),
                                                              SizedBox(
                                                                  width: 5),
                                                              Text(
                                                                  '${accomodationdetailsModel!.data![index].address}'),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Row(
                                                          children: const [
                                                            Text(
                                                              "Status :",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              'Available',
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                        top: 10.0,
                                                        right: 180,
                                                      ),
                                                      child: Text(
                                                        '\$ ${accomodationdetailsModel!.data![index].mrpPrice}',
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                        top: 8.0,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          const Padding(
                                                            padding:
                                                            EdgeInsets.only(
                                                                right: 10),
                                                            child: Text(
                                                              'Move in Date :',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontSize: 12),
                                                            ),
                                                          ),
                                                          // SizedBox(width: 1,),
                                                          Text(
                                                            '${accomodationdetailsModel!.data![index].date}',
                                                            style:
                                                            const TextStyle(
                                                              fontSize:
                                                              12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 130.0),
                                                      child: ElevatedButton(
                                                        child: Text('Know More'),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  30)),
                                                          primary: CustomColors
                                                              .secondaryColor,
                                                          textStyle:
                                                          const TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 13,
                                                              fontStyle:
                                                              FontStyle
                                                                  .normal),
                                                        ),
                                                        onPressed: () {
                                                          detailsPopUp(accomodationdetailsModel!.data![index]);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              )
                              : Center(child: Container(
                                height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator())),
                            ],
                          ),

                        ),
                      ),
                    ),

                    // InkWell(
                    //   onTap: () {
                    //     Navigator.push(context, MaterialPageRoute(builder: (context)=>RequestinfoScreens()));
                    //   },
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(top: 228.0,left: 90),
                    //     child: Text('Create A New Request ',style: TextStyle(fontSize: 20,color: CustomColors.primaryColor),),
                    //   ),
                    // ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}