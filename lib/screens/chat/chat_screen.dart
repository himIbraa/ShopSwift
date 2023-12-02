import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF9E17E),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              // Handle back button pressed
            },
          ),
          title: Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 2),
                child: Icon(Icons.account_box_outlined, color: Colors.black),
              ),
              SizedBox(width: 8.0),
              Text(
                'User Name',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            DateIndicatorWidget('3 Nov'),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(8.0),
                children: [
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
      ),
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color(
                            0xFFD3D9DC)), // Set the border color to #D3D9DC
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'message...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
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
          SizedBox(height: 8.0),
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

  MessageWidget(
      {required this.isMe,
      required this.text,
      required this.time,
      this.delivered = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isMe ? Color(0xFFF9E17E) : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
                bottomLeft: isMe ? Radius.circular(12.0) : Radius.circular(0.0),
                bottomRight:
                    isMe ? Radius.circular(0.0) : Radius.circular(12.0),
              ),
              border: Border.all(
                  color: Color(0xFFD3D9DC)), // Set the border color to #D3D9DC
            ),
            padding: EdgeInsets.all(8.0),
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
                    SizedBox(height: 4.0),
                    Text(
                      time,
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                    if (isMe && delivered)
                      Icon(Icons.done, size: 16.0, color: Colors.grey),
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

  DateIndicatorWidget(this.date);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 51.0,
      height: 26.0,
      margin: EdgeInsets.symmetric(horizontal: 155.5, vertical: 10.0),
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFF9A9A9A),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Center(
        child: Text(
          date,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
