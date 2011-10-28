//
//  CoreDataBaseUse.m
//  XMLUse
//
//  Created by App on 2011/10/13.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "CoreDataBaseUse.h"

//自定UserDefault的名稱
NSString * const kCoreDataBaseUse_DidImportData = @"kCoreDataBaseUse_DidImportData";
//NSString * const kLeafNumber = @"kLeafNumber";
//NSString * const kUserRound = @"kUserRound";

@interface CoreDataBaseUse ()

@property (nonatomic, readwrite, retain) NSPersistentStoreCoordinator *coordinator;

@end

@implementation CoreDataBaseUse
@synthesize coordinator;

+ (id) sharedDataStore 
{
    
	static __typeof__(self) returnedInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^ {
		returnedInstance = [[self alloc] init];
	});
	//[[self alloc] init];
	return returnedInstance;
    
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    //建立coreData資料庫
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"TreeModel" withExtension:@"momd"];
    NSManagedObjectModel *model = [[[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL] autorelease];
    
	NSString *documentDirectory =[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
	NSURL *storeURL = [NSURL fileURLWithPath:[documentDirectory stringByAppendingPathComponent:@"TreeModel.sqlite"]];
	
	self.coordinator = [[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model] autorelease];
	
    
	NSError *storeAddingError = nil;
	if (![coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,[NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption,nil] error:&storeAddingError]) {
		NSLog(@"storeAddingError %@", storeAddingError);
	}
    
    //建立使用者初始本機資料
    BOOL hasImportedData = [[NSUserDefaults standardUserDefaults] boolForKey:kCoreDataBaseUse_DidImportData];
	
    if (!hasImportedData) {
        [self setXMLData];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kCoreDataBaseUse_DidImportData];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"kLeafNumber"];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"kUserSeedsNumber"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"kUserRound"];
    }
    return self;
}

-(void)dealloc
{
    [coordinator release];
	[super dealloc];
}

//產生NSManagedObjectContext
- (NSManagedObjectContext *) disposableMOC 
{
    
	NSManagedObjectContext *context = [[[NSManagedObjectContext alloc] init] autorelease];
    
	[context setPersistentStoreCoordinator:self.coordinator];
    
	return context;
    
}

-(void) setXMLData
{
    NSManagedObjectContext *context = [[[NSManagedObjectContext alloc] init] autorelease];
    [context setPersistentStoreCoordinator:self.coordinator];
  
    
    NSMutableArray *treeIndex;
    //產生用來解析ＸＭＬ的物件
    XMLParser *parser;
    
    NSData *mydata = [NSData dataWithContentsOfFile:[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"Tree_Test_Data.xml"]];
    parser = [[XMLParser alloc]initWrithData:mydata]; 
	treeIndex = [parser result];
    
    //利用回全寫入CoreData資料庫
    for (int i = 0; i < [treeIndex count]; i++) {
            //Tree *savedTree = [[[NSManagedObject alloc] initWithEntity:[NSEntityDescription entityForName:@"Tree" inManagedObjectContext:context] insertIntoManagedObjectContext:context] autorelease];
        
            //XMLList *index = [treeIndex objectAtIndex:i];
            NSLog(@" %@ ",[treeIndex objectAtIndex:i]);
            /*[savedTree setValue:index.treeID forKey:@"tree_id"];
            [savedTree setValue:index.treeKind forKey:@"tree_kind"];
            [savedTree setValue:index.treeLongitude forKey:@"longitude"];
            [savedTree setValue:index.treeLatitude forKey:@"latitude"];
            [savedTree setValue:index.treeAddress forKey:@"tree_address"];
            [savedTree setValue:index.treeManagement forKey:@"management"];
            [savedTree setValue:index.treeHight forKey:@"hight"];
            [savedTree setValue:index.treeSoutce forKey:@"source"];
            [savedTree setValue:index.treeAge forKey:@"age"];
            [savedTree setValue:index.treeShape forKey:@"shape"];
            [savedTree setValue:index.treeBust forKey:@"bust"];
            [savedTree setValue:index.treeLocation forKey:@"location"];
            [savedTree setValue:index.treeBackground forKey:@"background"];
            */
            /*NSError *savingError = nil;
            if (![context save:&savingError])
                NSLog(@"Error saving: %@", savingError);
            */
            //[index release];

        }
    
    //Round *savedRound = [[[NSManagedObject alloc]initWithEntity:[NSEntityDescription entityForName:@"Tree" inManagedObjectContext:context]  insertIntoManagedObjectContext:context]autorelease];
    
    //[savedRound setValue:[NSDate date] forKey:@"timestamp"];
    
    //NSError *savingError2 = nil;
    //if (![context save:&savingError2])
       // NSLog(@"Error saving: %@", savingError2);
}

@end
