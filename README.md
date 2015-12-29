# PCSAlertView

# Main Features:

1. Support for any version (As this alert view is based on UIView, No deprecation).

2. We can show any type of content in alert view. Eg: Table view, Image View, Text View etc.,

3. Customizable alert Title: We can add title color, background image etc.,

4. Customizable buttons: Buttons also customizable. We can add our own customized buttons.

5. The alert will change into PopUp View in seconds. 

6. Adaptive to device orientations, screen sizes, keyboard show, dismiss.

# Usage

Import the PCSAlertViewContainer.h in your class
...
import "PCSAlertViewContainer.h"
...

Add delegate to get notified through delegate methods when alertview button clicked
...
@interface ViewController : UIViewController<PCSAlertViewContainerDelegate>
...

in your .m file add these lines of code
...
PCSAlertViewContainer *alertViewContainer = [[PCSAlertViewContainer alloc] initWithTitle:@"Alert!!" titleColor:nil titleFont:nil backgroundImage:nil];
[alertViewContainer setContainerViewContent:[self createSampleView]];
alertViewContainer.tag = 3;
[alertViewContainer setDelegate:self];
[alertViewContainer setCustomButtonTitlesArray:[NSMutableArray arrayWithObjects:@"OK",nil]];
[alertViewContainer show];
...

 You may use a Block, rather than a delegate.
...
[alertViewContainer setAlertViewButtonActionCompletionHandler:^(PCSAlertViewContainer *alertView, int buttonIndex) {
NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)alertView.tag);
[alertView close];
}];
...

