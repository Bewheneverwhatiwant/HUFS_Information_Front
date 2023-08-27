import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';
import 'Common_paddingElement.dart';
import 'Common_NeumorphicButton.dart';
import 'Common_CheckBox.dart';
import 'Common_SnackBar.dart';
import 'Page_BuyRandomBox.dart';
import 'Page_MyRandomBox.dart';

class BuyTicketByPoint extends StatefulWidget {
  final BuildContext context;

  const BuyTicketByPoint({
    required this.context,
  });

  @override
  _BuyTicketByPointState createState() => _BuyTicketByPointState();
}

class _BuyTicketByPointState extends State<BuyTicketByPoint> {
  int _quantity = 1;
  int Point = 7000;
  int TicketPrice = 300;
  bool _isCheckbox1Checked = false;
  bool _isCheckbox2Checked = false;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

//구매하기 버튼 클릭 시 띄울 alert message
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('구매 확인'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('정말로 티켓 구매를 진행하시겠습니까?'),
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (bool? value) {
                          setState(() {
                            _isCheckbox1Checked = value ?? false;
                          });
                        },
                        value: _isCheckbox1Checked,
                      ),
                      Text('구매 조건에 동의합니다.'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (bool? value) {
                          setState(() {
                            _isCheckbox2Checked = value ?? false;
                          });
                        },
                        value: _isCheckbox2Checked,
                      ),
                      Text('구매 수량을 확인했습니다.'),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    showSnackbar(context, '티켓 구매가 취소되었습니다!');
                  },
                  child: Text('취소'),
                ),
                ElevatedButton(
                  onPressed: (_isCheckbox1Checked && _isCheckbox2Checked)
                      ? () {
                          int totalCost = TicketPrice * _quantity;

                          if (totalCost > Point) {
                            showSnackbar(
                                context, '잔여 포인트가 부족합니다! 티켓 구매에 실패했습니다.');
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          } else {
                            showSnackbar(context, '티켓 구매가 완료되었습니다!');

                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          }
                        }
                      : null,
                  child: Text('확인'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalCost = TicketPrice * _quantity; //구매가 계산을 위함

    return Scaffold(
      appBar: LogoAppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Image.asset('assets/images/TicketImage.png'),
            paddingElement(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '구매가',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    (TicketPrice).toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue),
                  ),
                ],
              ),
            ),
            paddingElement(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '수량선택',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: _decrementQuantity,
                      ),
                      Text(
                        '$_quantity',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: _incrementQuantity,
                      ),
                      Text(
                        '개',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            paddingElement(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '총 사용 포인트',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    (TicketPrice * _quantity).toString(), //개당 가격에 수량을 곱함
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue),
                  ),
                ],
              ),
            ),
            paddingElement(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '나의 현재 보유 포인트',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    '${Point}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue),
                  ),
                ],
              ),
            ),
            paddingElement(Container(
                width: double.infinity,
                height: 60,
                child: NeumorphicButton(
                    onPressed: () {
                      _showConfirmationDialog();
                    },
                    child: Text('구매하기',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20))))),
            SizedBox(height: 5),
            paddingElement(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                Text('사용처: HUFS Infogral',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
                SizedBox(height: 10),
                Text('상세설명',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Row(
                  children: [
                    Text('HUFS Infogral에서 채팅방 입장 및 개설 시 활용되는 티켓입니다.'),
                    SizedBox(width: 5),
                  ],
                ),
                Text('주의사항',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text('1. 구매 시 랜덤박스 보관함으로 지급되며, 리스트를 탭하여 박스를 개봉하면\n보상이 지급됩니다.'),
                Text('2. 본 상품은 환불/교환이 불가능한 상품입니다.')
              ],
            )),
          ],
        ),
      ),
    );
  }
}
