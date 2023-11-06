import 'package:flutter/material.dart';
class Call extends StatefulWidget {
  const Call({Key? key}) : super(key: key);

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  late int first ,second;
  late String opp;
  late String result,text ='';
  void btnClicked(String btnText){
    if (btnText == 'C'){
      print('case  1');
      result ='';
      text ='';
      first = 0;
      second =0;
    } else if (btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/'){
      print('case  2');
      //save value first
      first =int.parse(text);
      result ='';
      opp =btnText;
    }   else if (btnText == '='){
      print('case  3');
      //calculate value first and second
      second = int.parse(text);
      if(opp == '+'){
        result = (first + second).toString();
      }
      else if (opp == '-'){
        result = (first -  second).toString();
      }
      else if (opp == 'x'){
        result = (first *  second).toString();
      }
      else if (opp == '/'){
        result = (first ~/  second).toString();
      }
    }else {
      print('case  4');
      result = int.parse(text + btnText).toString();
    }
    setState(() {
      text = result;
    });

  }
  Widget customOutlineButton(String value){
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnClicked(value),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value, style: TextStyle(fontSize: 25),
          ),
        ),

      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
        centerTitle: true,
      ),

      body: Container(
height: 700,

        child: Column(
          children: [
            Expanded(
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.cyan
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  customOutlineButton('9'),
                  customOutlineButton('8'),
                  customOutlineButton('7'),
                  customOutlineButton('+'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  customOutlineButton('6'),
                  customOutlineButton('5'),
                  customOutlineButton('4'),
                  customOutlineButton('-'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  customOutlineButton('3'),
                  customOutlineButton('2'),
                  customOutlineButton('1'),
                  customOutlineButton('x'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  customOutlineButton('C'),
                  customOutlineButton('0'),
                  customOutlineButton('='),
                  customOutlineButton('/'),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}