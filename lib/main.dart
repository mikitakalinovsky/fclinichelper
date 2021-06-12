import 'package:fclinick_helper/screens/cycle_screen.dart';
import 'package:fclinick_helper/screens/pricelist_screen.dart';
import 'package:fclinick_helper/screens/uzi_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _elements = [
      UziScreen(),
      CycleScreen(),
      PriceList(),
    ];

    void changeTab(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        debugShowCheckedModeBanner: false,
        home: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
              ),
              backwardsCompatibility: false,
              backgroundColor: Colors.purple,
              title: Text("FClinic Helper"),
            ),
            body: Center(
              child: _elements.elementAt(_currentIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "Узи",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.cached),
                  label: "Цикл",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.attach_money),
                  label: "Цена",
                ),
              ],
              backgroundColor: Colors.white,
              currentIndex: _currentIndex,
              onTap: changeTab,
            ),
          ),
        ));
  }
}
