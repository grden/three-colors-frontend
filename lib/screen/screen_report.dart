import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

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
          builder: (context, constraints) => SingleChildScrollView(
            child: Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              padding: EdgeInsets.all(width * 0.048),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "사용자 신고",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.background),
                  ),
                  SizedBox(height: width * 0.048),
                  Text(
                    "신고 사유",
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.background),
                  ),
                  Text(
                    "상세 내용",
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.background),
                  ),
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
                      onPressed: () {},
                      child: const Text(
                        '신고하기',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
