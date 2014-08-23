//
//  TaskViewController.m
//  Hackathon2014
//
//  Created by Yannick Hutter on 22/08/14.
//  Copyright (c) 2014 IT Crowd Club. All rights reserved.
//

#import "RootTaskViewController.h"

#import "MultipleChoiceTaskViewController.h"

@interface RootTaskViewController ()

@end

@implementation RootTaskViewController {
    NSNumber* _currentTaskNumber;
    MultipleChoiceTaskViewController* _multipleChoiceTaskViewController;
    NSArray *tasks;
    Task* _currentTask;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

-(void) showWithCurrentTaskNumber
{
    NSNumber* currentTaskNumber = [[NSUserDefaults standardUserDefaults] valueForKey:@"currentTask"];
    
    _currentTask = [[Task alloc] initWithPlistNamed:@"data" AndIndex:currentTaskNumber];
    
    self.TaskQuestion.text = _currentTask.Question;
    
    
//    self.TaskHeaderImage.image = [UIImage imageWithContentsOfFile:taskHeaderImagePath];
    self.TaskHeaderImage.image = [UIImage imageNamed:@"imageHeader"];
    
    [self.TaskContent addSubview:_multipleChoiceTaskViewController.view];
    
    //if ([currentTaskNumber isEqualToNumber:@0] || [currentTaskNumber isEqualToNumber:@1] || [currentTaskNumber isEqualToNumber:@3]) {
        [_multipleChoiceTaskViewController showWithTask:_currentTask];
        
    //}
    
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    NSArray* root = [[NSArray alloc] initWithContentsOfFile:plistPath];
    tasks = (NSArray*) [root objectAtIndex:1];
    
    
    // Do any additional setup after loading the view
    _multipleChoiceTaskViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"identifier"];
    [_multipleChoiceTaskViewController SubscribeTaskObserver:self];
    [self showWithCurrentTaskNumber];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) taskIsCompleted:(Task *)completedTask
{
    NSInteger currentTaskNumber = [[[NSUserDefaults standardUserDefaults] objectForKey:@"currentTask"] integerValue];
    
    //[self showWithCurrentTaskNumber];
    if (tasks.count -1 == currentTaskNumber) {
        [self performSegueWithIdentifier:@"segueHighscore" sender:self];
    } else {
        currentTaskNumber++;
        [[NSUserDefaults standardUserDefaults] setInteger:currentTaskNumber forKey:@"currentTask"];
        [self performSegueWithIdentifier:@"segueLocation" sender:self];

    }

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
