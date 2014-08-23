//
//  Task.m
//  Hackathon2014
//
//  Created by Yannick Hutter on 23/08/14.
//  Copyright (c) 2014 IT Crowd Club. All rights reserved.
//

#import "Task.h"

@implementation Task
{
    NSString* _solution;
}

-(id) initWithImagePathNamed:(NSString *)imagePath AndQuestion:(NSString *)question ForChoices:(NSArray*) choices WithSolutionIndex:(NSNumber*)solutionIndex {
  
    self = [super init];
    
    if (self) {
        self.ImagePath = imagePath;
        self.Question = question;
        self.Choices = choices;
        self.SolutionIndex = solutionIndex;
        self.IsCompleted = NO;
    }
    
    return self;
}

-(id) initWithPlistNamed:(NSString *) plistName AndIndex:(NSNumber*) index
{
    self = [super init];
    
    if (self) {
        
        
        NSString* plistPath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
        NSArray* root = [[NSArray alloc] initWithContentsOfFile:plistPath];
        NSArray* tasks = (NSArray*) [root objectAtIndex:1];
        
        NSDictionary* currentTaskInformation = (NSDictionary*) [tasks objectAtIndex:[index integerValue]];
        
        self.Choices = (NSArray*)[currentTaskInformation objectForKey:@"choices"];
        
        self.ImagePath = [currentTaskInformation objectForKey:@"image"];
        
        self.Question = [currentTaskInformation objectForKey:@"question"];
        
        self.SolutionIndex = [currentTaskInformation objectForKey:@"solutionIndex"];
        
    }
    
    return self;
}


@end
