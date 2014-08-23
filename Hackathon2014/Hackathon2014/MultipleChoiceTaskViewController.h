//
//  ExampleTaskViewController.h
//  Hackathon2014
//
//  Created by Yannick Hutter on 23/08/14.
//  Copyright (c) 2014 IT Crowd Club. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "TaskObservable.h"

@interface MultipleChoiceTaskViewController : UIViewController <TaskObservable>


@property (weak, nonatomic) IBOutlet UIButton *btnConfirm;
@property (strong, nonatomic) IBOutlet UISegmentedControl *Choices;


- (void) showWithTask:(Task*)task;
- (IBAction)btnConfirmAction:(id)sender;

@end
