import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          height: 1,
          color: Colors.white24,
        ),
        Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            backgroundColor: Colors.black,
            showUnselectedLabels: true,
            onTap: (i) {

            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.newspaper),
                label: "News",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                label: "TracksBox",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.folder),
                label: "Projects",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
