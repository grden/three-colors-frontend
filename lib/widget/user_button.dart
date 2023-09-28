import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:three_colors/model/model_user.dart';
import 'package:three_colors/screen/screen_user.dart';

class UserButton extends StatefulWidget {
  double width;
  User user;
  UserButton({super.key, required this.width, required this.user});

  @override
  State<UserButton> createState() => _UserButtonState();
}

class _UserButtonState extends State<UserButton> {
  final male = const BoxDecoration(
    shape: BoxShape.circle,
    border: GradientBoxBorder(
      gradient: LinearGradient(colors: [
        Colors.blue,
        Color.fromARGB(255, 179, 121, 255),
      ]),
      width: 4,
    ),
  );

  final female = const BoxDecoration(
    shape: BoxShape.circle,
    border: GradientBoxBorder(
      gradient: LinearGradient(colors: [
        Color.fromARGB(255, 255, 71, 50),
        Color.fromARGB(255, 179, 121, 255),
      ]),
      width: 4,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      //margin: EdgeInsets.all(widget.width * 0.010),
      decoration: widget.user.sex == 'male' ? male : female,
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          border: Border.all(width: 0.6, color: Colors.grey),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Image(
              image: AssetImage(widget.user.profilePic), fit: BoxFit.cover),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserScreen(user: widget.user),
              ),
            );
          },
        ),
      ),
    );
  }
}
