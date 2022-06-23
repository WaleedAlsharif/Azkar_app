import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() { //هي تنفذ مرة واحدة فقط في كل ستيت
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){ //انشئ حدث بعد ثلاث ثواني
      //Navigator.pushNamed(context, '/main_screen') ;//    مع امكانية العودة للشاشه انتقل الى الmain_screen
      Navigator.pushReplacementNamed(context, '/main_screen'); //انتقل الى الmainscreen دون امكانية العودة للشاشة
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [Colors.blue.shade800, Colors.orange.shade400]),
        ),
        child: Text(
          'مسبحة الأذكار',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
