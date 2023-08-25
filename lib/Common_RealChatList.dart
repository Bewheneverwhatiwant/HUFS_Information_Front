import 'package:flutter/material.dart';
import 'Common_RealChatContainer.dart';

class ChatMessage {
  final int type;
  final String nickName;
  final DateTime sentTime;
  final String displayText;
  bool isMe = false; //채팅 보내는 사람이 본인인가?
  bool isHost = false; //방장인가?

  ChatMessage({
    required this.type,
    required this.nickName,
    required this.displayText,
    required this.sentTime,
    required this.isMe,
    required this.isHost,
  });
}

List<ChatMessage> messages = [
  ChatMessage(
    type: 1,
    nickName: '기니피그',
    displayText: '사료를 달라',
    sentTime: DateTime.now().subtract(Duration(minutes: 10)),
    isMe: true,
    isHost: false,
  ),
  ChatMessage(
    type: 1,
    nickName: '사육사(트리어스)',
    displayText: '너 너무 살쪄서 안돼.',
    sentTime: DateTime.now().subtract(Duration(minutes: 10)),
    isMe: false,
    isHost: true,
  ),
  ChatMessage(
    type: 1,
    nickName: '기니피그',
    displayText: '시무룩...',
    sentTime: DateTime.now().subtract(Duration(minutes: 10)),
    isMe: true,
    isHost: false,
  ),
  ChatMessage(
    type: 2,
    nickName: '스폰지밥',
    displayText: '월요일 조아아',
    sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    isMe: true,
    isHost: true,
  ),
  ChatMessage(
    type: 2,
    nickName: '징징이',
    displayText: '한심한 해면 녀석 같으니라고',
    sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    isMe: false,
    isHost: false,
  ),
  ChatMessage(
    type: 2,
    nickName: '스폰지밥',
    displayText: '징징아! 그래도 난 널 사랑해!',
    sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    isMe: true,
    isHost: true,
  ),
  ChatMessage(
    type: 3,
    nickName: '집게사장',
    displayText: '돈은 언제나 옳다!',
    sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    isMe: true,
    isHost: false,
  ),
  ChatMessage(
    type: 3,
    nickName: '나영이',
    displayText: '그렇고말고',
    sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    isMe: false,
    isHost: true,
  ),
  ChatMessage(
    type: 3,
    nickName: '수혁이',
    displayText: '그렇고말고22',
    sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    isMe: false,
    isHost: true,
  ),
  ChatMessage(
    type: 3,
    nickName: '나영이',
    displayText: '그렇고말고',
    sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    isMe: false,
    isHost: true,
  ),
  ChatMessage(
    type: 3,
    nickName: '수혁이',
    displayText: '그렇고말고33',
    sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    isMe: false,
    isHost: true,
  ),
  ChatMessage(
    type: 3,
    nickName: '나영이',
    displayText: '그렇고말고',
    sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    isMe: false,
    isHost: true,
  ),
  ChatMessage(
    type: 3,
    nickName: '수혁이',
    displayText: '그렇고말고44',
    sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    isMe: false,
    isHost: true,
  ),
  ChatMessage(
    type: 3,
    nickName: '나영이',
    displayText: '그렇고말고',
    sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    isMe: false,
    isHost: true,
  ),
  ChatMessage(
    type: 3,
    nickName: '나영이',
    displayText: '그렇고말고',
    sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    isMe: false,
    isHost: true,
  ),
  ChatMessage(
    type: 3,
    nickName: '나영이',
    displayText: '그렇고말고',
    sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    isMe: false,
    isHost: true,
  ),
  ChatMessage(
    type: 3,
    nickName: '나영이',
    displayText: '그렇고말고',
    sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    isMe: false,
    isHost: true,
  ),
  ChatMessage(
    type: 3,
    nickName: '나영이',
    displayText: '그렇고말고',
    sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    isMe: false,
    isHost: true,
  ),
  ChatMessage(
    type: 3,
    nickName: '나영이',
    displayText: '그렇고말고',
    sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    isMe: false,
    isHost: true,
  ),
  ChatMessage(
    type: 3,
    nickName: '나영이',
    displayText: '그렇고말고',
    sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    isMe: false,
    isHost: true,
  ),
];
