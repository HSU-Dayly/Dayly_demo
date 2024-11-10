import 'package:flutter/material.dart';
import '../calender/calender.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UsernameScreen(),
      theme: ThemeData(
        fontFamily: 'HakgyoansimBadasseugiOTFL',
        primaryColor: const Color.fromRGBO(88, 71, 51, 0.992),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(88, 71, 51, 0.992),
        ), // 기본 폰트 전체 적용
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class UsernameScreen extends StatefulWidget {
  @override
  _UsernameScreenState createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _isButtonEnabled = _controller.text.isNotEmpty;
    });
  }

  // void _showWarningDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('경고'),
  //         content: Text('이름을 입력해 주세요.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.of(context).pop(),
  //             child: Text('확인'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // 이름 입력 후 확인 클릭 시 나타나는 재확인 다이얼로그
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('${_controller.text}님'),
          content: const Text(
            '위 이름으로 계속 진행하시겠습니까?',
            style: const TextStyle(
              color: Color.fromRGBO(88, 71, 51, 0.992), // 텍스트 색상 명확히 지정
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // 취소
              child: const Text(
                '취소',
                style: TextStyle(
                  color: Color.fromRGBO(88, 71, 51, 0.992), // 텍스트 색상 명확히 지정
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // 확인 버튼 눌렀을 때의 동작
                // Navigator.of(context).pop();
                print("이름 입력 완료: ${_controller.text}");
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(builder: (context) => CalendarScreen()),
                // );
              },
              child: const Text(
                '확인',
                style: TextStyle(
                  color: Color.fromRGBO(88, 71, 51, 0.992), // 텍스트 색상 명확히 지정
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _onConfirm() {
    if (_controller.text.isEmpty) {
      // _showWarningDialog();
    } else {
      // 이름이 입력되었을 때 실행할 동작
      _showConfirmationDialog();
      print("이름 입력 완료: ${_controller.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '사용자 이름을 정해 주세요',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(88, 71, 51, 0.992),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                // style: const TextStyle(fontFamily: "Kyobo"),
                controller: _controller,
                autofocus: true, // 커서를 바로 텍스트 필드로
                style: const TextStyle(
                  color: Color.fromRGBO(88, 71, 51, 0.992), // 텍스트 색상 명확히 지정
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // 한 글자 이상 이름 입력해야 확인 버튼 활성화
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // 버튼 배경 색상
                  foregroundColor: _isButtonEnabled
                      ? Color.fromRGBO(88, 71, 51, 0.992)
                      : Colors.grey, // 버튼 텍스트 색상
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: _isButtonEnabled ? _onConfirm : null,
                child: const Text('확인'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
