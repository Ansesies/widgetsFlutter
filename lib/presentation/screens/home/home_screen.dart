import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey,),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuItems = appMenuItems;

    return _CustomListTile(menuItems: menuItems);
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    super.key,
    required this.menuItems,
  });

  final List<MenuItem> menuItems;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(
              menuItems[i].icon,
              color: colors.primary,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: colors.primary,
            ),
            title: Text(menuItems[i].title),
            subtitle: Text(menuItems[i].subTitle),
            onTap: () {
              //Navigator.pushNamed(context, menuItems[i].link);
              context.push(menuItems[i].link);
              //context.pushNamed(CardsScreen.name);
            },
          );
        });
  }
}
