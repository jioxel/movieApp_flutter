import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomButtonNavigation extends StatelessWidget {
  final int currentIndex;
  const CustomButtonNavigation({super.key, required this.currentIndex});

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
      default:
        context.go('/home/0');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      onTap: (value) {
        return onItemTapped(context, value);
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_max),
        ),
        BottomNavigationBarItem(
          label: 'Categori',
          icon: Icon(Icons.label_outline),
        ),
        BottomNavigationBarItem(
          label: 'Favorite',
          icon: Icon(Icons.favorite_border_outlined),
        ),
      ],
    );
  }
}
