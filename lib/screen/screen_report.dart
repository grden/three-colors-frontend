import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:three_colors/model/model_user.dart';

class ReportScreen extends StatefulWidget {
  User user;
  ReportScreen({super.key, required this.user});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final List<String> items = [
    '비매너 사용자에요',
    '욕설을 해요',
    '성희롱을 해요',
    '약속을 지키지 않아요',
    '연애 목적의 대화를 시도해요',
    '다른 문제가 있어요'
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '사용자 신고',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).colorScheme.background),
          ),
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
                  SizedBox(height: width * 0.048),
                  Text(
                    "'${widget.user.name}'\n사용자를 신고하는 이유를 선택해 주세요.",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.background),
                  ),
                  SizedBox(height: width * 0.072),
                  DropdownButtonHideUnderline(
                    child: DropdownButtonFormField2<String>(
                      hint: Text(
                        '신고하는 이유를 선택해 주세요.',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.background),
                      ),
                      items: items
                          .map(
                            (String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList(),
                      value: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: width * 0.12,
                        width: constraints.maxWidth,
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.surface),
                      ),
                      dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                  SizedBox(height: width * 0.036),
                  TextFormField(
                    maxLength: 300,
                    maxLines: 6,
                    decoration: InputDecoration(
                        hintText: '상세 내용을 입력해 주세요.',
                        hintStyle: TextStyle(
                          fontSize: 16,
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
