import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Helper/CustomColors.dart';
import '../AppBar/CustomAppBar.dart';

class PassengerRide extends StatefulWidget {
  const PassengerRide({Key? key}) : super(key: key);

  @override
  State<PassengerRide> createState() => _PassengerRideState();
}

class _PassengerRideState extends State<PassengerRide> {
  List<Map<String, dynamic>> party = [
    {
      'image': 'assets/images/travlinguser.png',
      'image1': "assets/images/rideiconImage.png",
      'image2': 'assets/images/travlingbag.png'
    },
    {
      'image': 'assets/images/travlinguser.png',
      'image1': "assets/images/rideiconImage.png",
      'image2': 'assets/images/travlingbag.png'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/rideScreenimage3.png'),
                            fit: BoxFit.fill)),
                    child: CustomAppbar2(
                      Text2: 'Ride',
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 120.0),
                  child: Container(
                    height: 700,
                    child: Card(
                      elevation: 4,
                      child: ListView.builder(
                          shrinkWrap: false,
                          scrollDirection: Axis.vertical,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 18.0,left: 15),
                                  child: Container(
                                    height: 55,
                                    width: MediaQuery.of(context).size.width / 1.1,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: CustomColors.TransparentColor),
                                    child: TextFormField(
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        suffixIcon: Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Icon(
                                            Icons.search,
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.only(top: 15, left: 5),
                                        border: InputBorder.none,
                                        hintText: "Search location",
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 10, right: 10),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height /5,
                                    // width: 420,
                                    child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            party[index]['image'],
                                            height: 100,
                                            width: 80,
                                          ),
                                          Image.asset(
                                            party[index]['image1'],
                                            height: 50,
                                            width: 50,
                                          ),

                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 18.0),
                                                    child: Text(
                                                        "Alex Hotel Inore MP"),
                                                  ),
                                                  Image.asset(
                                                    party[index]['image2'],
                                                    height: 70,
                                                    width: 100,
                                                  ),

                                                ],
                                              ),
                                              Container(
                                                width: 110,
                                                child: Divider(
                                                  color:
                                                      CustomColors.lightgray,
                                                  thickness: 0.7,
                                                ),
                                              ),
                                              Text("Sunshine Hotel,indore"),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Passenger:",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                  Text(
                                                    "Ajay",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Ride Time:",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.red),
                                                      ),
                                                      Text(
                                                        "2:00pm",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 10, right: 10),
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height / 5,
                                    // width: 420,
                                    child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            party[index]['image'],
                                            height: 100,
                                            width: 80,
                                          ),
                                          Image.asset(
                                            party[index]['image1'],
                                            height: 50,
                                            width: 50,
                                          ),

                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 18.0),
                                                    child: Text(
                                                        "Alex Hotel Inore MP"),
                                                  ),
                                                  Image.asset(
                                                    party[index]['image2'],
                                                    height: 70,
                                                    width: 100,
                                                  ),

                                                ],
                                              ),
                                              Container(
                                                width: 110,
                                                child: Divider(
                                                  color:
                                                  CustomColors.lightgray,
                                                  thickness: 0.7,
                                                ),
                                              ),
                                              Text("Sunshine Hotel,indore"),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Passenger:",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                  Text(
                                                    "Ajay",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Ride Time:",
                                                        style: TextStyle(
                                                            color:
                                                            Colors.red),
                                                      ),
                                                      Text(
                                                        "2:00pm",
                                                        style: TextStyle(
                                                            color:
                                                            Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 10, right: 10),
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height / 5,
                                    // width: 420,
                                    child:Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            party[index]['image'],
                                            height: 100,
                                            width: 80,
                                          ),
                                          Image.asset(
                                            party[index]['image1'],
                                            height: 50,
                                            width: 50,
                                          ),

                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 18.0),
                                                    child: Text(
                                                        "Alex Hotel Inore MP"),
                                                  ),
                                                  Image.asset(
                                                    party[index]['image2'],
                                                    height: 70,
                                                    width: 100,
                                                  ),

                                                ],
                                              ),
                                              Container(
                                                width: 110,
                                                child: Divider(
                                                  color:
                                                  CustomColors.lightgray,
                                                  thickness: 0.7,
                                                ),
                                              ),
                                              Text("Sunshine Hotel,indore"),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Passenger:",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                  Text(
                                                    "Ajay",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Ride Time:",
                                                        style: TextStyle(
                                                            color:
                                                            Colors.red),
                                                      ),
                                                      Text(
                                                        "2:00pm",
                                                        style: TextStyle(
                                                            color:
                                                            Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 10, right: 10),
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height / 5,
                                    // width: 420,
                                    child:Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            party[index]['image'],
                                            height: 100,
                                            width: 80,
                                          ),
                                          Image.asset(
                                            party[index]['image1'],
                                            height: 50,
                                            width: 50,
                                          ),

                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 18.0),
                                                    child: Text(
                                                        "Alex Hotel Inore MP"),
                                                  ),
                                                  Image.asset(
                                                    party[index]['image2'],
                                                    height: 70,
                                                    width: 100,
                                                  ),

                                                ],
                                              ),
                                              Container(
                                                width: 110,
                                                child: Divider(
                                                  color:
                                                  CustomColors.lightgray,
                                                  thickness: 0.7,
                                                ),
                                              ),
                                              Text("Sunshine Hotel,indore"),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Passenger:",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                  Text(
                                                    "Ajay",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Ride Time:",
                                                        style: TextStyle(
                                                            color:
                                                            Colors.red),
                                                      ),
                                                      Text(
                                                        "2:00pm",
                                                        style: TextStyle(
                                                            color:
                                                            Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // Image.asset('assets/images/requestinfoimage.png',height: 150,width:400,),
                              ],
                            );
                          }),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 178,left: 50),
                //   child: Text('I Am Looking For \n Ride',style: TextStyle(
                //       color: CustomColors.primaryColor,fontSize: 20,fontWeight: FontWeight.w700),),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 348.0,left: 50),
                //   child: Text('I Am Looking For\n Passenger',style: TextStyle(
                //       color: CustomColors.primaryColor,fontSize: 20,fontWeight: FontWeight.w700),),
                // ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
