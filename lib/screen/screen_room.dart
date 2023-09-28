import 'package:flutter/material.dart';
import 'package:three_colors/model/model_user.dart';
import 'package:three_colors/widget/user_button.dart';

class RoomScreen extends StatefulWidget {
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
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.01),
                ),
                Text(
                  "# / #",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: width * 0.04),
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
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Theme.of(context).colorScheme.background,
                        width: 0.2),
                  ),
                ),
              ),
              Container(height: constraints.maxHeight * 0.375),
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
