import 'uikitradiobuttontheme.dart';
import 'uikitcheckboxtheme.dart';
import 'uikitchiptheme.dart';
import 'uikitswitchtheme.dart';
import 'uikitslidertheme.dart';

class UIKitSelectionControlThemeData {
  UIKitRadioButtonTheme radioButtonTheme;
  UIKitChecboxTheme checkboxTheme;
  UIKitSwitchTheme switchTheme;
  UIKitChipTheme chipTheme;
  UIKitSliderTheme sliderTheme;

  UIKitSelectionControlThemeData({
    this.radioButtonTheme,
    this.checkboxTheme,
    this.switchTheme,
    this.chipTheme,
    this.sliderTheme
  }) {
    this.radioButtonTheme ??= new UIKitRadioButtonTheme();
    this.checkboxTheme ??= UIKitChecboxTheme();
    this.switchTheme ??= UIKitSwitchTheme();
    this.chipTheme ??= UIKitChipTheme();
    this.sliderTheme ??= UIKitSliderTheme();
  }
}
