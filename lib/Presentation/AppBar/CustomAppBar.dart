import 'package:connection/Presentation/NotificationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Helper/CustomColors.dart';
import '../PassengerRideScreens/PassengerRideScreen1.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required String text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height/12,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [
                  CustomColors.AppbarColor1,
                  CustomColors.AppbarColor2,
                ],
                stops: [
                  0,
                  1,
                ]),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(onTap:(){

                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>const getDrawer()));
                },
                    child: Icon(Icons.dehaze_rounded,color: Colors.white,)),
              ),
              SizedBox(width: 240,),
              Icon(Icons.chat_rounded,color: Colors.white,),
              SizedBox(width: 30,),
              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PassengerRide()));
                  },
                  child: Icon(Icons.notifications_active_outlined,color: Colors.white,)),
            ],
          ),
        ),

      ],
    );
  }
}
class CustomAppbar2 extends StatelessWidget {
   CustomAppbar2({Key? key,this.Text2}) : super(key: key);
String? Text2;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 8, top: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),

              IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const NotificationScreen()));
                },
                  icon: Icon(Icons.notifications_active_outlined,color: Colors.white,)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: Text('${Text2}',style: TextStyle(
              color: CustomColors.primaryColor,fontSize: 25,fontWeight: FontWeight.w500),),
        ),
      ]
    );
  }
}
