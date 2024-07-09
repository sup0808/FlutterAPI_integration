import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedBtn extends StatelessWidget {
  final String btnName;
  final Icon? icon;
  final Color? color;
  final TextStyle? textStyle;
  final VoidCallback? callback;

  RoundedBtn(
      {required this.btnName,
      this.icon,
      this.color = Colors.blue,
      this.textStyle,
      this.callback});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          callback!();
        },
        child: icon != null
            ? Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon!,
                  Container(
                    width: 10,
                  ),
                  Text(
                    btnName,
                    style: textStyle,
                  )
                ],
              )
            : Text(
                btnName,
                style: textStyle,
              ),
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shadowColor: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))
            )),
      ),
    );
  }
}
