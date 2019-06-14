import 'package:flutter/material.dart';
import 'package:uikit_bycn/buttons/uikitflatbutton.dart';
import 'package:uikit_bycn/buttons/uikitoutlinebutton.dart';

class UIKitDialog {
  static show(
      {@required BuildContext context,
      Widget title,
      Widget content,
      TextStyle titleTextStyle,
      TextStyle contentTextStyle,
      Function onPressedOK,
      Function onPressedCancel}) {
    double buttonSize = (MediaQuery.of(context).size.width - 96) / 2 - 20;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            titlePadding: EdgeInsets.all(20.0),
            title: title,
            titleTextStyle: titleTextStyle,
            content: content,
            contentTextStyle: contentTextStyle,
            actions: <Widget>[
              Container(
                  width: MediaQuery.of(dialogContext).size.width - 96,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      SizedBox(
                        width: buttonSize,
                        child: UIKitFlatButton(
                          label: "OK",
                          onPressed: () {
                            if (onPressedOK != null) onPressedOK();
                          },
                        ),
                      ),
                      SizedBox(
                        width: buttonSize,
                        child: UIKitOutlineButton(
                          label: "ANNULER",
                          onPressed: () {
                            if (onPressedCancel != null) onPressedCancel();
                          },
                        ),
                      ),
                    ],
                  ))
            ],
          );
        });
  }
}
