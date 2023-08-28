import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';
import 'Common_SnackBar.dart';

//alert message를, text, snackbar message1, snackbar message2, 이동할 화면을 매개변수로 받도록 설정 후 파일로 분리
//dialogText, '확인' 클릭 시 스낵바 메시지, 이동할 페이지를 받음

void showConfirmationDialogWithNavigation(BuildContext context,
    String dialogText, String snackbarMessage, Widget destinationScreen) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            content: Text(
              dialogText,
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('취소'),
              ),
              ElevatedButton(
                onPressed: () {
                  showSnackbar(context, snackbarMessage);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => destinationScreen,
                  ));
                },
                child: Text('확인'),
              ),
            ],
          );
        },
      );
    },
  );
}
