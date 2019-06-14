import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This is test
enum UIKitCardLayout {
  /// layout1
  layout1,

  /// layout2
  layout2
}

class UIKitCard extends StatelessWidget {
  final ImageProvider photo;
  final String title;
  final String content;
  final UIKitCardLayout layout;
  final double radius;
  final bool hasStatus;
  final Color statusColor;
  final Widget confirmAction;

  UIKitCard(
      {this.photo,
      this.title,
      this.content,
      this.layout = UIKitCardLayout.layout1,
      this.radius = 12.0,
      this.hasStatus = false,
      this.statusColor = const Color(0xFFE4E4E4),
      this.confirmAction});

  Widget _buildPhoto({double width, double height, BorderRadius borderRadius}) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: SizedBox(
        height: height,
        width: width,
        child: Image(
          image: photo,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }

  Widget _buildTexts() {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 15.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            title != null
                ? Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFF555554),
                      fontSize: 20.0,
                      height: 1.2,
                    ),
                  )
                : Container(),
            SizedBox(height: 12.0),
            content != null
                ? Text(
                    content,
                    style: TextStyle(
                      color: Color(0xFF9C9C9C),
                      fontSize: 14.0,
                      height: 1.4,
                    ),
                  )
                : Container(),
            SizedBox(height: confirmAction != null ? 16.0 : 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                confirmAction ?? Container()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLayout() {
    switch (layout) {
      case UIKitCardLayout.layout2:
        return IntrinsicHeight(
          child: Row(
            children: <Widget>[
              photo != null
                  ? Column(
                      children: <Widget>[
                        _buildPhoto(
                          height: 100.0,
                          width: 100.0,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(radius),
                            bottomLeft: Radius.circular(radius),
                          ),
                        )
                      ],
                    )
                  : Container(),
              Container(
                width: 18.0,
                padding: EdgeInsets.symmetric(vertical: radius),
                child: hasStatus
                    ? Container(
                        width: 4.0,
                        margin: EdgeInsets.only(left: 5.0, right: 8.0),
                        decoration: BoxDecoration(
                          color: statusColor,
                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        ),
                      )
                    : Container(),
              ),
              Expanded(
                child: Container(
                  height: photo != null ? 100.0 : null,
                  child: _buildTexts(),
                ),
              )
            ],
          ),
        );
      case UIKitCardLayout.layout1:
      default:
        return Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: photo != null ? _buildPhoto(
                    height: 150.0,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius),
                    ),
                  ) : Container(),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: _buildTexts(),
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      elevation: 4.0,
      child: _buildLayout(),
    );
  }
}
