//
//  ViewController.h
//  ContactsPicker
//
//  Created by Dipankar on 11/4/16.
//  Copyright © 2016 ABCoder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import "DDContact.h"

@protocol ContactPickerDelegate <NSObject>
@required
- (void)ContactPickerControllerDidFinish: (NSArray*)contacts;
- (void)ContactPickerControllerDidCancel:(BOOL)picker;
@end

@interface ContactPickerView : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate>

@property (nonatomic, retain) id<ContactPickerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITableView *contactListTableview;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property BOOL isMessage;



@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *doneBtn;
- (IBAction)tapCancelBtn:(id)sender;
- (IBAction)tapDoneBtn:(id)sender;

@end

