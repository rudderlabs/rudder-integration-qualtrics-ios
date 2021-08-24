//
//  RudderQualtricsIntegration.h
//  FBSnapshotTestCase
//
//  Created by Abhishek Pandey on 15/11/19.
//

#import <Foundation/Foundation.h>
#import <Rudder/Rudder.h>



NS_ASSUME_NONNULL_BEGIN

@interface RudderQualtricsIntegration : NSObject<RSIntegration>


- (instancetype)initWithConfig:(NSDictionary *)config withAnalytics:(RSClient *)client;

@end

NS_ASSUME_NONNULL_END
