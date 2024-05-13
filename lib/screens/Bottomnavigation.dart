import 'package:flutter/material.dart';

Widget buildCustomBottomNavigationBar(
    {required int selectedIndex, required Function(int) onItemTapped}) {
  return BottomNavigationBar(
    currentIndex: selectedIndex,
    onTap: onItemTapped,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey,
    //type: BottomNavigationBarType.fixed, // Add this line
    backgroundColor: Colors.white,
    elevation: 0, // Remove the shadow
    selectedFontSize: 14,
    unselectedFontSize: 14,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.people),
        label: 'Members',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.insights),
        label: 'Insights',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.manage_accounts),
        label: 'Manage',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ],
  );
}
