import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Josiah Salcido'),
            accountEmail: Text('josiah.salcido@altsrc.net'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.jpg'),
            ),
          ),
          buildNavigationRow(context: context, name: 'Todo List', path: '/'),
          buildNavigationRow(
              context: context, name: 'Another Page', path: '/example'),
          ListTile(
            title: Text('Item 3'),
            trailing: Icon(Icons.error_outline),
            enabled: false,
          )
        ],
      ),
    );
  }

  ListTile buildNavigationRow(
      {BuildContext context, String name, String path}) {
    return ListTile(
      title: Text(name),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        Navigator.of(context)
          ..pop()
          ..pushReplacementNamed(path);
      },
    );
  }
}
