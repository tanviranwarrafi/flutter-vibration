# Vibration Flutter

This project is for learning how to make vibration in Flutter App.
 
## Android Permission
 The `VIBRATE` permission is required in AndroidManifest.xml.
 ``` xml
   <uses-permission android:name="android.permission.VIBRATE"/>
 ```
Example Code
 ``` xml
   Future<void> _onVibrate() async {
    var pattern = [500, 1000, 500, 2000, 500, 3000, 500, 500];
    var intensities = [128, 255, 64, 255];
    await Vibration.vibrate(pattern: pattern, intensities: intensities);
  }
 ```
