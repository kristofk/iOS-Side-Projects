# ColorID documentation

ColorID or IDColor is a closed source personal project by Kristof Kocsis and is intended for commercial use.

---

## Requirements
* ios 10
* Xcode 8

---

## Frameworks
The project includes 2 frameworks both of witch were imported via CocoaPods.
1.  SwiftyCam: This is the core of the project. SwiftyCam is responsible for the camera feed. | Link to SwiftyCam: https://github.com/Awalz/SwiftyCam
2. Google-Mobile-Ads-SDK: This framework is responsible for the ads. The project uses only 1 ad, a banner on the top that is always the frontmost view.

---

## Views
The project utilizes multiple views across multiple files.
* **Main.storyboard** is entirely built in code. Mostly the default SwiftyCam interactions are implemented but others are present too: Google's banner ad and the Media button.
* **ColorVC** is a storyboard file as well and it is mainly built in interface builder. ColorVC stands for ColorViewController This view is added to the main view as a subview when a picture is taken. This view is responsible for displaying the take/chosen picture and depending on where the user taps it displays the color.

---

## Files containing code
1. **AdMob.swift**: this file contains the custom class for Google's banner ad used throughout the app.
2. **AppDelegate.swift**: the only change in this file is the initialization of the Google-Mobile-Ads-SDK framework.
3. **ColorVC.swift**: this is the ViewController file of ColorVC.xib. The file contains code for the color recognition at a certain point.
4. **Extensions.swift**: this file contains all the Extensions for the Classes that are used. In this file you can find the Color extraction from a point both for UIImage and UIImageView, and the extraction of RGB color values from UIColor.
5. **ViewController.swift**: this is the main ViewController. It contains the code for the camera and taking picture via the SwiftyCam framework.

---

## Extensions


### UIImage

* **getPixelColor(pos: CGPoint) -> UIColor** <br>
**Input**: <br>
*pos: CGPoint*: This is the position from where the function retrieves the UIColor from. <br>
**Return**:
The funtion return the color of the selected pixel in UIColor class. <br>
**Description**:
This function is self explanatory. The code returns the UIColor of the picture in the instance at CGPoint. This function isn't used in the project. It is archived for further reference.

### UIImageView

* **getPixelColorAt(point: CGPoint) -> UIColor** <br>
**Input**: <br>
*point: CGPoint*: This determines which pixel the function is going to retrieve the color from.
 <br>
**Return**:
The color of the selected pixel is returned in UI Color. <br>
**Description**:
This function does the same as the one for the UIImage but this works without an Image in the instance since it returns the color displayed in the UIImageView which is by default white.

### UIColor

* **rgb() -> (red: Int, green: Int, blue: Int, alpha: Int)** <br>
**Input**: N/A <br>
**Return**:
This function return a tuple containing the R, G, B and A values.

---

## Classes

### AdMob_Ad
The name of the class doesn't exactly follow the Swift naming convenction, that would be: AdMobAd but imho my naming is more understandeble ad admob type ad. This class is responsible for maniging one ad. It has functions to support everything this project needs. The AdMob_Ad class is declared in the AdMob.swift file.
#### Functions
* **displayAd(on view: ViewController)** <br>
**Input**:<br>
*view: ViewController*: This specifies the view on which the ad will be placed on.
**Return**: N/A This function doesn't return a value. <br>
**Description**: This method places an ad, specified by the variables in of the instance on the given display.

---

## ViewControllers
There are 2 ViewController classes in the project. One for the main.storyboard and the otherone is for the ColorVC.xib.
### ViewController.swift
This ViewController is for the Main.storyboard. The View is built up in the code via subviews both custom and from the SwiftyCam framework.




---

## Further updates
Zooming in the UIImage via the UIImageView.
