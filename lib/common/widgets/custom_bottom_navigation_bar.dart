import 'package:flutter/material.dart';

/**
* @author Giovane Neves
* @since v0.0.1
*/
class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0), // Reduz a altura
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            // Home Icon
            IconButton(
              icon: Icon(
                Icons.home,
                color: currentIndex == 0
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).iconTheme.color,
              ),
              onPressed: () => onTap(0),
            ),

            // Settings Button
            IconButton(
              icon: Icon(
                Icons.settings,
                color: currentIndex == 1
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).iconTheme.color,
              ),
              onPressed: () => onTap(1),
            ),
            
          ],
        ),
      ),
    );
  }
}
