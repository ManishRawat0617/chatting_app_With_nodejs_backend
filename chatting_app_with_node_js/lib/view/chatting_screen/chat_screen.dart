import 'package:chatting_app_with_node_js/view/Utilis/widget/textWidget.dart';
import 'package:chatting_app_with_node_js/view/chatting_screen/Widget/messageCard.dart';
import 'package:chatting_app_with_node_js/view/chatting_screen/Widget/messageField.dart';
import 'package:chatting_app_with_node_js/view/reciever_profile/receiver_profile.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecieverProfileScreen()));
            },
            child: TextWidget(title: "Receiver Name ")),
      ),
      body: Container(
        color: Colors.red,
        width: screenWidth,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 10,
                ),
                MessageCard(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                MessageCard(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: MessageInputFieldWidget(),
    );
  }
}

// import 'package:chatting_app_with_node_js/view/Utilis/widget/textWidget.dart';
// import 'package:chatting_app_with_node_js/view/chatting_screen/Widget/messageCard.dart';
// import 'package:chatting_app_with_node_js/view/chatting_screen/Widget/messageField.dart';
// import 'package:flutter/material.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   // List to hold messages dynamically
//   final List<Map<String, dynamic>> _messages = [
//     {"message": "Hi there!", "isSender": false},
//     {"message": "Hello! How are you?", "isSender": true},
//     {"message": "I'm good, thanks! What about you?", "isSender": false},
//     {"message": "Doing great! Let's catch up soon.", "isSender": true},
//   ];

//   // Text controller for the message input field
//   final TextEditingController _messageController = TextEditingController();

//   // Function to send a message
//   void _sendMessage() {
//     if (_messageController.text.trim().isNotEmpty) {
//       setState(() {
//         _messages.add({"message": _messageController.text, "isSender": true});
//       });
//       _messageController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: TextWidget(title: "Receiver Name"),
//         centerTitle: true,
//       ),
//       body: Container(
//         width: screenWidth,
//         color: Colors.red,
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//                 itemCount: _messages.length,
//                 itemBuilder: (context, index) {
//                   final messageData = _messages[index];
//                   return Row(
//                     mainAxisAlignment: messageData["isSender"]
//                         ? MainAxisAlignment.end
//                         : MainAxisAlignment.start,
//                     children: [
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Flexible(
//                           child: MessageCard(
//                             message: messageData["message"],
//                             senderName: "manish",
//                             isSender: messageData["isSender"],
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//             // Message Input Field
//             MessageInputFieldWidget(
//               controller: _messageController,
//               // onSend: _sendMessage, // Hook up the send button
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
