import 'package:flutter/material.dart';
import 'package:slack_clone/widgets/drawer_body_item.dart';
import 'package:slack_clone/widgets/drawer_footer_item.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DrawerHeader(
                child: Text(
                  'Workspaces',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: 1,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) => DrawerBodyItem(),
                ),
              ),
              const Divider(height: 2.0),
              DrawerFooterItem(
                icon: Icons.add_circle_outline_rounded,
                lable: 'Add a Workspace',
                onTap: () {
                  print('-- add a workspace');
                },
              ),
              DrawerFooterItem(
                icon: Icons.settings,
                lable: 'Preferences',
                onTap: () {
                  print('-- preferences');
                },
              ),
              DrawerFooterItem(
                icon: Icons.help_outline_rounded,
                lable: 'Help',
                onTap: () {
                  print('-- help');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
