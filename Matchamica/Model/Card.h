//
//  Card.h
//  Matchamica
//
//  Created by Daniel-Xu on 5/21/14.
//  Copyright (c) 2014 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong, nonatomic) NSString *contents;
@property (nonatomic) BOOL chosen;
@property (nonatomic) BOOL matched;
- (int)match:(NSArray *) otherCards;
@end
