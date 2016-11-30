//
//  ViewController.m
//  ContactsPicker
//
//  Created by Dipankar on 11/4/16.
//  Copyright © 2016 ABCoder. All rights reserved.


#import "ContactPickerView.h"

@interface ContactPickerView (){
    UILabel *contactName, *contactDetails, *contactDetailsType;
    UIButton *selectedContactBtn;
    NSMutableArray* allContactsArr;
    NSArray *sectionList;
    
    NSDictionary *allContactsDict, *boolForContactsdict;
    NSMutableDictionary *editBoolForContactsdict;
    NSArray *animalSectionTitles;
    NSArray *animalIndexTitles;
    
    //search
    NSMutableArray *searchResults;
    NSDictionary *boolForSearchdict;
    NSMutableArray *editBoolForSearchdict;
    
    NSUInteger _selectedCount;
    NSMutableArray *_listContent;
    NSMutableArray *_filteredListContent;
    
    NSMutableArray *selectedPhoneNumber;
//    BOOL isMessage;
}

@end

@implementation ContactPickerView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    allContactsArr = [NSMutableArray new];
    editBoolForSearchdict = [NSMutableArray new];
    
//    allContactsArr = [NSArray arrayWithObjects: @"ABear", @"ABlack Swan", @"ABuffalo",@"Bear", @"Black Swan", @"Buffalo",
//               @"Camel", @"Cockatoo",
//               @"Dog", @"Donkey",
//               @"Emu",
//               @"Giraffe", @"Greater Rhea",
//               @"Hippopotamus", @"Horse",
//               @"Koala",
//               @"Lion", @"Llama",@"Manatus", @"Meerkat",@"Panda", @"Peacock", @"Pig", @"Platypus", @"Polar Bear",
//               @"Rhinoceros",@"Seagull",@"Tasmania Devil",@"Whale", @"Whale Shark", @"Wombat",
//                        nil];
    
//    editBoolForSearchdict = [NSMutableArray arrayWithObjects: [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO],
//                             [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO],
//                             [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO],
//                             [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO],
//                             [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO],
//                             [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO],
//                             [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO],
//                             [NSNumber numberWithBool:NO],
//                             nil];
    
    
    
    sectionList = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", @"#", nil];
    
    allContactsDict = @{@"A" : @[@"ABear", @"ABlack Swan", @"ABuffalo"],
                @"B" : @[@"Bear", @"Black Swan", @"Buffalo"],
                @"C" : @[@"Camel", @"Cockatoo"],
                @"D" : @[@"Dog", @"Donkey"],
                @"E" : @[@"Emu"],
                @"G" : @[@"Giraffe", @"Greater Rhea"],
                @"H" : @[@"Hippopotamus", @"Horse"],
                @"K" : @[@"Koala"],
                @"L" : @[@"Lion", @"Llama"],
                @"M" : @[@"Manatus", @"Meerkat"],
                @"P" : @[@"Panda", @"Peacock", @"Pig", @"Platypus", @"Polar Bear"],
                @"R" : @[@"Rhinoceros"],
                @"S" : @[@"Seagull"],
                @"T" : @[@"Tasmania Devil"],
                @"W" : @[@"Whale", @"Whale Shark", @"Wombat"]};
    
    
    
    NSArray * allValues = [allContactsDict allValues];
    NSLog(@"%@", allValues);
//     NSLog(@"%@", [values objectAtIndex:1]);
//    NSMutableArray *array = [NSMutableArray array];
    
    for(int i=0; i<[allValues count]; i++){
//        NSLog(@"%@", [values objectAtIndex:i]);
        [allContactsArr addObjectsFromArray:[allValues objectAtIndex:i]];
    }
    NSLog(@"%@", allContactsArr);
    
    
    

    
    
    
//    boolAnimals = [NSMutableDictionary new];
    boolForContactsdict = @{@"A" : @[[NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO]],
                @"B" : @[[NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO]],
                @"C" : @[[NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO]],
                @"D" : @[[NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO]],
                @"E" : @[[NSNumber numberWithBool:NO]],
                @"G" : @[[NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO]],
                @"H" : @[[NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO]],
                @"K" : @[[NSNumber numberWithBool:NO]],
                @"L" : @[[NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO]],
                @"M" : @[[NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO]],
                @"P" : @[[NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO]],
                @"R" : @[[NSNumber numberWithBool:NO]],
                @"S" : @[[NSNumber numberWithBool:NO]],
                @"T" : @[[NSNumber numberWithBool:NO]],
                @"W" : @[[NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO]]};
    
//    boolAnimals = [booldict mutableCopy];
    
    editBoolForContactsdict = [[NSMutableDictionary alloc]initWithDictionary:boolForContactsdict];
    
    animalSectionTitles = [[allContactsDict allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    animalIndexTitles = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", @"#", nil];
    
    
    
    _selectedCount = 0;
    _listContent = [NSMutableArray new];
    _filteredListContent = [NSMutableArray new];
    selectedPhoneNumber = [NSMutableArray new];
//    _isMessage = YES;
    
    [self tapAddPhonebookBtn];
}

-(void)tapAddPhonebookBtn
{
    NSLog(@"tapAddPhonebookBtn");
    
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusDenied ||
        ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusRestricted){
        
        NSLog(@"Denied");
        UIAlertView *cantAddContactAlert = [[UIAlertView alloc] initWithTitle: @"Cannot Add Contact" message: @"You must give the app permission to add the contact first." delegate:nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
        [cantAddContactAlert show];
    } else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized){
        
        NSLog(@"Authorized");
        [self reloadAddressBook];
        //        [self getContactsWithAddressBook];
    } else {
        
        NSLog(@"Not determined");
        ABAddressBookRequestAccessWithCompletion(ABAddressBookCreateWithOptions(NULL, nil), ^(bool granted, CFErrorRef error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (!granted){
                    
                    UIAlertView *cantAddContactAlert = [[UIAlertView alloc] initWithTitle: @"Cannot Add Contact" message: @"You must give the app permission to add the contact first." delegate:nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
                    [cantAddContactAlert show];
                    return;
                }
                
                [self reloadAddressBook];
                //                [self getContactsWithAddressBook];
            });
        });
    }
}

- (void)reloadAddressBook
{
    // Create addressbook data model
    NSMutableArray *contactsTemp = [NSMutableArray array];
    ABAddressBookRef addressBooks = ABAddressBookCreateWithOptions(NULL, nil);
    
    CFArrayRef allPeople;
    CFIndex peopleCount;
    
    allPeople = ABAddressBookCopyArrayOfAllPeople(addressBooks);
    peopleCount = ABAddressBookGetPersonCount(addressBooks);
    
    
    for (NSInteger i = 0; i < peopleCount; i++)
    {
        ABRecordRef contactRecord = CFArrayGetValueAtIndex(allPeople, i);
        
        // Thanks Steph-Fongo!
        if (!contactRecord) continue;
        
        CFStringRef abName = ABRecordCopyValue(contactRecord, kABPersonFirstNameProperty);
        CFStringRef abLastName = ABRecordCopyValue(contactRecord, kABPersonLastNameProperty);
        CFStringRef abFullName = ABRecordCopyCompositeName(contactRecord);
        DDContact *contact = [[DDContact alloc] init];
        
        
        NSString *fullNameString;
        NSString *firstString = (__bridge NSString *)abName;
        NSString *lastNameString = (__bridge NSString *)abLastName;
        
        if ((__bridge id)abFullName != nil) {
            fullNameString = (__bridge NSString *)abFullName;
        } else {
            if ((__bridge id)abLastName != nil)
            {
                fullNameString = [NSString stringWithFormat:@"%@ %@", firstString, lastNameString];
            }
        }
        
        if(_isMessage){
            //For Phone number
            NSString* mobileLabel;
            ABMultiValueRef phones =(__bridge ABMultiValueRef)((__bridge NSString*)ABRecordCopyValue(contactRecord, kABPersonPhoneProperty));
            
            for(CFIndex j = 0; j < ABMultiValueGetCount(phones); j++) {
                mobileLabel = (__bridge NSString*)ABMultiValueCopyLabelAtIndex(phones, j);
                NSLog(@"%@", contact.name);
                if([mobileLabel isEqualToString:(NSString *)kABPersonPhoneMobileLabel])
                {
                    DDContact *contact = [[DDContact alloc] init];
                    contact.tel = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, j);
                    NSLog(@"%@", contact.tel);
                    
                    
                    contact.name = fullNameString;
                    contact.recordID = (int)ABRecordGetRecordID(contactRecord);
                    contact.rowSelected = NO;
                    contact.lastName = (__bridge NSString*)abLastName;
                    contact.firstName = (__bridge NSString*)abName;
                    contact.phoneNumberType = @"mobile";
                    [contactsTemp addObject:contact];
                }
                if([mobileLabel isEqualToString:(NSString *)kABHomeLabel])
                {
                    DDContact *contact = [[DDContact alloc] init];
                    contact.tel = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, j);
                    NSLog(@"%@", contact.tel);
                    
                    
                    contact.name = fullNameString;
                    contact.recordID = (int)ABRecordGetRecordID(contactRecord);
                    contact.rowSelected = NO;
                    contact.lastName = (__bridge NSString*)abLastName;
                    contact.firstName = (__bridge NSString*)abName;
                    contact.phoneNumberType = @"home";
                    [contactsTemp addObject:contact];
                }
                if([mobileLabel isEqualToString:(NSString *)kABPersonPhoneMainLabel])
                {
                    DDContact *contact = [[DDContact alloc] init];
                    contact.tel = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, j);
                    NSLog(@"%@", contact.tel);
                    
                    
                    contact.name = fullNameString;
                    contact.recordID = (int)ABRecordGetRecordID(contactRecord);
                    contact.rowSelected = NO;
                    contact.lastName = (__bridge NSString*)abLastName;
                    contact.firstName = (__bridge NSString*)abName;
                    contact.phoneNumberType = @"main";
                    [contactsTemp addObject:contact];
                }
                if([mobileLabel isEqualToString:(NSString *)kABWorkLabel])
                {
                    DDContact *contact = [[DDContact alloc] init];
                    contact.tel = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, j);
                    NSLog(@"%@", contact.tel);
                    
                    
                    contact.name = fullNameString;
                    contact.recordID = (int)ABRecordGetRecordID(contactRecord);
                    contact.rowSelected = NO;
                    contact.lastName = (__bridge NSString*)abLastName;
                    contact.firstName = (__bridge NSString*)abName;
                    contact.phoneNumberType = @"work";
                    [contactsTemp addObject:contact];
                }
                if ([mobileLabel isEqualToString:(NSString*)kABPersonPhoneIPhoneLabel])
                {
                    DDContact *contact = [[DDContact alloc] init];
                    contact.tel = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, j);
                    NSLog(@"%@", contact.tel);
                    
                    
                    contact.name = fullNameString;
                    contact.recordID = (int)ABRecordGetRecordID(contactRecord);
                    contact.rowSelected = NO;
                    contact.lastName = (__bridge NSString*)abLastName;
                    contact.firstName = (__bridge NSString*)abName;
                    contact.phoneNumberType = @"iPhone";
                    [contactsTemp addObject:contact];
                }
            }
        } else {
            NSString* emailAddress;
            ABMultiValueRef emails =(__bridge ABMultiValueRef)((__bridge NSString*)ABRecordCopyValue(contactRecord, kABPersonEmailProperty));
            
            for(CFIndex j = 0; j < ABMultiValueGetCount(emails); j++) {
                emailAddress = (__bridge NSString*)ABMultiValueCopyLabelAtIndex(emails, j);
//                NSLog(@"%@", contact.name);
                if([emailAddress isEqualToString:(NSString *)kABPersonPhoneMobileLabel])
                {
                    DDContact *contact = [[DDContact alloc] init];
                    contact.email = (__bridge NSString*)ABMultiValueCopyValueAtIndex(emails, j);
                    NSLog(@"%@", contact.email);
                    
                    
                    contact.name = fullNameString;
                    contact.recordID = (int)ABRecordGetRecordID(contactRecord);
                    contact.rowSelected = NO;
                    contact.lastName = (__bridge NSString*)abLastName;
                    contact.firstName = (__bridge NSString*)abName;
                    contact.phoneNumberType = @"mobile";
                    [contactsTemp addObject:contact];
                }
                if([emailAddress isEqualToString:(NSString *)kABHomeLabel])
                {
                    DDContact *contact = [[DDContact alloc] init];
                    contact.email = (__bridge NSString*)ABMultiValueCopyValueAtIndex(emails, j);
                    NSLog(@"%@", contact.email);
                    
                    
                    contact.name = fullNameString;
                    contact.recordID = (int)ABRecordGetRecordID(contactRecord);
                    contact.rowSelected = NO;
                    contact.lastName = (__bridge NSString*)abLastName;
                    contact.firstName = (__bridge NSString*)abName;
                    contact.phoneNumberType = @"home";
                    [contactsTemp addObject:contact];
                }
                if([emailAddress isEqualToString:(NSString *)kABWorkLabel])
                {
                    DDContact *contact = [[DDContact alloc] init];
                    contact.email = (__bridge NSString*)ABMultiValueCopyValueAtIndex(emails, j);
                    NSLog(@"%@", contact.email);
                    
                    
                    contact.name = fullNameString;
                    contact.recordID = (int)ABRecordGetRecordID(contactRecord);
                    contact.rowSelected = NO;
                    contact.lastName = (__bridge NSString*)abLastName;
                    contact.firstName = (__bridge NSString*)abName;
                    contact.phoneNumberType = @"work";
                    [contactsTemp addObject:contact];
                }
            }
        }
        
        
        //        [contactsTemp addObject:contact];
        
        //        NSLog(@"%@", contact);
        
        //                [contact release];
        
        if (abName) CFRelease(abName);
        if (abLastName) CFRelease(abLastName);
        if (abFullName) CFRelease(abFullName);
    }
    //    NSLog(@"%@", contactsTemp);
    
    if (allPeople) CFRelease(allPeople);
    
    // Sort data
    UILocalizedIndexedCollation *theCollation = [UILocalizedIndexedCollation currentCollation];
    
    
    SEL sorter = ABPersonGetSortOrdering() == kABPersonSortByFirstName ? NSSelectorFromString(@"sorterFirstName") : NSSelectorFromString(@"sorterLastName");
    
    for (DDContact *contact in contactsTemp) {
        NSInteger sect = [theCollation sectionForObject:contact
                                collationStringSelector:sorter];
        contact.sectionNumber = sect;
        
        NSLog(@"%@", contact.name);
    }
    
    NSInteger highSection = [[theCollation sectionTitles] count];
    NSMutableArray *sectionArrays = [NSMutableArray arrayWithCapacity:highSection];
    for (int i=0; i<=highSection; i++) {
        NSMutableArray *sectionArray = [NSMutableArray arrayWithCapacity:1];
        [sectionArrays addObject:sectionArray];
    }
    
    NSLog(@"%@", sectionArrays);
    
    
    for (DDContact *contact in contactsTemp) {
        [(NSMutableArray *)[sectionArrays objectAtIndex:contact.sectionNumber] addObject:contact];
    }
    
    for (NSMutableArray *sectionArray in sectionArrays) {
        NSArray *sortedSection = [theCollation sortedArrayFromArray:sectionArray collationStringSelector:sorter];
        [_listContent addObject:sortedSection];
    }
    
    NSLog(@"%@", _listContent);
    
    [self.contactListTableview reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableViewDataSource & UITableViewDelegate

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return nil;
    } else {
        //        return [[NSArray arrayWithObject:UITableViewIndexSearch] arrayByAddingObjectsFromArray:
        //                [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles]];
        
        return @[@" ",@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", @"#"];
    }
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return 0;
    } else {
        if (title == UITableViewIndexSearch) {
            [tableView scrollRectToVisible:self.searchDisplayController.searchBar.frame animated:NO];
            return -1;
        } else {
            return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index-1];
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return 1;
    } else {
        return [_listContent count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return nil;
    } else {
        return [[_listContent objectAtIndex:section] count] ? [[[UILocalizedIndexedCollation currentCollation] sectionTitles] objectAtIndex:section] : nil;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *v = (UITableViewHeaderFooterView *)view;
    v.backgroundView.backgroundColor = [UIColor lightGrayColor];
}

//- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
//    [headerView setBackgroundColor:[UIColor lightGrayColor]];
    
    /*if (section == integerRepresentingYourSectionOfInterest)
        [headerView setBackgroundColor:[UIColor redColor]];
    else
        [headerView setBackgroundColor:[UIColor clearColor]];*/
//    return headerView;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    //    return  70;
    if (tableView == self.searchDisplayController.searchResultsTableView)
        return 0;
    
    return [[_listContent objectAtIndex:section] count] ? tableView.sectionHeaderHeight : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [_filteredListContent count];
    } else {
        return [[_listContent objectAtIndex:section] count];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    // This will create a "invisible" footer
    return 0.01f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kCustomCellID = @"ContactCell";
    UITableViewCell *cell = [_contactListTableview dequeueReusableCellWithIdentifier:kCustomCellID];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:kCustomCellID];
    }
    
    // Configure the cell...
    contactName = (UILabel*)[cell viewWithTag:71];
    contactDetails = (UILabel*)[cell viewWithTag:72];
    contactDetailsType = (UILabel*)[cell viewWithTag:73];
    selectedContactBtn = (UIButton*)[cell viewWithTag:74];
    
    DDContact *contact = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView)
        contact = (DDContact *)[_filteredListContent objectAtIndex:indexPath.row];
    else
        contact = (DDContact *)[[_listContent objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    if ([[contact.name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] > 0) {
        contactName.text = contact.name;
        
    } else {
        cell.textLabel.font = [UIFont italicSystemFontOfSize:cell.textLabel.font.pointSize];
        contactName.text = @"No Name";
    }
    
    //    NSLog(@"%lu", (unsigned long)_listContent.count);
    
    if(_isMessage){
        contactDetails.text= contact.tel;
    } else {
        contactDetails.text= contact.email;
    }
    
    contactDetailsType.text = contact.phoneNumberType;
    
    [selectedContactBtn setBackgroundImage:[UIImage imageNamed:@"uncheckBox.png"] forState:UIControlStateNormal];
    [selectedContactBtn setBackgroundImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateSelected];
    [selectedContactBtn addTarget:self action:@selector(checkButtonTapped:event:) forControlEvents:UIControlEventTouchUpInside];
    [selectedContactBtn setSelected:contact.rowSelected];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        [self tableView:self.searchDisplayController.searchResultsTableView accessoryButtonTappedForRowWithIndexPath:indexPath];
        [self.searchDisplayController.searchResultsTableView deselectRowAtIndexPath:indexPath animated:YES];
        
        // Delay execution of my block for 10 seconds.
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [self.searchDisplayController setActive:NO animated:YES];
            [self.contactListTableview reloadData];
        });
    }
    else {
        [self tableView:self.contactListTableview accessoryButtonTappedForRowWithIndexPath:indexPath];
      
        NSArray* rowsToReload = [NSArray arrayWithObjects:indexPath, nil];
        [self.contactListTableview reloadRowsAtIndexPaths:rowsToReload withRowAnimation:UITableViewRowAnimationAutomatic];
//
        [self.contactListTableview deselectRowAtIndexPath:indexPath animated:YES];
        
        //use this to disable jumping of row
        
//        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//        selectedContactBtn = (UIButton*)[cell viewWithTag:74];
//        selectedContactBtn.selected = YES;
    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    DDContact *contact = nil;
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
        contact = (DDContact*)[_filteredListContent objectAtIndex:indexPath.row];
    else
        contact = (DDContact*)[[_listContent objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    BOOL checked = !contact.rowSelected;
    contact.rowSelected = checked;
    
    // Enabled invite button
    NSString *contactInfo = @"";
    if(_isMessage){
        contactInfo = contact.tel;
    } else {
        contactInfo = contact.email;
    }
    
    if (checked){
        if (![selectedPhoneNumber containsObject: contactInfo]) {
            [selectedPhoneNumber addObject:contactInfo];
        }
        
    } else {
        if ([selectedPhoneNumber containsObject: contactInfo]) {
            [selectedPhoneNumber removeObject:contactInfo];
        }
    }
    
    
    UITableViewCell *cell =[self.contactListTableview cellForRowAtIndexPath:indexPath];
    UIButton *button = (UIButton *)cell.accessoryView;
    [button setSelected:checked];
    
    //reload done button with selected contact number
    [self updateDoneBtn];
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        [self.searchDisplayController.searchResultsTableView reloadData];
    }
}

- (void)checkButtonTapped:(id)sender event:(id)event
{
    NSIndexPath *indexPath;
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:self.contactListTableview];
    
    if (self.searchDisplayController.active) {
        indexPath = [self.searchDisplayController.searchResultsTableView indexPathForRowAtPoint: currentTouchPosition];
        
        if (indexPath != nil)
        {
            [self tableView:self.searchDisplayController.searchResultsTableView accessoryButtonTappedForRowWithIndexPath:indexPath];
        }
    }
    else {
        indexPath = [self.contactListTableview indexPathForRowAtPoint: currentTouchPosition];
        
        if (indexPath != nil)
        {
            [self tableView:self.contactListTableview accessoryButtonTappedForRowWithIndexPath:indexPath];
        }
    }
    
    
    NSArray* rowsToReload = [NSArray arrayWithObjects:indexPath, nil];
    [self.contactListTableview reloadRowsAtIndexPaths:rowsToReload withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark -
#pragma mark UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)_searchBar
{
    [self.searchDisplayController.searchBar setShowsCancelButton:NO];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)_searchBar
{
    [self.searchDisplayController setActive:NO animated:YES];
    [self.contactListTableview reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)_searchBar
{
    [self.searchDisplayController setActive:NO animated:YES];
    [self.contactListTableview reloadData];
}

#pragma mark -
#pragma mark ContentFiltering

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    [_filteredListContent removeAllObjects];
    for (NSArray *section in _listContent) {
        for (DDContact *contact in section)
        {
            NSComparisonResult result = [contact.name compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
            if (result == NSOrderedSame)
            {
                [_filteredListContent addObject:contact];
            }
        }
    }
    
    NSLog(@"%@", _filteredListContent);
}

#pragma mark -
#pragma mark UISearchDisplayControllerDelegate

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text] scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    
    return YES;
}


- (IBAction)tapCancelBtn:(id)sender {
    if ([self.delegate respondsToSelector:@selector(ContactPickerControllerDidCancel:)]) {
        [self.delegate ContactPickerControllerDidCancel:YES];
//        [self dismissViewControllerAnimated:YES completion:nil];
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
    else
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tapDoneBtn:(id)sender {
//    NSLog(@"phone number: %@", selectedPhoneNumber);
    if ([self.delegate respondsToSelector:@selector(ContactPickerControllerDidFinish:)])
        [self.delegate ContactPickerControllerDidFinish:selectedPhoneNumber];
}

-(void)updateDoneBtn {
    NSString *btnTitleTxt = @"Done";
    if([selectedPhoneNumber count] > 0){
        if([selectedPhoneNumber count] ==1){
            btnTitleTxt = [NSString stringWithFormat:@"Send %lu invite",(unsigned long)[selectedPhoneNumber count]];
        } else {
            btnTitleTxt = [NSString stringWithFormat:@"Send %lu invites",(unsigned long)[selectedPhoneNumber count]];
        }
        
    } else {
        btnTitleTxt = @"Done";
    }
    
    [_doneBtn setTitle:btnTitleTxt forState:UIControlStateNormal];
}

@end
