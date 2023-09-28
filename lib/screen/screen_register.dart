import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int? _selectedIndex;
  final List<String> _sexList = [
    "남",
    "여",
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(color: Theme.of(context).colorScheme.background),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => Container(
            height: constraints.maxHeight,
            padding: EdgeInsets.all(width * 0.048),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "회원가입",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                SizedBox(
                  height: width * 0.096,
                ),
                SizedBox(
                  width: constraints.maxWidth,
                  height: width * 0.12,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
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
                SizedBox(height: width * 0.096),
                SizedBox(
                  width: constraints.maxWidth,
                  height: width * 0.12,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,
                            color: Theme.of(context).colorScheme.background),
                        hintText: '별명',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.4,
                      height: width * 0.12,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: '나이',
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
                    SizedBox(height: width * 0.024),
                    Wrap(
                      spacing: width * 0.024,
                      direction: Axis.horizontal,
                      children: List<Widget>.generate(
                        2,
                        (int index) {
                          return ChoiceChip(
                            label: SizedBox(
                                width: constraints.maxWidth * 0.1,
                                height: width * 0.12,
                                child: Center(child: Text(_sexList[index]))),
                            labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontSize: 18,
                            ),
                            selected: _selectedIndex == index,
                            onSelected: (bool selected) {
                              setState(() {
                                _selectedIndex = selected ? index : null;
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
                SizedBox(height: width * 0.048),
                SizedBox(
                  width: constraints.maxWidth,
                  height: width * 0.12,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: const Text(
                      '가입하기',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
