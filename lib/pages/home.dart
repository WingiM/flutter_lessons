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
  String title = "Список дел";
  bool isDefaultAppBar = true;
  String searchText = "";

  bool _showButton = true;

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;

    var defaultAppBar = AppBar(
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              searchController.clear();
              isDefaultAppBar = !isDefaultAppBar;
            });
          },
          icon: const Icon(Icons.close),
        )
      ],
      title: TextField(
        controller: searchController,
        onChanged: (value) {
          setState(() {
            searchText = value.toLowerCase();
          });
        },
        decoration: const InputDecoration(label: Text('Название')),
      ),
    );

    var searchAppBar = AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              isDefaultAppBar = !isDefaultAppBar;
            });
          },
          icon: const Icon(
            Icons.search,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/');
          },
          icon: const Icon(Icons.exit_to_app),
        ),
      ],
      backgroundColor: primaryColor,
    );
    final listPages = [
      DealsPage(searchText),
      const CalendarPage(),
    ];
    return Scaffold(
      appBar: isDefaultAppBar ? searchAppBar : defaultAppBar,
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
      drawer: const Drawer(),
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
                title = 'Календарь';
                _showButton = false;
              } else {
                title = "Список дел";
                _showButton = true;
              }
            });
          }),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
