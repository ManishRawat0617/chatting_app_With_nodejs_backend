import 'package:chatting_app_with_node_js/view/Utilis/widget/3dWidget.dart';
import 'package:chatting_app_with_node_js/view/Utilis/widget/searchBar.dart';
import 'package:chatting_app_with_node_js/view/Utilis/widget/submitButton.dart';
import 'package:chatting_app_with_node_js/view/Utilis/widget/textWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SubmitButton(title: "Search"),
    );

    // child: Column(
    //   children: [
    //     SearchWidget(),
    //     SizedBox(
    //       height: 20,
    //     ),
    //     Expanded(
    //       child: ListView.builder(
    //         itemCount: 15,
    //         itemBuilder: (BuildContext context, int index) {
    //           return Padding(
    //             padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
    //             child: Card_3D(
    //               height: 100, // Set desired height for each card
    //               width: MediaQuery.of(context).size.width *
    //                   0.9, // Adjust width based on screen
    //               firstLayer_color: Colors.grey.shade300,
    //               secondLayer_Color: Colors.blueAccent,
    //               widget: const Padding(
    //                 padding: EdgeInsets.all(8.0),
    //                 child: Row(
    //                   children: [
    //                     CircleAvatar(
    //                       radius: 25,
    //                     ),
    //                     SizedBox(
    //                       width: 20,
    //                     ),
    //                     TextWidget(
    //                       title: "Name of User",
    //                       boldness: FontWeight.bold,
    //                       fontSize: 20,
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           );
    //         },
    //       ),
    //     )
    //     // Card_3D(height: 100, width: 200)
    //   ],
    // ),
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeSearchBar(),
        SizedBox(
          height: 15,
        ),
        SubmitButton(title: "Search")
      ],
    );
  }
}
