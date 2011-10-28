//
//  Round.h
//  XMLUse
//
//  Created by App on 2011/10/25.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Tree;

@interface Round : NSManagedObject

@property (nonatomic, retain) NSDate * timestamp;
@property (nonatomic, retain) NSSet *trees;
@end

@interface Round (CoreDataGeneratedAccessors)

- (void)addTreesObject:(Tree *)value;
- (void)removeTreesObject:(Tree *)value;
- (void)addTrees:(NSSet *)values;
- (void)removeTrees:(NSSet *)values;
@end
