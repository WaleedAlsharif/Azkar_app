import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({Key? key}) : super(key: key);
  String _message ='NO MESSAGE';

  @override
  Widget build(BuildContext context) {

    ModalRoute? modalRoute=ModalRoute.of(context); //لاستقبال البيانات المرسلة
    if(modalRoute != null){
      Map<String, dynamic> data =modalRoute.settings.arguments as Map<String, dynamic>;
      if(data.containsKey('message')){
        _message = data['message'];
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('ABOUT'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);// بعد تغير الايقونة نضيف هذا الحدث لكي تعمل وظيفة الايقونة السابفة وهي العودة
            },
            icon: Icon(
                Icons.arrow_back_ios)), //غيرنا زر الباك الى ايقونة بشكل اخر
      ),
      body: Center(
        child: Text(_message),
      ),
    );
  }
}
