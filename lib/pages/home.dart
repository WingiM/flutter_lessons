import 'package:flutter/material.dart';
import 'package:flutter_lessons/pages/deals.dart';

import 'calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final listPages = [
    const DealsPage(),
    const CalendarPage(),
  ];
  bool _showButton = true;

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/');
            },
            icon: const Icon(
              Icons.exit_to_app,
            ),
          ),
        ],
        backgroundColor: primaryColor,
      ),
      body: Container(
        child: listPages[index],
      ),
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: _showButton ? 1 : 0,
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          backgroundColor: primaryColor,
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_sharp),
              label: 'Список дел',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Каледарь',
            ),
          ],
          onTap: (value) {
            setState(() {
              index = value;
              if (index != 0) {
                _showButton = false;
              } else {
                _showButton = true;
              }
            });
          }),
    );
  }
}
