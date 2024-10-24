import 'package:flutter/material.dart';

class SidePanel extends StatelessWidget {
  const SidePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 700
        ? NavigationRail(
            destinations: const [
              NavigationRailDestination(icon: Icon(Icons.home), label: Text("Home")),
              NavigationRailDestination(icon: Icon(Icons.shopping_bag_rounded), label: Text("Tools")),
              NavigationRailDestination(icon: Icon(Icons.settings), label: Text("Settings")),
            ],
            selectedIndex: 0,
            elevation: 1,
          )
        : const SizedBox();
  }
}
