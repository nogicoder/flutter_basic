import 'package:flutter/material.dart';
import 'package:uikit_bycn/uikittheme.dart';
import 'package:intl/intl.dart';
import 'package:uikit_bycn/interactive_elements/datetime/uikittimepicker.dart';
import 'package:uikit_bycn/interactive_elements/datetime/uikitdatepicker.dart';

enum UIKitDateTimeSelectorType { DATE_TIME, DATE, TIME }
const componentWidth = 150.0;

class UIKitDateTimeSelector extends StatefulWidget {
  final UIKitDateTimeSelectorType type;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final bool calendarInVertical;
  final Function(DateTime onValue) onChanged;
  final bool enabled;

  UIKitDateTimeSelector(
      {this.type = UIKitDateTimeSelectorType.DATE_TIME,
      this.initialDate,
      @required this.firstDate,
      @required this.lastDate,
      this.calendarInVertical = false,
      this.enabled = true,
      this.onChanged});

  @override
  State<StatefulWidget> createState() => UIKitDateTimeSelectorState();
}

class UIKitDateTimeSelectorState extends State<UIKitDateTimeSelector> {
  DateTime selectedDate;

  @override
  initState() {
    selectedDate = widget.initialDate;
    super.initState();
  }

  Widget renderDateComponent() {
    return widget.type != UIKitDateTimeSelectorType.TIME
        ? Container(
            height: 89.0,
            width: componentWidth,
            child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: widget.enabled
                    ? () {
                        showUIKitDatePicker(
                                context: context,
                                isVertical: widget.calendarInVertical,
                                initialDate: selectedDate ?? DateTime.now(),
                                firstDate: widget.firstDate,
                                lastDate: widget.lastDate)
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              selectedDate = DateTime(
                                  value.year,
                                  value.month,
                                  value.day,
                                  selectedDate?.hour ?? 0,
                                  selectedDate?.minute ?? 0);
                            });
                            if (widget.onChanged != null)
                              widget.onChanged(selectedDate);
                          }
                        });
                      }
                    : null,
                child: selectedDate == null
                    ? Icon(
                        Icons.event,
                        color: widget.enabled
                            ? uiKitColors.primary
                            : uiKitColors.button,
                      )
                    : Container(
                        child: Center(
                            child: Text(
                                DateFormat("EEEE\ndd\nMMMM")
                                    .format(selectedDate),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    height: 1.1,
                                    fontWeight: FontWeight.bold,
                                    color: uiKitColors.text))))))
        : Container();
  }

  Widget renderTimeComponent() {
    return widget.type != UIKitDateTimeSelectorType.DATE
        ? Container(
            height: 60.0,
            width: componentWidth,
            child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: widget.enabled
                    ? () {
                        UIKitTimePicker(
                          initMinute: selectedDate?.minute ?? 0,
                          initHour: selectedDate?.hour ?? 0,
                          onPressedOK: (int hour, int minute) {
                            if (selectedDate == null)
                              selectedDate = DateTime.now();
                            setState(() {
                              selectedDate = DateTime(
                                  selectedDate.year,
                                  selectedDate.month,
                                  selectedDate.day,
                                  hour,
                                  minute);
                            });
                            if (widget.onChanged != null)
                              widget.onChanged(selectedDate);
                          },
                        )..show(context);
                      }
                    : null,
                child: selectedDate == null
                    ? Icon(
                        Icons.access_time,
                        color: widget.enabled
                            ? uiKitColors.primary
                            : uiKitColors.button,
                      )
                    : Container(
                        child: Center(
                            child: Text(
                                DateFormat('HH : mm').format(selectedDate),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    height: 1.1,
                                    color: uiKitColors.text))))))
        : Container();
  }

  Widget renderIndicator() {
    return widget.type == UIKitDateTimeSelectorType.DATE_TIME
        ? Container(
            height: 1.0,
            margin: EdgeInsets.symmetric(horizontal: 25.0),
            color: uiKitColors.separator,
          )
        : Container();
  }

  Widget renderCloseButton() {
    return selectedDate != null
        ? Positioned(
            right: -18.0,
            top: -18.0,
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Image(
                  height: 30.0,
                  width: 30.0,
                  image: AssetImage("assets/images/close.png",
                      package: "uikit_bycn")),
              onPressed: () {
                setState(() {
                  selectedDate = widget.initialDate;
                });
              },
            ))
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: componentWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          color: widget.enabled ? Colors.white : uiKitColors.application,
          border: Border.all(color: uiKitColors.separator)),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Column(
            children: <Widget>[
              renderDateComponent(),
              renderIndicator(),
              renderTimeComponent()
            ],
          ),
          renderCloseButton(),
        ],
      ),
    );
  }
}
