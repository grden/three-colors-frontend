import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:three_colors/model/model_user.dart';
import 'package:three_colors/screen/screen_report.dart';

class UserScreen extends StatefulWidget {
  User user;
  UserScreen({super.key, required this.user});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final male = const BoxDecoration(
    shape: BoxShape.circle,
    border: GradientBoxBorder(
      gradient: LinearGradient(colors: [
        Colors.blue,
        Color.fromARGB(255, 179, 121, 255),
      ]),
      width: 6,
    ),
  );

  final female = const BoxDecoration(
    shape: BoxShape.circle,
    border: GradientBoxBorder(
      gradient: LinearGradient(colors: [
        Color.fromARGB(255, 255, 71, 50),
        Color.fromARGB(255, 179, 121, 255),
      ]),
      width: 6,
    ),
  );

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '프로필',
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
          builder: (context, constraints) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: constraints.maxHeight * 0.15,
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.048, vertical: width * 0.036),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: width * 0.24,
                      width: width * 0.24,
                      padding: const EdgeInsets.all(4),
                      decoration: widget.user.sex == 'male' ? male : female,
                      child: Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.6, color: Colors.grey),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          splashRadius: 5,
                          icon: Image(
                              image: AssetImage(widget.user.profilePic),
                              fit: BoxFit.cover),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.024),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.user.name,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${_ageString(widget.user)} ${_sexString(widget.user)}',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.grey),
                            ),
                            SizedBox(width: width * 0.012),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ReportScreen(user: widget.user)));
                              },
                              icon: const Icon(Icons.report_problem),
                              color: Colors.red.shade500,
                              splashRadius: 1,
                              visualDensity: VisualDensity.compact,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              iconSize: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: constraints.maxHeight * 0.1,
                padding: EdgeInsets.fromLTRB(
                    width * 0.048, 0, width * 0.048, width * 0.024),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Theme.of(context).colorScheme.background,
                        width: 0.2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 별점 카드
                    SizedBox(
                      width: width * 0.24,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "별점",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(173, 73, 73, 73)),
                          ),
                          SizedBox(height: width * 0.012),
                          Text(
                            _averageScore(widget.user),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).colorScheme.background),
                          ),
                        ],
                      ),
                    ),
                    // 횟수 카드
                    SizedBox(
                      width: width * 0.24,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "식사 횟수",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(173, 73, 73, 73)),
                          ),
                          SizedBox(height: width * 0.012),
                          Text(
                            "#",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).colorScheme.background),
                          ),
                        ],
                      ),
                    ),
                    // 신고 카드
                    SizedBox(
                      width: width * 0.24,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "신고 횟수",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(173, 73, 73, 73)),
                          ),
                          SizedBox(height: width * 0.012),
                          Text(
                            "#",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).colorScheme.background),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: constraints.maxHeight * 0.75,
                padding:
                    EdgeInsets.fromLTRB(width * 0.048, 0, width * 0.048, 0),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildReviewCards(width, widget.user.review),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildReviewCards(double width, Map reviews) {
    List<Widget> children = [];
    for (int i = 0; i < reviews['score'].length; i++) {
      children.add(Container(
        padding: EdgeInsets.all(width * 0.024),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.surface),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RatingBarIndicator(
              rating: reviews['score'][i].toDouble(),
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Theme.of(context).colorScheme.secondary,
              ),
              itemSize: 20,
            ),
            SizedBox(
              height: width * 0.024,
            ),
            Text(
              reviews['content'][i],
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.background),
            )
          ],
        ),
      ));
      children.add(SizedBox(height: width * 0.048));
    }
    return children;
  }

  String _ageString(User user) {
    if (user.age >= 60) {
      return '60대 이상';
    } else if (user.age >= 50) {
      return '50대';
    } else if (user.age >= 40) {
      return '40대';
    } else if (user.age >= 30) {
      return '30대';
    } else if (user.age >= 20) {
      return '20대';
    } else {
      return '미성년자';
    }
  }

  String _sexString(User user) {
    if (user.sex == 'male') {
      return '남';
    } else {
      return '여';
    }
  }

  String _averageScore(User user) {
    double sum = 0, average = 0;
    if (user.review['score'] != null) {
      for (int score in user.review['score']!) {
        sum = sum + score;
      }
      average = sum / user.review['score']!.length;
      return average.toStringAsFixed(1);
    } else {
      return 'N/A';
    }
  }
}
