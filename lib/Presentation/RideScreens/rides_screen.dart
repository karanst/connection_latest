import 'package:connection/Helper/CustomCard.dart';
import 'package:connection/Presentation/AppBar/CustomAppBar.dart';
import 'package:connection/Presentation/RideScreens/ridelist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Helper/CustomColors.dart';
import '../PassengerRideScreens/PassengerRideScreen1.dart';
import '../PassengerRideScreens/passengers_list_screen.dart';

class RideScreen extends StatefulWidget {
  const RideScreen({Key? key}) : super(key: key);

  @override
  State<RideScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
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
                      height:MediaQuery.of(context).size.height/1.5,
                      width: MediaQuery.of(context).size.width*1,
                      child: Card(
                        elevation: 15,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const RidesScreen()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10),
                                child: Container(
                                height: 150,width:380,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/rideScreenimage.png',),
                                      fit: BoxFit.fill
                                    )
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 8.0, top: 35),
                                    child: Text('I am Looking For \nRide',style: TextStyle(
                                        color: CustomColors.primaryColor,fontSize: 20,fontWeight: FontWeight.w700),),
                                  ),
                                )
                                // Image.asset('assets/images/rideScreenimage.png',height: 150,width:380,),
                              ),
                            ),
                            SizedBox(height: 20,),
                            InkWell(
                                onTap: () {
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const PassengerListScreen()));
                                },
                                child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10),
                                    child: Container(
                                      height: 150,width:380,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage('assets/images/rideScreenimage2.png',),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 8.0, top: 35),
                                        child:  Text('I am Looking For \nPassenger',style: TextStyle(
                                            color: CustomColors.primaryColor,fontSize: 20,fontWeight: FontWeight.w700),),
                                      ),
                                    )
                                  // Image.asset('assets/images/rideScreenimage.png',height: 150,width:380,),
                                ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

              ],
            ),
          ]),
        ),
      ),
    );
  }
}
