import 'package:flutter/material.dart';
import 'Common_RealChatContainer.dart'; // Import the RealChatContainer class

class ChatMessage {
  final int type;
  final String nickName;
  final DateTime sentTime;
  final String displayText;
  bool isMe = false;

  ChatMessage({
    required this.type,
    required this.nickName,
    required this.displayText,
    required this.sentTime,
    required this.isMe,
  });
}

List<ChatMessage> messages = [
  ChatMessage(
    type: 1,
    nickName: 'User1',
    displayText: 'Hello there!',
    sentTime: DateTime.now().subtract(Duration(minutes: 10)),
    isMe: false,
  ),
  ChatMessage(
    type: 2,
    nickName: 'User2',
    displayText: 'Hey! How are you?',
    sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    isMe: true,
  ),
  ChatMessage(
    type: 3,
    nickName: 'User3',
    displayText: '난 너무 화가 나',
    sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    isMe: true,
  ),
];
