//
//  RudderQualtricsFactory.h
//  FBSnapshotTestCase
//
//  Created by Abhishek Pandey on 15/11/19.
//

#import <Foundation/Foundation.h>
#import <Rudder/Rudder.h>

NS_ASSUME_NONNULL_BEGIN

@interface RudderQualtricsFactory : NSObject<RSIntegrationFactory>

+ (instancetype) instance;

@end

NS_ASSUME_NONNULL_END
