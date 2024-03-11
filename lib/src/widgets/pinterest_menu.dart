import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pinterest_app_design/src/providers/menu_provider.dart';

class PinterestButton {
  final void Function() onPressed;
  final IconData icon;

  const PinterestButton({
    required this.icon,
    required this.onPressed,
  });
}

class PinterestMenu extends StatelessWidget {

  final List<PinterestButton> items = [
    PinterestButton(icon: Icons.pie_chart, onPressed: () {}),
    PinterestButton(icon: Icons.search, onPressed: () {}),
    PinterestButton(icon: Icons.notifications, onPressed: () {}),
    PinterestButton(icon: Icons.supervised_user_circle_rounded, onPressed: () {}),
  ];

  PinterestMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>  MenuProvider(),
      child : Container(
        width : 240,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow   : const <BoxShadow> [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            )
          ]
        ),
        child: _MenuItems(items),
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton(index, menuItems[index]))
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  
  final int index;
  final PinterestButton item;

   const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return GestureDetector(
      behavior  : HitTestBehavior.translucent,
      onTap: () {
        menuProvider.selectedItem = index;
        item.onPressed();
      },
      child: SizedBox(
        child: Icon(
          item.icon,
          color: menuProvider.selectedItem == index ? Colors.pink : Colors.black87,
          size : menuProvider.selectedItem == index ? 30 : 22,
        ),
      )
    );
  }
}