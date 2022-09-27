import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, child) {
        return BottomNavigationBar(
            backgroundColor: Colors.black,
            currentIndex: newIndex,
            elevation: 0,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            unselectedFontSize: 10,
            selectedFontSize: 10,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.collections), label: 'New&Hot'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions), label: 'Fast Laughs'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download), label: 'Downloads'),
            ]);
      },
    );
  }
}
