# ColorID documentation

ColorID or IDColor is a closed source personal project by Kristof Kocsis and is intended for commercial use.

## Requirements
* ios 10
* Xcode 8

## Frameworks
The project includes 2 frameworks both of witch were imported via CocoaPods.
1.  SwiftyCam: This is the core of the project. SwiftyCam is responsible for the camera feed. | Link to SwiftyCam: https://github.com/Awalz/SwiftyCam
2. Google-Mobile-Ads-SDK: This framework is responsible for the ads. The project uses only 1 ad, a banner on the top that is always the frontmost view.

## Views
The project utilizes multiple views across multiple files.
* **Main.storyboard** is entirely built in code. Mostly the default SwiftyCam interactions are implemented but others are present too: Google's banner ad and the Media button.
* **ColorVC** is a storyboard file as well and it is mainly built in interface builder. ColorVC stands for ColorViewController This view is added to the main view as a subview when a picture is taken. This view is responsible for displaying the take/chosen picture and depending on where the user taps it displays the color.

## Files containing code
1. **AdMob.swift**: this file contains the custom class for Google's banner ad used throughout the app.
2. **AppDelegate.swift**: the only change in this file is the initialization of the Google-Mobile-Ads-SDK framework.
3. **ColorVC.swift**: this is the ViewController file of ColorVC.xib. The file contains code for the 
