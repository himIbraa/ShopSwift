import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = '/chat';

  const ChatScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ChatScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9E17E),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 2),
              child: const Icon(Icons.account_box_outlined, color: Colors.black),
            ),
            const SizedBox(width: 8.0),
            const Text(
              'User Name',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const DateIndicatorWidget('3 Nov'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: const [
                MessageWidget(
                    isMe: true,
                    text: 'Antique bookshelf still up?',
                    time: '12:19 pm',
                    delivered: true),
                MessageWidget(isMe: false, text: 'Yep', time: '12:24 pm'),
                MessageWidget(
                    isMe: false,
                    text: '6ft x 3ft x 1.5ft. Minor scratches.',
                    time: '12:25 pm'),
                MessageWidget(
                    isMe: true,
                    text: 'delivery or pickup?',
                    time: '12:27 pm',
                    delivered: true),
                MessageWidget(
                    isMe: false,
                    text: 'Can deliver for a fee. Your call.',
                    time: '12:28 pm'),
                MessageWidget(
                    isMe: true,
                    text: 'Checking pics, thx!',
                    time: '12:28 pm',
                    delivered: true),
                MessageWidget(
                    isMe: false,
                    text: 'Sure thing! Ask anything.',
                    time: '12:29 pm'),
              ],
            ),
          ),
          _buildMessageComposer(),
        ],
      ),
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color(
                            0xFFD3D9DC)), // Set the border color to #D3D9DC
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'message...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          // Handle send button pressed
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final bool isMe;
  final String text;
  final String time;
  final bool delivered;

  const MessageWidget(
      {super.key, required this.isMe,
      required this.text,
      required this.time,
      this.delivered = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isMe ? const Color(0xFFF9E17E) : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12.0),
                topRight: const Radius.circular(12.0),
                bottomLeft: isMe ? const Radius.circular(12.0) : const Radius.circular(0.0),
                bottomRight:
                    isMe ? const Radius.circular(0.0) : const Radius.circular(12.0),
              ),
              border: Border.all(
                  color: const Color(0xFFD3D9DC)), // Set the border color to #D3D9DC
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: isMe ? Colors.black : Colors.black),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      time,
                      style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                    if (isMe && delivered)
                      const Icon(Icons.done, size: 16.0, color: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DateIndicatorWidget extends StatelessWidget {
  final String date;

  const DateIndicatorWidget(this.date, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 51.0,
      height: 26.0,
      margin: const EdgeInsets.symmetric(horizontal: 155.5, vertical: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xFF9A9A9A),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Center(
        child: Text(
          date,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
