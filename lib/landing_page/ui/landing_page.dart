// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartcafetria/cart/cart_screen.dart';
import 'package:smartcafetria/profile/profile_screen.dart';
import 'package:smartcafetria/home/home_page.dart';
import 'package:smartcafetria/landing_page/landiing_bloc/landing_page_bloc.dart';
import 'package:smartcafetria/fav/fav_screen.dart';

List<BottomNavigationBarItem> bottomnavItem = [
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
  const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "favouts"),
  const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_basket), label: "cart"),
  const BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
];

List<Widget> bottomnaviScreen = [
  HomePage(),
  const FavScreen(),
  const CartScreen(),
  const ProfileScreen()
];

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingPageBloc, LandingPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: bottomnaviScreen.elementAt(state.tabindex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomnavItem,
            currentIndex: state.tabindex,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              BlocProvider.of<LandingPageBloc>(context)
                  .add(TabChangeEvent(tabindex: index));
            },
          ),
        );
      },
    );
  }
}
