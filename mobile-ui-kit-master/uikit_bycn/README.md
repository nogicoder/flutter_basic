# UIKitButton

A Button Widget. This button support one-time setup by using App Theme. 

## How To Use
### Apply Theme
assign UIKitButtonThemeData to buttonTheme in ThemeData.

        @override
          Widget build(BuildContext context) {
            return MaterialApp(
                theme: ThemeData(buttonTheme: UIKitButtonThemeData()),
                home: Homepage();
          }
        }
        
### Using 
#### Buttons
##### Create New Button
        UIKitButton(
                  label: "Change Background Color",
                  buttonType: UIKITBUTTONTYPE.FLAT,
                  onPressed: () {})
   
##### Change Background Color
Change background color for all UIKitFlatButton

        (Theme.of(context).buttonTheme as UIKitButtonThemeData) .buttonTheme
        .backgroundColor = Colors.red; 
