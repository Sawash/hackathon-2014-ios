//
//  TaskViewController.h
//  Hackathon2014
//
//  Created by Yannick Hutter on 22/08/14.
//  Copyright (c) 2014 IT Crowd Club. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskObserver.h"

@interface RootTaskViewController : UIViewController <TaskObserver>
{
    
}

@property (weak, nonatomic) IBOutlet UIImageView * TaskHeaderImage;
@property (weak, nonatomic) IBOutlet UILabel * TaskQuestion;
@property (weak, nonatomic) IBOutlet UIView *TaskContent;


-(void) showWithCurrentTaskNumber;



@end
