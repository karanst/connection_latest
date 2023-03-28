import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Helper/CustomColors.dart';
import 'AppBar/CustomAppBar.dart';
import 'buttons/CustomButton.dart';

class CompletedRideScreen extends StatelessWidget {
  const CompletedRideScreen({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.only(top: 130.0,left: 5,right: 5),
                  child: Container(
                    height: MediaQuery.of(context).size.height /1,
                    width: MediaQuery.of(context).size.width/1.02,
                    child: Card(
                      elevation: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 58.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Total Fare Amount',style: TextStyle(fontSize: 20,color: Colors.grey)),
                                SizedBox(width: 80,),
                                Text('\$60',style: TextStyle(fontSize: 20),),
                              ],
                            ),
                          ),
                          SizedBox(height: 40,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,right: 10),
                            child: Container(
                              width: 320,
                              child: Divider(
                                color: CustomColors.lightgray,
                                thickness: 0.7,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset('assets/images/RideCompleteimage.png',height: 130,width: 130,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Driver',style: TextStyle(color: Colors.grey,fontSize: 20),),
                                  SizedBox(height: 20,),
                                  Text('Johan Deo',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),)
                                ],
                              ),
                              SizedBox(width: 80,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Vehicle no',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
                                  Text('Mp 0954225',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Text('Number of Person',style: TextStyle(color: Colors.grey),),
                                SizedBox(width: 30,),
                                Text('Distance',style: TextStyle(color: Colors.grey)),
                                SizedBox(width: 30,),
                                Text('Time',style: TextStyle(color: Colors.grey)),
                                SizedBox(width: 30,),
                                Text('Total Price',style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: const [
                              SizedBox(height: 10,),
                              Text('3 Min',style: TextStyle(fontSize: 17)),
                              SizedBox(width: 120,),
                              Text('10KM',style: TextStyle(fontSize: 17)),
                              SizedBox(width: 40,),
                              Text('20Min'),
                              SizedBox(width: 40,),
                              Text('\$60',style: TextStyle(fontSize: 17))
                            ],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40,left: 20.0,right: 10),
                            child: Container(
                              width: 320,
                              child: Divider(
                                color: CustomColors.lightgray,
                                thickness: 0.7,
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          Column(
                            children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text('You are at your destination.',style: TextStyle(
                                  fontSize: 20,fontWeight: FontWeight.w700),),
                            ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0,top: 40),
                                child: Image.asset('assets/images/dashlineimage.png',width: 250,),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 78.0),
                                    child: Text('Start',style: TextStyle(fontSize: 20,color: Colors.grey),),
                                  ),
                                  SizedBox(width: 180,),
                                  Text("End",style: TextStyle(fontSize: 20,color: Colors.grey),),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 58.0,left: 30),
                                child: Row(
                                  children: [
                                    Text('Radisson Hotel,\n Indore, Madhya Pradesh,\n India',
                                        style: TextStyle(fontSize: 17,color: Colors.grey)),
                                    SizedBox(width: 30,),
                                    Text('Vijay nagar \n Square,Indore',
                                        style: TextStyle(fontSize: 17,color: Colors.grey))
                                  ],
                                ),
                              ),
                              SizedBox(height: 40,),
                              CustomAppBtn(
                                height: 50,
                                width: 300,
                                title: 'Pay Now',
                                onPress: () {
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context) => PassengerRide()));
                                },
                              ),
                          ],)
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
    );;
  }
}
