import 'dart:convert';

import 'package:connection/Presentation/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Helper/Api.path.dart';
import '../../Helper/CustomColors.dart';
import '../buttons/CustomButton.dart';
import '../RideScreens/rides_screen.dart';

class VerifyOTP extends StatefulWidget {
  String? otp;
  String? mobile;
  VerifyOTP({Key? key, this.otp, this.mobile}) : super(key: key);

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  TextEditingController mobileCtr = TextEditingController();

  verifyOtp() async{
    SharedPreferences prefs  = await SharedPreferences.getInstance();
    print("Verify Otp Api");
    var headers = {
      'Cookie': 'ci_session=b4e738353dd242953b4407faa282bff505a091f1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}verify_otp'));
    request.fields.addAll({
      'mobile': widget.mobile.toString(),
      'otp': widget.otp.toString()
    });
    print("${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      print("Workingg Noww ${jsonResponse}");
      if(jsonResponse['status'] == "success"){
        Fluttertoast.showToast(msg: '${jsonResponse['message']}');
        print("json response here ${jsonResponse}");
        String? user_id = jsonResponse['user_id'].toString();
        prefs.setString('user_id', user_id.toString());
        print("User Id Is ${user_id.toString()}");
        setState(() {
          print("final response now ${jsonResponse}");
        });
        Fluttertoast.showToast(msg: "${jsonResponse['message']}");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      }
      else{
        Fluttertoast.showToast(msg: "${jsonResponse['message']}");
        setState(() {});
      }
    }
    else {
      print(response.reasonPhrase);
    }
  }


  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.95,
                  decoration: BoxDecoration(
                      image:DecorationImage(
                          image:AssetImage('assets/images/SignInimage.png'),
                          fit: BoxFit.fill
                      )
                  ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom:10),
                          child: Text('Enter 4 Digit Code', style: TextStyle(
                              color: CustomColors.primaryColor,fontSize: 30,fontWeight: FontWeight.w400),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: Text("OTP ${widget.otp.toString()}",style: const TextStyle(
                              color: CustomColors.primaryColor, fontSize: 18, fontWeight: FontWeight.w400)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 108.0),
                          child: Container(
                            height: 300,
                            width: 340,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: CustomColors.primaryColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 28.0),
                                  child: SizedBox(
                                    width: 280,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter OTP';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.number,
                                        controller: mobileCtr,
                                      decoration: InputDecoration(
                                          hintText: 'Enter Otp',suffixIcon: Icon(Icons.lock,color: Colors.black,)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.restart_alt),
                                      SizedBox(width: 10,),
                                      TextButton( onPressed: () {}, child:Text('Resend Otp',style: TextStyle(
                                          color: CustomColors.lightblack),),),
                                      // SizedBox(width: 10,),
                                      // Icon(Icons.edit),
                                      // TextButton( onPressed: () {}, child:Text('Edit Number',style: TextStyle(
                                      //     color: CustomColors.lightblack),),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30,),
                                CustomAppBtn(height: 50,width: 300,title: 'Verify',onPress: () {
                                  if (_formKey.currentState!.validate()) {
                                   verifyOtp();
                                  }
                                },),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
