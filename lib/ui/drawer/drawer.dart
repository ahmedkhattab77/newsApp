import 'package:flutter/material.dart';

typedef OnMenuItemClick = void Function(MenuItem clickedItem) ;
class MyDrawer extends StatelessWidget {
  OnMenuItemClick onMenuItemClick;
  MyDrawer({required this.onMenuItemClick,super.key});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            height: MediaQuery.of(context).size.height * .2,
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            alignment: Alignment.center,
            child: const Text(
              'News App',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          InkWell(
            onTap: (){
              onMenuItemClick(MenuItem.categories);

            },
            child: const Row(
              children: [
                Icon(
                  Icons.list,
                  size: 32,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: (){
              onMenuItemClick(MenuItem.settings );
            },
            child: const Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 32,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Settings',
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


enum MenuItem {
  categories,
  settings
}
