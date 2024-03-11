import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../providers/menu_provider.dart';
import '../widgets/widgets.dart';


class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (BuildContext context) => MenuProvider(),
      child : Scaffold(
        body : Stack(
          children: [
            _PinterestGrid(),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: PinterestMenu()
              ),
            )
          ],
        )
      ),
    );
  }
}

class _PinterestGrid extends StatefulWidget {
  @override
  State<_PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<_PinterestGrid> {

  final List<int> items = List.generate(200, (index) => index);
  ScrollController scrollController = ScrollController();
  double hideMenu = 0; 

  @override
  void initState() {
    
    scrollController.addListener(() {
      if (scrollController.offset > hideMenu && scrollController.offset > 100) {
        Provider.of<MenuProvider>(context, listen: false).showMenu = false;
      } else {
        Provider.of<MenuProvider>(context, listen: false).showMenu = true;
      }
      hideMenu = scrollController.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller : scrollController,
      itemCount  : items.length,
      crossAxisCount  : 4,
      itemBuilder : (BuildContext context, int index) => _PinterestItem(index: index),
      staggeredTileBuilder  : (int index) => StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing : 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem({
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10)
      ),
      child:  Center(
        child:  CircleAvatar(
          backgroundColor: Colors.white,
          child:  Text('$index'),
        ),
      )
    );
  }
}