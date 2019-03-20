//
//  ViewController.m
//  Lesson5
//
//  Created by ilya on 18.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (strong, nonatomic) Person *person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person = [Person new];
    [self.person setValue:@"First name" forKey:@"firstName"];
    [self.person setValue:@"Last name" forKey:@"lastName"];
    [self.person setValue:@1 forKey:@"age"];
    
    Person *mom = [[Person alloc] init];
    Person *dad = [Person new];
    mom.firstName = @"The";
    mom.lastName = @"Mother";
    dad.firstName = @"The";
    dad.lastName = @"Father";
    
    self.person.mother = mom;
    self.person.father = dad;

    [self.person setValue:@"DA" forKeyPath:@"father.firstName"];
    
    
    [self.person addObserver:self
                  forKeyPath:@"father.firstName"
                     options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
                     context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@ %@ %@", keyPath, object, change);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];    
}

- (IBAction)saveClicked:(id *)sender {
    self.person.father.firstName = self.firstNameTextField.text;
    self.person.father.lastName = self.lastNameTextField.text;
}

@end
