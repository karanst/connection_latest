
import 'dart:convert';

import 'package:connection/Presentation/authView/VerifyOtp_Screen.dart';
import 'package:connection/Presentation/authView/sign_In_Screen.dart';
import 'package:connection/Presentation/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Helper/Api.path.dart';
import '../../Helper/CustomColors.dart';
import 'package:http/http.dart' as http;
import '../buttons/CustomButton.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameCtr = TextEditingController();
  TextEditingController mobilectr = TextEditingController();
  TextEditingController emialCtr = TextEditingController();

  register() async{
    print("register user");
    var headers = {
      'Cookie': 'ci_session=2b0e1914cb1dcf27b59429d8d042917dbae564ce'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}register'));
    request.fields.addAll({
      'email': emialCtr.text,
      'mobile': mobilectr.text,
      'username': nameCtr.text,
    });
    print("${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      if(jsonResponse['status'] == "success"){
        Fluttertoast.showToast(msg: '${jsonResponse['message']}');
        print("json response ${jsonResponse}");
        setState(() {
          print("final response>>>>> ${jsonResponse}");
        });
        Fluttertoast.showToast(msg: "${jsonResponse['message']}");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      }
      else{
        Fluttertoast.showToast(msg: "${jsonResponse['message']}");
        // setState(() {});
      }
    }
    else {
      setState(() {});
      print(response.reasonPhrase);
      // var finalResponse = await response.stream.bytesToString();
      // final jsonResponse = json.decode(finalResponse);
      // print("Finallll${finalResponse}");
      // print(jsonResponse.toString());
    }
  }
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Form(
        key: _formKey,
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
                            child: Text('SIGN Up', style: TextStyle(
                                color: CustomColors.primaryColor,fontSize: 40,fontWeight: FontWeight.w400),),
                          ),
                          // const Padding(
                          //   padding: EdgeInsets.only(left: 38.0,top: 10),
                          //   child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                          //       "Lorem Ipsum has been the industry's" "standard dummy text ever since the 1500s",style: TextStyle(
                          //       color: CustomColors.primaryColor),),
                          // ),
                          SizedBox(height: 50,),
                          Container(
                            height: 400,
                            width: 340,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: CustomColors.primaryColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 28.0),
                                  child: SizedBox(
                                    width: 280,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter name';
                                        }
                                        return null;
                                      },
                                      controller: nameCtr,
                                      decoration: InputDecoration(
                                          hintText: 'Name',suffixIcon: Icon(Icons.person,color: Colors.black)
                                      ),
                                    ),
                                  ),
                                ),
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
                                      maxLength: 10,
                                      keyboardType: TextInputType.number,
                                      controller: mobilectr,
                                      decoration: InputDecoration(
                                          hintText: 'Mobile',suffixIcon: Icon(Icons.phone_android,color: Colors.black,)
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 18.0),
                                  child: SizedBox(
                                    width: 280,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter email';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      controller: emialCtr,
                                      decoration: InputDecoration(
                                          hintText: 'Email',suffixIcon: Icon(Icons.mail,color: Colors.black,)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40,),
                                CustomAppBtn(height: 50,width: 300,title: 'Sign Up',
                                  onPress: () {
                                    if (_formKey.currentState!.validate()) {
                                      register();
                                      // ScaffoldMessenger.of(context).showSnackBar(
                                      //   SnackBar(content: Text('User Login Success')),
                                      // );
                                    }
                                  // register();
                                },),
                              ],
                            ),
                          ),
                          // SizedBox(height: 50,),
                          // const Text('Sign In With Social accounts',
                          //   style: TextStyle(color: CustomColors.primaryColor),),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 120),
                            child: Row(
                              children: [
                                const Text("All ready have an account?",
                                  style: TextStyle(color: CustomColors.primaryColor),
                                ),
                                InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
                                    },
                                    child: Text("Login",style: TextStyle(color: CustomColors.primaryColor, fontWeight: FontWeight.bold))),
                              ],
                            ),
                          ),
                        ],
                      ))),
            ]),
      ),
    );
  }
}
