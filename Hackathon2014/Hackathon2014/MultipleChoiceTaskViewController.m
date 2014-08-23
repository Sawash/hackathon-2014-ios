//
//  ExampleTaskViewController.m
//  Hackathon2014
//
//  Created by Yannick Hutter on 23/08/14.
//  Copyright (c) 2014 IT Crowd Club. All rights reserved.
//

#import "MultipleChoiceTaskViewController.h"
#import "RootTaskViewController.h"


@interface MultipleChoiceTaskViewController ()

@end

@implementation MultipleChoiceTaskViewController {
    Task* _currentTask;
    NSMutableArray* _taskObservers;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) SubscribeTaskObserver:(id)observer

{
    
    if (_taskObservers == nil) {
        _taskObservers = [[NSMutableArray alloc] init];
    }
    
    if (![_taskObservers containsObject:observer]) {
        [_taskObservers addObject:observer];
    }
}

- (void) UnsubscribeTaskObserver:(id)observer
{
    if ([_taskObservers containsObject:observer]) {
        [_taskObservers removeObject:observer];
    }
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void) showWithTask:(Task *)task
{
    _currentTask = task;
    
    [self.Choices removeAllSegments];
    
    self.Choices = [self.Choices initWithItems:_currentTask.Choices];
}

- (IBAction)btnConfirmAction:(id)sender {
    
    
    if ([self isAnswerValid]) {
        for (id observer in _taskObservers) {
            [observer taskIsCompleted:_currentTask];
        }
    }
    else {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Falsch" message:@"Falsche Antwort" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
}

-(BOOL) isAnswerValid
{
    
    NSNumber* selectedSolution = [[NSNumber alloc] initWithInteger:self.Choices.selectedSegmentIndex];
    
    if ([selectedSolution isEqualToNumber:_currentTask.SolutionIndex]) {
        return YES;
    }
    
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
