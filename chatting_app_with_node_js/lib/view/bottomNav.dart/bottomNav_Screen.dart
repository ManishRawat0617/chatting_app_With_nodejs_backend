import 'package:chatting_app_with_node_js/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:chatting_app_with_node_js/bloc/bottom_nav/bottom_nav_event.dart';
import 'package:chatting_app_with_node_js/data/local_storage/boxes.dart';
import 'package:chatting_app_with_node_js/services/socket.io.dart';
import 'package:chatting_app_with_node_js/view/chatting_screen/chat_screen.dart';
import 'package:chatting_app_with_node_js/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final currentUser = Boxes.userData().get('currentUser');
  @override
  void initState() {
    super.initState();
    SocketService()
        .connect(currentUser!.user_id ?? "user", 'http://192.168.1.3:6000');
  }

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ChatScreen(),
    HomeScreen(),
    ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavBloc(),
      child: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Home Page"),
            ),
            // body: _widgetOptions[state.selectIndex],
            body: _widgetOptions[0],
            bottomNavigationBar: Stack(
              clipBehavior: Clip.none,
              children: [
                BottomNavigationBar(
                  currentIndex: state.selectIndex,
                  onTap: (index) {
                    context
                        .read<BottomNavBloc>()
                        .add(ChangeTabEvent(index: index as int));
                  },
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.red,
                  unselectedItemColor: Colors.grey,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.message),
                      label: 'Message',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.grid_view),
                      label: 'Feed',
                    ),
                    BottomNavigationBarItem(
                      icon: SizedBox.shrink(), // Placeholder for the FAB
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.call),
                      label: 'Call',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Account',
                    ),
                  ],
                ),
                Positioned(
                  top: -30, // Adjust position
                  left: MediaQuery.of(context).size.width / 2 - 30,
                  child: FloatingActionButton(
                    onPressed: () {
                      // Handle Add button click
                      print("Add button clicked");
                    },
                    backgroundColor: Colors.red,
                    child: Icon(Icons.add, size: 30),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
