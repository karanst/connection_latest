import 'package:connection/Presentation/MyProfile.dart';
import 'package:connection/Presentation/authView/sign_In_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Presentation/home_screen.dart';
import '../Presentation/RideScreens/rides_screen.dart';
import '../Presentation/story.dart';
import 'CustomColors.dart';

class GetDrawer extends StatelessWidget {
  const GetDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF010759),
      child: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          ListTile(
            leading: Image.asset("assets/drawerassets/homeicon.png",scale: 4.2,),
            title: const Text(' Home ',style: TextStyle(color: CustomColors.primaryColor)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Image.asset("assets/drawerassets/rideicon.png",scale: 4.2,),
            title: const Text('Rides',style: TextStyle(color: CustomColors.primaryColor)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RideScreen()),
              );
            },
          ),
          ListTile(
            leading: Image.asset("assets/drawerassets/abouticon.png",scale: 4.2,),
            title: const Text(' My Profile ',style: TextStyle(color: CustomColors.primaryColor),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfileScreen()),
              );
            },
          ),
          ListTile(
            leading: Image.asset("assets/drawerassets/acomondationicon4.png",scale: 4.2,),
            title: const Text(' Accommodation ',style: TextStyle(color: CustomColors.primaryColor),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StoryDemo()),
              );
            },
          ),
          ListTile(
            leading: Image.asset("assets/drawerassets/tiffinicon5.png",scale: 4.2,),
            title: const Text(' Tiffin Center  ',style: TextStyle(color: CustomColors.primaryColor),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RideScreen()),
              );
            },
          ),
          // ListTile(
          //   leading: Image.asset("assets/drawerassets/festival6.png",scale: 4.2,),
          //   title: const Text(' Festivals & Events ',style: TextStyle(color: CustomColors.primaryColor),),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => HomeScreen()),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: Image.asset("assets/drawerassets/holyplace7.png",scale: 4.2,),
          //   title: const Text(' Holy Places ',style: TextStyle(color: CustomColors.primaryColor),),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => HomeScreen()),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: Image.asset("assets/drawerassets/indianstore8.png",scale: 4.2,),
          //   title: const Text(' Indian Store ',style: TextStyle(color: CustomColors.primaryColor),),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => HomeScreen()),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: Image.asset("assets/drawerassets/videoicon.png",scale: 4.2,),
          //   title: const Text(' Video ',style: TextStyle(color: CustomColors.primaryColor),),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => HomeScreen()),
          //     );
          //   },
          // ),
          ListTile(
            leading: Image.asset("assets/drawerassets/abouticon.png",scale: 4.2,),
            title: const Text(' About ',style: TextStyle(color: CustomColors.primaryColor),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Image.asset("assets/drawerassets/settingicon.png",scale: 4.2,),
            title: const Text(' Settings ',style: TextStyle(color: CustomColors.primaryColor),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),

          ListTile(
            leading: Image.asset("assets/drawerassets/logout.png",scale: 4.2,),

            title: const Text('Log Out',style: TextStyle(color: CustomColors.primaryColor),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
              // Alert(
              //   context: context,
              //   title: "Log out",
              //   desc: "Are you sure you want to log out?",
              //   style: AlertStyle(
              //       isCloseButton: false,
              //       descStyle:
              //       TextStyle(fontFamily: "MuliRegular", fontSize: 15),
              //       titleStyle: TextStyle(fontFamily: "MuliRegular")),
              //   buttons: [
              //     DialogButton(
              //       child: Text(
              //         "OK",
              //         style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 16,
              //             fontFamily: "MuliRegular"),
              //       ),
              //       onPressed: () async {
              //         setState(() {
              //           userID = '';
              //           userEmail = '';
              //           userMobile = '';
              //           likedProduct = [];
              //           likedService = [];
              //         });
              //         // signOutGoogle();
              //         //signOutFacebook();
              //         preferences!
              //             .remove(SharedPreferencesKey.LOGGED_IN_USERRDATA)
              //             .then((_) {
              //           Navigator.of(context).pushAndRemoveUntil(
              //             MaterialPageRoute(
              //               builder: (context) => Welcome2(),
              //             ),
              //                 (Route<dynamic> route) => false,
              //           );
              //         });
              //
              //         Navigator.of(context, rootNavigator: true).pop();
              //       },
              //       color: backgroundblack,
              //       // color: Color.fromRGBO(0, 179, 134, 1.0),
              //     ),
              //     DialogButton(
              //       child: Text(
              //         "Cancel",
              //         style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 16,
              //             fontFamily: "MuliRegular"),
              //       ),
              //       onPressed: () {
              //         Navigator.of(context, rootNavigator: true).pop();
              //       },
              //       color: backgroundblack,
              //       // gradient: LinearGradient(colors: [
              //       //   Color.fromRGBO(116, 116, 191, 1.0),
              //       //   Color.fromRGBO(52, 138, 199, 1.0)
              //       // ]),
              //     ),
              //   ],
              // ).show();
            },
          ),
        ],
      ),
    );
  }
}
