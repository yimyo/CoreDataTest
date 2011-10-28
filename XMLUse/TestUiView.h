//
//  TestUiView.h
//  XMLUse
//
//  Created by App on 2011/10/18.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "SearchTreeData.h"
#import "TheTreesListInMap.h"

@interface TestUiView : UIViewController{
    int leafNumber;
}
@property(nonatomic,retain)IBOutlet UIButton *TestButton;
@property(nonatomic,retain)IBOutlet UIButton *TestButton2;
@property(nonatomic,retain)IBOutlet UIButton *TestButton3;
-(IBAction)tsetClick:(id)sender;
-(IBAction)tsetClick2:(id)sender;
-(IBAction)tsetClick3:(id)sender;
@end
