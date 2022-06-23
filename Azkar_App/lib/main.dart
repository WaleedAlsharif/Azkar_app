import 'package:azkar_app/screens/about_screen.dart';
import 'package:azkar_app/screens/launch_screen.dart';
import 'package:azkar_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [ //هذه لتحديد اتجاه التطبيق على حسب اللغه قبل هذه يوجد تعديل في ملف pubspec.yaml
        GlobalMaterialLocalizations.delegate, //للتحكم في الmaterial widget
        GlobalCupertinoLocalizations.delegate,//هذه موجهه للios فقط
        GlobalWidgetsLocalizations.delegate,//هذه مسؤولة عن ادارة ورسم الامور المتخصصة في عملية اتجاه النصوص
      ],
      supportedLocales: const [//هذه اللغات المدعومة
        Locale('ar'),
        Locale('en'),
      ],
      locale: const Locale('ar'),// اللغة التي سوف سشتغل بها التطبيق واذا كانت غير موجودة سوف يختار لغة الجهاز
      debugShowCheckedModeBanner: false,
      //home: LaunchScreen(),//لتحديد الشاشة الرئيسية للتطبيق
      initialRoute: '/launch_screen', //الطريقة الثانية لتحديد الشاشة الرئيسية
      routes: { // هنا تعريف الشاشات
        '/launch_screen':(context) => LaunchScreen(),
        '/main_screen': (context)=> MainScreen(),
        '/about_screen':(context) => AboutScreen(),
      },
    );
  }
}


