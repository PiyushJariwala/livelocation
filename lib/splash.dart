import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigator();
  }

  void _navigator()
  async{
    await Future.delayed(Duration(seconds: 2),);
    Navigator.pushReplacementNamed(context, '/location');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map_outlined,size: 200,color: Colors.greenAccent,),
            Text("NaKaSha",style: TextStyle(color: Colors.greenAccent,fontSize: 30,fontWeight: FontWeight.bold,letterSpacing: 2),),
          ],
        ),
      ),
    );
  }
}
