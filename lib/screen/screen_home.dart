import 'package:flutter/material.dart';
import 'package:three_colors/model/model_user.dart';
import 'package:three_colors/screen/screen_room.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [
    User.fromMap({
      'name': '축축한 짜장면',
      'sex': 'male',
      'profilePic': 'images/hamburger.png',
      'age': 25,
      'review': {
        'score': [5, 5, 5, 5, 5, 5, 5, 5],
        'content': [
          'content 1',
          'content 2',
          'content 3',
          'content 4',
          'content 5',
          'content 6',
          'content 7',
          'content 8'
        ]
      },
    }),
    User.fromMap({
      'name': '미끄러운 치킨',
      'sex': 'female',
      'profilePic': 'images/french-fries.png',
      'age': 25,
      'review': {
        'score': [4, 4, 4],
        'content': [
          'content 1:\nline 1\nline2',
          'content 2: looooooooooooooooooooooong text',
          'content 3'
        ]
      },
    }),
    User.fromMap({
      'name': '견고한 공기밥',
      'sex': 'female',
      'profilePic': 'images/rice.png',
      'age': 30,
      'review': {
        'score': [5, 3, 0],
        'content': ['content 1', 'content 2', 'content 3']
      },
    }),
  ];

  // 임시 방 리스트
  final List<String> _rooms = List.generate(30, (index) => 'room ${index + 1}');

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person_outline),
              color: Theme.of(context).colorScheme.background,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              iconSize: 32,
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                color: Theme.of(context).colorScheme.background,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                iconSize: 32,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.category_outlined),
                color: Theme.of(context).colorScheme.background,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                iconSize: 32,
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.fromLTRB(width * 0.048, 0, width * 0.048, 0),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: width * 0.048,
                    crossAxisSpacing: width * 0.048),
                itemCount: _rooms.length,
                itemBuilder: (context, index) => _buildRoomCard(_rooms, index)),
          ),
          floatingActionButton: SizedBox(
            width: width * 0.30,
            height: width * 0.12,
            child: FloatingActionButton.extended(
              onPressed: () {},
              backgroundColor: const Color(0xFF9C9AED),
              elevation: 0,
              focusElevation: 0,
              highlightElevation: 0,
              label: const Text(
                "방만들기",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              icon: const Icon(
                Icons.add_home_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoomCard(List rooms, int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Theme.of(context).colorScheme.surface,
      child: GridTile(
        header: GridTileBar(
          //backgroundColor: Theme.of(context).colorScheme.surface,
          title: Text(
            'user',
            style: TextStyle(color: Theme.of(context).colorScheme.background),
          ),
        ),
        footer: GridTileBar(
          //backgroundColor: Theme.of(context).colorScheme.surface,
          title: Text(
            'restaurant',
            style: TextStyle(color: Theme.of(context).colorScheme.background),
          ),
        ),
        child: InkWell(
            child: Center(
              child: Text(
                rooms[index],
                style:
                    TextStyle(color: Theme.of(context).colorScheme.background),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RoomScreen(users: users)));
            }),
      ),
    );
  }
}
