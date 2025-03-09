import 'package:ecocoleta/common/widgets/custom_bottom_navigation_bar.dart';
import 'package:ecocoleta/features/home/screens/modules/morador_home_screen.dart';
import 'package:ecocoleta/features/home/screens/modules/catador_home_screen.dart';
import 'package:ecocoleta/features/home/widgets/components/map_pin_button.dart';
import 'package:ecocoleta/features/settings/screens/settings_screen.dart';
import 'package:flutter/material.dart';

/**
* @author Giovane Neves
* @since v0.0.1
*/
class HomeScreen extends StatefulWidget {

  final bool isCatador;

  HomeScreen({required this.isCatador});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late List<Widget> _screens;

  int _selectedIndex = 0;

  @override
  void initState(){

    super.initState();

    _screens = widget.isCatador ?
      [CatadorHomeScreen(), SettingsScreen()] :
      [MoradorHomeScreen(), SettingsScreen()];

  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: SafeArea(
        child: _screens[_selectedIndex],
      ),
      floatingActionButton: MapPinButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped
      ),
    );
  }

}
