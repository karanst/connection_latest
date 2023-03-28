import 'dart:convert';

import 'package:connection/Helper/Api.path.dart';
import 'package:connection/Models/ride_list_model.dart';
import 'package:connection/Presentation/AppBar/CustomAppBar.dart';
import 'package:connection/Presentation/RideScreens/ride_request_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Helper/CustomCard.dart';
import '../../Helper/CustomColors.dart';

class RidesScreen extends StatefulWidget {
  const RidesScreen({Key? key}) : super(key: key);

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {
  RideListModel? rideListData;

  ridesList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString('user_id');
    var headers = {
      'Cookie': 'ci_session=f39a53b47d4ae69d6958691534596e54ef9fb9cc'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse(ApiPath.getRideList));
    request.fields.addAll({
      'user_id': user_id.toString(),
    });

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      var rideLst =
      RideListModel.fromJson(jsonResponse);
      setState(() {
        rideListData = rideLst;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ridesList();
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
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/rideScreenimage3.png'),fit:BoxFit.fill)),
                      child: CustomAppbar2(Text2: 'Rides',)
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
                                      hintText: "Search locations",
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RideRequestScreen()));
                                    },
                                    child: Container(
                                      width:320,
                                      height: 70,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage('assets/images/NewRequestimage.png',),
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
                                            const Text('Create a new request',style: TextStyle(
                                                color: CustomColors.primaryColor,fontSize: 20,fontWeight: FontWeight.w400),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                // Image.asset('assets/images/rideScreenimage.png',height: 150,width:380,),
                              ),
                             const SizedBox(height: 20,),
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
                                 const  Text('OR',style: TextStyle(color: CustomColors.grayColor),),
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
                              rideListData != null ?
                              Expanded(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: false,
                                    scrollDirection: Axis.vertical,
                                    itemCount: rideListData!.data!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: Card(
                                          elevation: 4,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Image.asset('assets/images/riderequestimage.png',
                                                  height: 80,
                                                  width: 80,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                                                  child: Image.asset('assets/images/rideiconImage.png',
                                                    height: 50,
                                                    // width: 50,
                                                  ),
                                                ),
                                                Container(
                                                  // width: 150,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Container(
                                                                width: 170,
                                                                  child: Text(rideListData!.data![index].pickupAddress.toString())),
                                                              Container(
                                                                width: 140,
                                                                child: const Divider(
                                                                  color: CustomColors.lightgray,
                                                                  thickness: 0.7,
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 170,
                                                                  child: Text(rideListData!.data![index].dropAddress.toString())),
                                                              SizedBox(height: 20,),

                                                            ],),
                                                          Text(rideListData!.data![index].paidAmount.toString(), style: const TextStyle(
                                                            fontSize: 24,
                                                          ),)
                                                        ],
                                                      ),
                                                      Wrap(
                                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text("Driver : ", style:  TextStyle(color:  Colors.red, fontSize: 11),),
                                                              Text(rideListData!.data![index].passengerName.toString(),
                                                                style: TextStyle(fontSize: 11),),
                                                            ],
                                                          ),
                                                          const SizedBox(width: 15,),
                                                          Row(
                                                            children: [
                                                              Text("Ride Time : ", style:  TextStyle(color:  Colors.red, fontSize: 11),),
                                                              Text(rideListData!.data![index].bookingTime.toString(),
                                                                style: TextStyle(fontSize: 11),),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              )
                              : Center(
                                child: Container(
                                  width: 30,
                                    height: 30,
                                    child: CircularProgressIndicator()),
                              ),
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
