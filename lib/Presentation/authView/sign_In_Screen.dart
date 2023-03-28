
import 'dart:convert';

import 'package:connection/Presentation/authView/SignUp_Screen.dart';
import 'package:connection/Presentation/authView/VerifyOtp_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Helper/Api.path.dart';
import '../../Helper/CustomColors.dart';
import '../buttons/CustomButton.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController mobileCtr = TextEditingController();
  bool isLodding = false;

  String? token;

  getToken() async {
    // var fcmToken = await FirebaseMessaging.instance.getToken();
    setState(() {
      // token = fcmToken.toString();
    });
    print("FCM ID Is $token");
  }

  userLogin() async{
    print("user Login api");
    SharedPreferences prefs  = await SharedPreferences.getInstance();
    var headers = {
      'Cookie': 'ci_session=b4e738353dd242953b4407faa282bff505a091f1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}send_otp'));
    request.fields.addAll({
      'mobile': mobileCtr.text,
      'Device_token': token.toString(),
    });
    print("${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      print("Response Here@@@@@@ ${jsonResponse}");
      if(jsonResponse['status'] == "success"){
        Fluttertoast.showToast(msg: '${jsonResponse['message']}');
        setState(() {
          isLodding = false;
        });
        String? otp = jsonResponse['otp'].toString();
        prefs.setString('otp', otp.toString());
        print("Otp Is ${otp.toString()}");
        String? mobile = jsonResponse['mobile'].toString();
        prefs.setString('mobile', mobile.toString());
        print("Mobile ${mobile.toString()}");
        setState(() {
          print("final response>>>>> ${jsonResponse}");
        });
        Fluttertoast.showToast(msg: "${jsonResponse['message']}");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> VerifyOTP(otp: otp.toString(), mobile: mobile.toString(),)));
      }
      else{
        setState(() {
          isLodding = false;
        });
        Fluttertoast.showToast(msg: "${jsonResponse['message']}");
      }
    }
    else {
      print(response.reasonPhrase);
      // var finalResponse = await response.stream.bytesToString();
      // final jsonResponse = json.decode(finalResponse);
      // print(jsonResponse.toString());
      // Fluttertoast.showToast(msg: "${jsonResponse['message']}");
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*1,
              decoration: const BoxDecoration(
                      image:DecorationImage(
                          image:AssetImage('assets/images/SignInimage.png'),
                          fit: BoxFit.fill
                      )
                  ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 110.0),
                        child: Text('SIGN IN', style: TextStyle(
                            color: CustomColors.primaryColor,fontSize: 40,fontWeight: FontWeight.w400),),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 38.0,top: 10),
                        child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                             "Lorem Ipsum has been the industry's" "standard dummy text ever since the 1500s",style: TextStyle(
                            color: CustomColors.primaryColor),),
                      ),
                      SizedBox(height: 50,),
                      Container(
                        height: 280,
                        width: 340,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CustomColors.primaryColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // const Padding(
                            //   padding: EdgeInsets.only(top: 28.0),
                            //   child: SizedBox(
                            //     width: 280,
                            //     child: TextField(
                            //       decoration: InputDecoration(
                            //           hintText: 'Name',suffixIcon: Icon(Icons.person,color: Colors.black)
                            //       ),
                            //     ),
                            //   ),
                            // ),
                             Padding(
                              padding: EdgeInsets.only(top: 28.0),
                              child: SizedBox(
                                width: 280,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter mobile';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
                                  controller: mobileCtr,
                                  decoration: InputDecoration(
                                    counterText: "",
                                      hintText: 'Mobile',suffixIcon: Icon(Icons.phone_android,color: Colors.black,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 55,),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  isLodding = true;
                                });
                                if (_formKey.currentState!.validate()) {
                                  userLogin();
                                }else{
                                  setState(() {
                                    isLodding = false;
                                  });
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          CustomColors.AppBtnColor1,
                                          CustomColors.AppbarColor2,
                                        ],
                                        stops: [
                                          0,
                                          1,
                                        ]),
                                    borderRadius: BorderRadius.circular(60),
                                    border: Border.all(color:CustomColors.secondaryColor)
                                ),
                                height: 50,
                                width: 300,
                                child: Center(
                                  child: isLodding ? CircularProgressIndicator(color: Colors.white,) :
                                  const Text(
                                    "Sign In",
                                    style:  TextStyle(
                                      color: CustomColors.primaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            // CustomAppBtn(
                            //   height: 50,
                            //   width: 300,
                            //   title: isLodding == true ? 'SIGN IN':'loading...',
                            //   onPress: () {
                            //   setState(() {
                            //     isLodding = true;
                            //   });
                            //   if (_formKey.currentState!.validate()) {
                            //     userLogin();
                            //   }
                            //   // else{
                            //   //
                            //   //   setState(() {
                            //   //     isLodding = true;
                            //   //   });
                            //   // }
                            //   // userLogin();
                            // },),
                          ],
                        ),
                      ),
                      // SizedBox(height: 50,),
                      // const Text('Sign In With Social accounts',
                      //   style: TextStyle(color: CustomColors.primaryColor),),
                      SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/facebookimage.png',height: 40,width: 60,),
                          SizedBox(width: 10),
                          Image.asset('assets/images/googleimage.png',height: 40,width: 60,),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?",
                            style: TextStyle(color: CustomColors.primaryColor),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen()));
                            },
                              child: const Text("Sign Up",style: TextStyle(color: CustomColors.primaryColor, fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ],
                  ))),
    ]),
        ),
      ),
    );
  }
}
