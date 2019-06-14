import 'package:flutter/material.dart';
import 'package:uikit_bycn/text_fields/uikittextfieldtheme.dart';

enum UIKitTextFieldType { text, password, email, number, phone, url }
enum UIKitTextFieldStatus { enabled, disabled, focus, valid, invalid }

class UIKitTextField extends StatefulWidget {
  final UIKitTextFieldTheme theme = UIKitTextFieldTheme();
  final UIKitTextFieldType type;
  final String label;
  final String hint;
  final String error;
  final IconData suffixIcon;
  final String value;
  final bool enabled;
  final bool Function(String value) validator;
  final void Function(String value) onChanged;
  final FocusNode focusNode;
  UIKitTextField({
    this.value,
    this.type,
    this.label,
    this.hint,
    this.error,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.enabled,
    this.focusNode,
  });

  @override
  State<UIKitTextField> createState() => new UIKitTextFieldState();
}

class UIKitTextFieldState extends State<UIKitTextField> {
  final TextEditingController _controller = TextEditingController();
  FocusNode _focus;
  bool _isDirty = false;
  bool _hasFocus = false;
  bool _showPassword = false;
  UIKitTextFieldTheme theme;
  UIKitTextFieldStatus get status {
    if (widget.enabled != null && !widget.enabled) {
      return UIKitTextFieldStatus.disabled;
    }
    if (widget.validator != null && !widget.validator(_controller.text)) {
      if (_isDirty) {
        return UIKitTextFieldStatus.invalid;
      }
      if (_hasFocus) {
        return UIKitTextFieldStatus.focus;
      } else {
        return UIKitTextFieldStatus.enabled;
      }
    } else {
      if (_hasFocus) {
        return UIKitTextFieldStatus.focus;
      } else {
        return UIKitTextFieldStatus.enabled;
      }
    }
  }

  get stateColor {
    switch (status) {
      case UIKitTextFieldStatus.disabled:
        {
          return theme.disabledColor;
        }
        break;

      case UIKitTextFieldStatus.focus:
        {
          return theme.activeColor;
        }
        break;

      case UIKitTextFieldStatus.valid:
        {
          return theme.activeColor;
        }
        break;

      case UIKitTextFieldStatus.invalid:
        {
          return theme.errorColor;
        }
        break;

      case UIKitTextFieldStatus.enabled:
      default:
        {
          return theme.defaultColor;
        }
        break;
    }
  }

  TextStyle get textFieldStyle {
    return TextStyle(
      fontSize: theme.textField.fontSize,
      fontFamily: theme.textField.fontFamily,
      color: stateColor,
    );
  }

  TextStyle get labelStyle {
    return TextStyle(
      color: stateColor,
      fontSize: theme.textFieldLabel.fontSize,
      height: 1.5,
    );
  }

  TextInputType get _getKeyboardType {
    switch (widget.type) {
      case UIKitTextFieldType.email:
        {
          return TextInputType.emailAddress;
        }
        break;
      case UIKitTextFieldType.number:
        {
          return TextInputType.number;
        }
        break;
      case UIKitTextFieldType.phone:
        {
          return TextInputType.phone;
        }
        break;
      case UIKitTextFieldType.url:
        {
          return TextInputType.url;
        }
        break;
      case UIKitTextFieldType.text:
      case UIKitTextFieldType.password:
      default:
        {
          return TextInputType.text;
        }
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _focus = widget.focusNode ?? FocusNode();
    if (widget.value != null) {
      _controller.text = widget.value;
    }
    _controller.addListener(() {
      if (_controller.text.length > 0 && !_isDirty) {
        _isDirty = true;
      }
      if (widget.onChanged != null) {
        widget.onChanged(_controller.text);
      }
    });
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _hasFocus = _focus.hasFocus;
    });
  }

  Widget _renderInput() {
    return Expanded(
      child: TextFormField(
        controller: _controller,
        focusNode: _focus,
        style: textFieldStyle,
        textAlign: TextAlign.left,
        autocorrect: false,
        keyboardType: _getKeyboardType,
        enabled: widget.enabled ?? true,
        obscureText: widget.type != null &&
            widget.type == UIKitTextFieldType.password &&
            !_showPassword,
        decoration: InputDecoration(
          labelText: widget.label ?? '',
          hintText: widget.hint ?? '',
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(bottom: 8.0),
          labelStyle: textFieldStyle,
        ),
      ),
    );
  }

  Widget _renderSuffix() {
    if (widget.type != UIKitTextFieldType.password &&
        widget.suffixIcon == null) {
      return Container();
    }
    return Column(
      children: <Widget>[
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Icon(
            widget.suffixIcon != null
                ? widget.suffixIcon
                : Icons.remove_red_eye,
            color: stateColor,
          ),
          onTap: widget.type == UIKitTextFieldType.password &&
                  status != UIKitTextFieldStatus.disabled
              ? () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                }
              : null,
        )
      ],
    );
  }

  Widget _renderError() {
    return Container(
        height: 22.0,
        child: status == UIKitTextFieldStatus.invalid
            ? Row(
                children: <Widget>[
                  Text(
                    widget.error ?? '',
                    style: labelStyle,
                  ),
                ],
              )
            : Container());
  }

  @override
  Widget build(BuildContext context) {
    theme = widget.theme;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[_renderInput(), _renderSuffix()],
            ),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: stateColor, width: 2.0))),
          ),
          _renderError()
        ],
      ),
    );
  }
}
