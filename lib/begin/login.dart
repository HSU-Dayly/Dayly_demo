import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatelessWidget {
  void kakaoLogin(BuildContext context) {
    // Firebase 연동
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('카카오톡 계정으로 로그인 시도')),
    );
    // 로그인 성공 시 화면 전환
    // Navigator.push(context, MaterialPageRoute(builder: (context) => UsernameScreen()));
  }

  void appleLogin(BuildContext context) {
    // Firebase 연동
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('애플 계정으로 로그인 시도')),
    );
    // 로그인 성공 시 화면 전환
    // Navigator.push(context, MaterialPageRoute(builder: (context) => UsernameScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // 전체 배경 색상 설정
      body: Column(
        children: [
          // 중앙에 위치하는 'Dayly'와 설명 텍스트 부분
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // 중앙에 위치
              children: [
                Text(
                  'Dayly',
                  style: TextStyle(
                    fontSize: 50,
                    color: Color.fromRGBO(88, 71, 51, 0.992),
                    fontFamily: 'HakgyoansimBadasseugiOTFL', // 앱에서 사용하는 폰트
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '나의 일상을 기록하고,\n영어를 학습해보세요',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "HakgyoansimBadasseugiOTFL",
                    fontSize: 16,
                    color: Color.fromRGBO(88, 71, 51, 0.992),
                  ),
                ),
              ],
            ),
          ),

          // 하단에 위치하는 로그인 버튼 부분
          Padding(
            padding: const EdgeInsets.only(bottom: 100), // 하단 여백 추가
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 카카오톡 로그인 버튼
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => kakaoLogin(context), // 카카오톡 로그인 함수 호출
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.yellow,
                        child: Image.asset(
                          'assets/images/kakaotalkicon.png', // 카카오톡 아이콘 경로
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '카카오톡으로\n로그인',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "HakgyoansimBadasseugiOTFL",
                        color: Color.fromRGBO(88, 71, 51, 0.992),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 40), // 두 버튼 간 간격
                // 애플 로그인 버튼
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => appleLogin(context), // 애플 로그인 함수 호출
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.apple,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '애플 계정으로\n로그인',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "HakgyoansimBadasseugiOTFL",
                        color: Color.fromRGBO(88, 71, 51, 0.992),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
