Master-Detail Template using PageViewController as Detail View Controller
Created by Jonathan Buie (jab165) 10/25/2016
Using Swift 2 & Xcode 7.3.1

Working off the base Master-Detail Template provided by the XCode IDE, there have
been chnages made to use a PageView Controller as the Detail View Controller.

Changes that needed to be considered:
- Setting the new ViewController Class in the App Delegate.
- Changing the necessary ViewController transitions from segues to accept the correct
ViewController Classes
- Properly passing data between classes

Note: These changes could presumably be used to implement any other ViewController 
as the detail portion of the template.