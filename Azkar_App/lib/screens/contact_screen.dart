import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  ContactUsScreen({Key? key, required this.massage}) : super(key: key);

  final String massage; //لاستقبال الرسالة
  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CONTACT US'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);// بعد تغير الايقونة نضيف هذا الحدث لكي تعمل وظيفة الايقونة السابفة وهي العودة
            },
            icon: Icon(
                Icons.arrow_back_ios)),
      ),
      body: Center(
        child: Text(widget.massage), //لاستقبال الرسالة
      ),
    );
  }
}
