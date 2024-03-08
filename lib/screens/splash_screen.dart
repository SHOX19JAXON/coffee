import 'package:flutter/material.dart';

import '../utils/images/app_images.dart';
import '../utils/size/size_utils.dart';
import 'home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImages.font,
              width:double.infinity,
              height: 500,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("FIND THE BEST COFFEE FOR YOU",style: TextStyle(color: Colors.white,fontSize: 32.w),textAlign: TextAlign.center,),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 5.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
            ),
              child: TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              }, child: Text("Proceed")))
        ],
      ),
    );
  }
}
