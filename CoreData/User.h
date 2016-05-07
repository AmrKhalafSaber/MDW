//
//  User.h
//  MDW
//
//  Created by JETS on 4/18/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Mobiles, Phones;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * cityName;
@property (nonatomic, retain) NSString * code;
@property (nonatomic, retain) NSString * companyName;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSNumber * iD;
@property (nonatomic, retain) NSData * imageUrl;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * middleName;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * country_name;
@property (nonatomic, retain) NSNumber * gender;
@property (nonatomic, retain) NSDate * birth_date;
@property (nonatomic, retain) NSSet *hasMobile;
@property (nonatomic, retain) NSSet *hasPhone;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addHasMobileObject:(Mobiles *)value;
- (void)removeHasMobileObject:(Mobiles *)value;
- (void)addHasMobile:(NSSet *)values;
- (void)removeHasMobile:(NSSet *)values;

- (void)addHasPhoneObject:(Phones *)value;
- (void)removeHasPhoneObject:(Phones *)value;
- (void)addHasPhone:(NSSet *)values;
- (void)removeHasPhone:(NSSet *)values;

@end
