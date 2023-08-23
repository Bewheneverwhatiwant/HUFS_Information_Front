import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';
import 'Common_NeumorphicBox.dart';
import 'Common_SnackBar.dart';
import 'Page_SuggestWriteForm.dart';
import 'Gather_CreateChat.dart';

class EtcSuggestion extends StatefulWidget {
  final BuildContext context;
  const EtcSuggestion({required this.context, Key? key});
  @override
  _EtcSuggestionState createState() => _EtcSuggestionState();
}

class _EtcSuggestionState extends State<EtcSuggestion> {
  List<int> likeList = List.generate(7, (_) => 0);

  void toggleLike(int index) {
    setState(() {
      if (likeList[index] == 0) {
        likeList[index] = 1;
      } else {
        likeList[index] = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return SuggestContainer(
                  title: '건의건의 테스트${index + 1}',
                  message: '테스트메시지${index + 1}',
                  like: likeList[index],
                  onTap: () => toggleLike(index));
            },
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: CreateChat(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SuggestWriteForm(
                            context: context,
                          )),
                );
              },
              child: Text('+',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

class SuggestContainer extends StatelessWidget {
  final String title;
  final String message;
  final int like;
  final VoidCallback onTap;

  const SuggestContainer({
    required this.title,
    required this.message,
    required this.like,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: NeumorphicBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(message),
              ],
            ),
            SizedBox(height: 16),
            LikeButton(like: like, onTap: onTap),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class LikeButton extends StatelessWidget {
  final int like;
  final VoidCallback onTap;

  const LikeButton({required this.like, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.thumb_up,
                    size: 12,
                    color: like == 1 ? Colors.blue : Colors.grey,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '공감해요',
                    style: TextStyle(
                      fontSize: 10,
                      color: like == 1 ? Colors.blue : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(
            '공감수: $like',
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
