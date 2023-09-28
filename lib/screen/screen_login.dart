import 'package:flutter/material.dart';
import 'package:three_colors/screen/screen_home.dart';
import 'package:three_colors/screen/screen_register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) => Container(
              height: constraints.maxHeight,
              padding: EdgeInsets.all(width * 0.048),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "환영합니다!",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  SizedBox(
                    height: width * 0.024,
                  ),
                  Text(
                    "로그인하세요",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.surface),
                  ),
                  SizedBox(
                    height: width * 0.096,
                  ),
                  SizedBox(
                    width: constraints.maxWidth,
                    height: width * 0.12,
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail,
                              color: Theme.of(context).colorScheme.background),
                          hintText: '이메일',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.background,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .surface
                              .withOpacity(0.6)),
                    ),
                  ),
                  SizedBox(height: width * 0.048),
                  SizedBox(
                    width: constraints.maxWidth,
                    height: width * 0.12,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock,
                              color: Theme.of(context).colorScheme.background),
                          hintText: '비밀번호',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.background,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .surface
                              .withOpacity(0.6)),
                    ),
                  ),
                  SizedBox(height: width * 0.048),
                  SizedBox(
                    width: constraints.maxWidth,
                    height: width * 0.12,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      child: const Text(
                        '로그인',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: width * 0.024),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "아직 계정이 없으신가요?",
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.surface),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterScreen()));
                        },
                        child: Text(
                          "회원가입",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 18,
                              //fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.background),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
