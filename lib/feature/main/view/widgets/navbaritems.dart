import 'package:client/core/constants/text_strings.dart';
import 'package:client/core/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CustomNavBar {
  static List<PersistentBottomNavBarItem> buildBottomNavBarItems() {
    return [
      PersistentBottomNavBarItem(
        activeColorPrimary: IPallete.primaryBlue,
        inactiveColorPrimary: Colors.grey,
        icon: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home),
            SizedBox(
              height: 3,
            ),
            Material(
              color: Colors.transparent,
              child: Text(
                ITextStrings.bottonNavItem1,
                style: TextStyle(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: IPallete.primaryBlue,
        inactiveColorPrimary: Colors.grey,
        icon: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.directions_run),
            SizedBox(
              height: 3,
            ),
            Material(
              color: Colors.transparent,
              child: Text(
                ITextStrings.bottonNavItem2,
                style: TextStyle(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: IPallete.primaryBlue,
        inactiveColorPrimary: Colors.grey,
        icon: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Iconsax.activity5),
            SizedBox(
              height: 3,
            ),
            Material(
              color: Colors.transparent,
              child: Text(
                ITextStrings.bottonNavItem3,
                style: TextStyle(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: IPallete.primaryBlue,
        inactiveColorPrimary: Colors.grey,
        icon: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 26, 0),
              child: Icon(Iconsax.watch_status5),
            ),
            SizedBox(
              height: 3,
            ),
            Material(
              color: Colors.transparent,
              child: Text(
                ITextStrings.bottonNavItem4,
                style: TextStyle(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    ];
  }
}
