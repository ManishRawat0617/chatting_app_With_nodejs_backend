import 'package:flutter/material.dart';

class MessageInputFieldWidget extends StatelessWidget {
  final TextEditingController? controller;

  const MessageInputFieldWidget({super.key, this.controller});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Choose an option",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Image Option
                  _bottomSheetOption(
                    icon: Icons.image,
                    label: "Image",
                    onTap: () {
                      Navigator.pop(context);
                      // Handle image selection
                      print("Image selected");
                    },
                  ),
                  // Video Option
                  _bottomSheetOption(
                    icon: Icons.videocam,
                    label: "Video",
                    onTap: () {
                      Navigator.pop(context);
                      // Handle video selection
                      print("Video selected");
                    },
                  ),
                  // Document Option
                  _bottomSheetOption(
                    icon: Icons.insert_drive_file,
                    label: "Document",
                    onTap: () {
                      Navigator.pop(context);
                      // Handle document selection
                      print("Document selected");
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _bottomSheetOption(
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.shade200,
            child: Icon(icon, size: 28, color: Colors.black),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Attachment Button
          IconButton(
            icon: Icon(Icons.attach_file, color: Colors.grey.shade700),
            onPressed: () {
              _showBottomSheet(context);
            },
          ),
          // Message Input Field
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1, 1),
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: TextField(
                controller: controller,
                minLines: 1, // Minimum height of the TextField
                maxLines: 5, // Maximum height before scrolling
                decoration: const InputDecoration(
                  hintText: "Type a message...",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Send Button
          Container(
            decoration: const BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 3,
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.black),
              onPressed: () {
                // Handle send button press
                print("Message sent");
              },
            ),
          ),
        ],
      ),
    );
  }
}
