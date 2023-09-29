import 'package:flutter/material.dart';
import 'package:three_colors/model/model_user.dart';
import 'package:three_colors/widget/google_map.dart';
import 'package:three_colors/widget/user_button.dart';
import 'package:intl/intl.dart';

class RoomScreen extends StatefulWidget {
  /*
  String sex
  int capacity
  String dateTime
  double lat, lng
  bool ready
  int deposit
  */
  List<User> users;
  RoomScreen({super.key, required this.users});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    DateTime dateTime = DateTime.parse("2023-06-10 00:12:00");
    String date = DateFormat('MM.dd.yyyy').format(dateTime);
    String time = DateFormat.jm().format(dateTime);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(color: Theme.of(context).colorScheme.background),
          title: Text(
            "room",
            style: TextStyle(
              color: Theme.of(context).colorScheme.background,
              fontSize: width * 0.05,
            ),
          ),
          actions: [
            Row(
              children: [
                Icon(
                  Icons.people_alt_outlined,
                  color: Theme.of(context).colorScheme.background,
                  size: 32,
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.01),
                ),
                Text(
                  "# / #",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: width * 0.05),
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.02),
                ),
              ],
            )
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: constraints.maxHeight * 0.125,
                padding: EdgeInsets.fromLTRB(
                    width * 0.048, width * 0.012, width * 0.048, width * 0.012),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Theme.of(context).colorScheme.background,
                        width: 0.2),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    //mainAxis: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: _buildUserButtons(width, widget.users),
                  ),
                ),
              ),
              Container(
                height: constraints.maxHeight * 0.4,
                padding: EdgeInsets.all(width * 0.048),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Theme.of(context).colorScheme.background,
                        width: 0.2),
                  ),
                ),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: width * 0.12,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: width * 0.15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )),
              ),
              Container(
                height: constraints.maxHeight * 0.375,
                padding: EdgeInsets.all(width * 0.048),
                child: Column(
                  children: [
                    SizedBox(
                      height: constraints.maxHeight * 0.050,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "restaurant",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontSize: width * 0.05,
                            ),
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                          Text(
                            "예약금: #",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.background,
                                fontSize: width * 0.05),
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GoogleMap(
                        lat: 37.240870,
                        lng: 127.079744,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: constraints.maxHeight * 0.1,
                padding: EdgeInsets.fromLTRB(
                    width * 0.048, width * 0.012, width * 0.048, width * 0.024),
                child: SizedBox(
                  width: constraints.maxWidth,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: const Text(
                      '준비 완료!',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildUserButtons(double width, List<User> users) {
    List<Widget> children = [];
    for (User user in widget.users) {
      children.add(UserButton(width: width, user: user));
      children.add(SizedBox(width: width * 0.024));
    }
    return children;
  }
}
