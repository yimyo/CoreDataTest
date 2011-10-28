//
//  Tree.h
//  XMLUse
//
//  Created by App on 2011/10/25.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Round;

@interface Tree : NSManagedObject

@property (nonatomic, retain) NSString * tree_kind;
@property (nonatomic, retain) NSString * shape;
@property (nonatomic, retain) NSString * age;
@property (nonatomic, retain) NSString * longitude;
@property (nonatomic, retain) NSString * management;
@property (nonatomic, retain) NSString * tree_id;
@property (nonatomic, retain) NSString * latitude;
@property (nonatomic, retain) NSString * background;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * tree_address;
@property (nonatomic, retain) NSString * bust;
@property (nonatomic, retain) NSString * source;
@property (nonatomic, retain) NSString * hight;
@property (nonatomic, retain) NSSet *rounds;
@end

@interface Tree (CoreDataGeneratedAccessors)

- (void)addRoundsObject:(Round *)value;
- (void)removeRoundsObject:(Round *)value;
- (void)addRounds:(NSSet *)values;
- (void)removeRounds:(NSSet *)values;
@end
