import 'package:flutter/material.dart';
import 'package:personal_expenses/routes.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentPage].screen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (index) => setState(() => _currentPage = index),
        items: pages
            .map((page) => BottomNavigationBarItem(
                icon: page.icon,
                label: page.title,
                backgroundColor: Theme.of(context).primaryColor))
            .toList(),
      ),
    );
  }
}
