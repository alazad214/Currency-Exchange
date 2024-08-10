import 'package:currency_exchange/pages/exchange.dart';
import 'package:currency_exchange/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNav extends StatefulWidget {
  BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  final List<Widget> _pages = [
    Home(),
    Exchange(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => SalomonBottomBar(
          currentIndex: currentIndex.value,
          onTap: (i) => changeIndex(i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Colors.blueAccent,
            ),

            /// Exchange
            SalomonBottomBarItem(
              icon: const Icon(Icons.currency_exchange),
              title: const Text("Exchange"),
              selectedColor: Colors.green,
            ),
          ],
        ),
      ),
      body: Obx(
        () => _pages[currentIndex.value],
      ),
    );
  }
}
