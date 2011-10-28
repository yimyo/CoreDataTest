//
//  TestUiView.m
//  XMLUse
//
//  Created by App on 2011/10/18.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "TestUiView.h"

@implementation TestUiView
@synthesize TestButton,TestButton2,TestButton3;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    leafNumber = 1;
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)tsetClick:(id)sender
{
    SearchTreeData *testTrees = [[SearchTreeData alloc]init];//第二單元會用到的方法都要產生此物件
    NSLog(@"After");
    //取用所有樹的位置資料
    /*
    NSMutableArray *testTreeArray = [testTrees searchUseTreeDataInMapOfInputLatitude:25.04219 inputLongitude:121.54965];
    
    for (int i = 0; i<[testTreeArray count]; i++) {
        TheTreesListInMap *personEntity = [testTreeArray objectAtIndex:i];
        NSLog(@"selete TreeID %@",personEntity.treeID);  
    }
    */
    
    //取用某樹的所有資料
    /*
    TheTreesListInMap *testTreeArray = [[[TheTreesListInMap alloc]init]autorelease];
    testTreeArray = [testTrees searchTreeIndexOfInputTreeID:@"1"];
    NSLog(@"TreeIDArray   %@",testTreeArray.treeAddress);
     */
    /*NSMutableArray *test = [testTrees searchUseTreeDataInMapOfInputLatitude:25.04219 inputLongitude:121.54965];
    for (int i = 0; i<[test count]; i++) {
        TheTreesListInMap *personEntity = [test objectAtIndex:i];
        NSLog(@"Before %@",personEntity.treeID);  
    }
    */
    
    NSMutableArray *test = [testTrees searchUseTreeDataInMapOfInputLatitude:25.04219 inputLongitude:121.54965];
    
    for (int i = 0; i<[test count]; i++) {
        TheTreesListInMap *personEntity = [test objectAtIndex:i];
        NSLog(@"After %@",personEntity.treeID);  
    }
    NSLog(@"種子數:  %i",[[NSUserDefaults standardUserDefaults] integerForKey:@"kUserSeedsNumber"]);
    //SearLeafUseData *leafUse =  [[[SearLeafUseData alloc]init]autorelease];
    //NSLog(@"目前有葉子: %i",[leafUse leafUseNumber]);
    
    [testTrees release];
}

-(IBAction)tsetClick2:(id)sender
{
    
    if(leafNumber <= 20){
        SearchTreeData *testTrees =  [[[SearchTreeData alloc]init]autorelease];
        NSString *test = [[NSString alloc ]initWithFormat:@"%i",leafNumber];
        [testTrees pluckedTreeID:test];
        leafNumber +=1;
        NSLog(@"pluck!!!");
    }else{
        NSLog(@"Noleaf");
    }
}

-(IBAction)tsetClick3:(id)sender
{
    SearchTreeData *testTrees =  [[[SearchTreeData alloc]init]autorelease];
    [testTrees updatdRound];
    int userRound = [[NSUserDefaults standardUserDefaults] integerForKey:@"kUserSeedsNumber"];
    NSLog(@"更新！  目前回合 %i",userRound);
    int testRound = [testTrees seedUseNumber];
    NSLog(@"測試回合數  %i",testRound);
    leafNumber = 1;
}

@end
