library underline_otp_text_field;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:underline_otp_text_field/underline.dart';

class UnderlineOtpTextField extends StatelessWidget {
  final Function(String) onValueChanged;
  final Color underLineColor;
  final Color textColor;
  final double lineSpacing;
  final int fieldCount;
  final bool enabled;
  final TextEditingController controller;
  UnderlineOtpTextField({
    Key key,
    this.lineSpacing = 2,
    this.fieldCount = 6,
    this.underLineColor = Colors.green,
    this.enabled = true,
    this.onValueChanged,
    this.textColor,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      if (onValueChanged != null) onValueChanged(controller.text);
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: SizedBox(
            width: 252.0,
            child: TextField(
              focusNode: FocusNode(),
              autofocus: true,
              cursorWidth: 0.0,
              controller: controller,
              enabled: enabled,
              inputFormatters: [
                LengthLimitingTextInputFormatter(fieldCount),
              ],
              style: TextStyle(
                letterSpacing: 30.0,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _rowElements,
        )
      ],
    );
  }

  get _rowElements {
    List<Widget> widgets = [];
    for (int i = 0; i < this.fieldCount; i++) {
      widgets.add(UnderLine(
        color: this.underLineColor,
      ));
      if (i < this.fieldCount) {
        widgets.add(SizedBox(
          width: lineSpacing,
        ));
      }
    }
    return widgets;
  }
}
