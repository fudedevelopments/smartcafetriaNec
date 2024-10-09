// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartcafetria/landing_page/landiing_bloc/landing_page_bloc.dart';

List<BottomNavigationBarItem> bottomnavItem = [
  const BottomNavigationBarItem(icon: Icon(Icons.list), label: "Manage Users"),
  const BottomNavigationBarItem(
      icon: Icon(Icons.people), label: "Assign users"),
  const BottomNavigationBarItem(
      icon: Icon(Icons.person_2_outlined), label: "Account"),
];

List<Widget> bottomnaviScreen = [

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
