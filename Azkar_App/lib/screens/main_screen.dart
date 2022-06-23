import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _counter = 0;
  String _content = 'استغفر الله';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //automaticallyImplyLeading: false,
        //لاخفاء علامة العودة بعد عمل حدث الانتقال
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'سبحة الأذكار',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'kufi',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                //ايثونه لها حدث
                Navigator.pushNamed(
                  //اذهب الى الaboutscreen
                  context,
                  '/about_screen',
                  arguments: {
                    //هذه تستخدم الارسال اي شيء الى صفحة الاباوت
                    'message': 'WELCOM IN FLUTTER'
                  },
                );
              },
              icon: const Icon(Icons.info)),
          PopupMenuButton<String>(
            offset: Offset(0,40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onSelected:(String value) => {
              if(value !=_content){
                setState((){
                  _counter=0;
                  _content= value;
                }
                )
              }
            } ,

            itemBuilder: (context){
              return[
                PopupMenuItem(child:  Text('استغفر الله'),
                  textStyle: TextStyle(fontFamily: 'kufi',color: Colors.black),
                  value: 'استغفر الله',
                ),
                PopupMenuItem(child:  Text('سبحان الله'),
                  textStyle: TextStyle(fontFamily: 'kufi',color: Colors.black),
                  value: 'سبحان الله',
                ),
                PopupMenuItem(child:  Text('الحمد لله'),
                  textStyle: TextStyle(fontFamily: 'kufi',color: Colors.black),
                  value: 'الحمد لله',
                )
              ];
            },
          ),
          IconButton(
              onPressed: () {
                //الطريقة الثانية للانتقال
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactUsScreen(
                        massage:
                        'CONTACT US ', //هذا لارسال بيانات بطريقة الانتقال الثانية
                      ),
                    ));
              },
              icon: const Icon(Icons.contact_page))
        ],
      ),
      floatingActionButton: FloatingActionButton( //هذا لزر الاضافة في الاسفل
        backgroundColor: Colors.teal,
        onPressed: (){
          setState(() {
            ++_counter;
          });
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://www.ramstarab.com/wp-content/uploads/2019/05/%D8%AE%D9%84%D9%81%D9%8A%D8%A7%D8%AA-%D8%A7%D8%B3%D9%84%D8%A7%D9%85%D9%8A%D8%A918-300x243.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://modo3.com/thumbs/fit630x300/27046/1591744391/%D9%83%D9%8A%D9%81_%D8%AA%D8%B5%D9%86%D8%B9_%D9%85%D8%B3%D8%A8%D8%AD%D8%A9.jpg'),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                //هذه لجعل الExpanded وجميع عناصر الكارت تأخذ نفس حواف الكارت
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(_content,
                          textAlign: TextAlign.center,
                          //لجعل النص يصبح في منتصف الExpanded
                          style:const TextStyle(
                            color: Colors.teal,
                            fontFamily: 'kufi',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Container(
                      //padding: EdgeInsets.symmetric(horizontal: 20),
                      alignment: AlignmentDirectional.center,
                      height: 60,
                      width: 60,//استدمنا الwidth لكي يبقى العداد ثابت عكس padding
                      decoration: const BoxDecoration(
                        color: Colors.teal,
                      ),
                      child: Text(
                        _counter.toString(),//هنا لان الcounter اصلا int عشان هيك وضعنا toString
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'kufi',
                            fontWeight: FontWeight.w500,
                            fontSize: 22),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.teal,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(15))
                          )
                      ),
                      onPressed: () {
                        setState(() { //هذه لان نحن بالstate
                          _counter++;
                        });
                      },
                      child: const Text(
                        'تسبيح',
                        style: TextStyle(fontFamily: 'kufi', fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _counter=0;
                        });
                      },
                      style: ElevatedButton.styleFrom( //للتعديل على لون هذا الزر
                          primary: Colors.orange,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                          )
                      ),
                      child: const Text(
                        'إعادة',
                        style: TextStyle(fontFamily: 'kufi', fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
