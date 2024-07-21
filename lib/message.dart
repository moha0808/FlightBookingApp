import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({'text': text, 'isSent': true});
      _messages.add({'text': 'Response to: $text', 'isSent': false});
    });

    _controller.clear();
  }

  Widget _buildMessage(Map<String, dynamic> message) {
    final bool isSent = message['isSent'];
    final alignment = isSent ? Alignment.topRight : Alignment.topLeft;
    final color = isSent ? Colors.blue : Colors.grey[200];
    final textColor = isSent ? Colors.white : Colors.black;

    return Align(
      alignment: alignment,
      child: ChatBubble(
        clipper: ChatBubbleClipper1(
          type: isSent ? BubbleType.sendBubble : BubbleType.receiverBubble,
        ),
        alignment: alignment,
        margin: EdgeInsets.only(top: 10),
        backGroundColor: color,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            message['text'],
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Support',style: TextStyle(fontStyle: FontStyle.italic,color: Colors.red),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

