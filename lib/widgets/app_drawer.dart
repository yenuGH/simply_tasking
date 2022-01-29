import 'package:flutter/material.dart';
import 'package:simply_tasking/utilities/theme_changer.dart';

class AppDrawer extends Drawer {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("SimplyTasking"),
            accountEmail: Text("SimplyTasking@gmail.com"),
          ),
          ListTile(
            title: const Text("placeholder"),
            leading: const Icon(Icons.dark_mode_rounded),
            onTap: () {
              ThemeChanger().switchTheme();
            },
          )
        ],
      ),
    );
  }
}
