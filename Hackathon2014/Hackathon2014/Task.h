//
//  Task.h
//  Hackathon2014
//
//  Created by Yannick Hutter on 23/08/14.
//  Copyright (c) 2014 IT Crowd Club. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (strong, nonatomic) NSString* ImagePath;
@property (strong, nonatomic) NSString* Question;
@property (strong, nonatomic) NSArray* Choices;
@property (strong, nonatomic) NSNumber* SolutionIndex;
@property (assign, nonatomic) BOOL IsCompleted;

-(id) initWithPlistNamed:(NSString *) plistName AndIndex:(NSNumber*) index;

-(id) initWithImagePathNamed:(NSString *)imagePath AndQuestion:(NSString *)question ForChoices:(NSArray*) choices WithSolutionIndex:(NSNumber*)solutionIndex;


@end
