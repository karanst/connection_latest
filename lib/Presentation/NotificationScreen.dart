// import 'package:connection/Presentation/RequestScreen1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Helper/CustomColors.dart';
import 'AppBar/CustomAppBar.dart';
import 'buttons/CustomButton.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

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
                      Text2: 'Notifications',
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 130.0,left: 5,right: 5),
                  child: Container(
                    height: MediaQuery.of(context).size.height /1,
                    width: MediaQuery.of(context).size.width/1.02,
                    child: Card(
                      elevation: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: Text('Today',style: TextStyle(color: Colors.black),),
                          ),
                          Row(
                            children: [
                              Image.asset('assets/images/RideCompleteimage.png',height: 130,width: 130,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 48.0),
                                    child: Text('Congratulations!'
                                        ' Johne Dow has Accepted Your Offer.\n Start Ride With Him.',style: TextStyle(color: Colors.grey,fontSize: 10),),
                                  ),
                                  SizedBox(height: 20,),
                                  Text('Fare Amount : \$50',style: TextStyle(
                                      color: Colors.black,fontWeight: FontWeight.w600),),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(top: 50,left: 10),
                                        child: CustomAppBtn(
                                          onPress: () {
                                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>RideScreen()));
                                          },
                                          height: 30,
                                          width: 100,
                                          title: 'Chat',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(top: 50,left: 10),
                                        child: CustomAppBtn(
                                          onPress: () {
                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>RequestScreen()));
                                          },
                                          height: 30,
                                          width: 100,
                                          title: 'Call',
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
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
