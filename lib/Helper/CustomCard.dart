import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
   CustomCard({Key? key,this.image, this.title, this.subtitle, this.Money, this.driver, this.rideTime,

  }) : super(key: key);
  
final  String? image ;
final String? title;
final String? subtitle;
final String? Money;
final String? driver;
final String? rideTime;

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/riderequestimage.png',height: 110,width: 100,),
        ],
      ),
    );
  }
}
