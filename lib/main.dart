import 'package:dayly/firebase_options.dart';
import 'package:dayly/screens/login_screen.dart'; // 로그인 화면 추가
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  KakaoSdk.init(nativeAppKey: "a0b3d9c0805d766e05b4fede843b62aa"); // 카카오 앱 키 추가
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dayly',
      theme: ThemeData(
        fontFamily: 'HakgyoansimBadasseugiOTFL',
        scaffoldBackgroundColor: Color(0xFFEEEEEE),
      ),
      locale: const Locale('ko'), // 한국어로 기본 설정
      supportedLocales: const [
        Locale('ko'), // 한국어 지원
        Locale('en'), // 영어 지원 (필요시 추가)
      ],
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      home: LoginScreen(),
    );
  }
}
