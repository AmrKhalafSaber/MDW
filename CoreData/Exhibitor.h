//
//  Exhibitor.h
//  MDW
//
//  Created by JETS on 4/18/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Mobiles, Phones;

@interface Exhibitor : NSManagedObject

@property (nonatomic, retain) NSString * cityName;
@property (nonatomic, retain) NSString * companyAbout;
@property (nonatomic, retain) NSString * companyAddress;
@property (nonatomic, retain) NSString * companyName;
@property (nonatomic, retain) NSString * companyUrl;
@property (nonatomic, retain) NSString * contactName;
@property (nonatomic, retain) NSString * contactTitle;
@property (nonatomic, retain) NSString * countryName;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * fax;
@property (nonatomic, retain) NSNumber * iD;
@property (nonatomic, retain) NSData * imageUrl;
@property (nonatomic, retain) NSSet *hasMobile;
@property (nonatomic, retain) NSSet *hasPhone;
@end

@interface Exhibitor (CoreDataGeneratedAccessors)

- (void)addHasMobileObject:(Mobiles *)value;
- (void)removeHasMobileObject:(Mobiles *)value;
- (void)addHasMobile:(NSSet *)values;
- (void)removeHasMobile:(NSSet *)values;

- (void)addHasPhoneObject:(Phones *)value;
- (void)removeHasPhoneObject:(Phones *)value;
- (void)addHasPhone:(NSSet *)values;
- (void)removeHasPhone:(NSSet *)values;

@end
