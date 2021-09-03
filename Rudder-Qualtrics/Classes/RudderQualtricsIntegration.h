//  RudderQualtricsIntegration.h
//  Pods-Rudder-Qualtrics
//
//  Created by Abhishek Pandey on 15/11/19.
//  Copyright (c) 2021 Abhishek Pandey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Rudder/Rudder.h>



NS_ASSUME_NONNULL_BEGIN

@interface RudderQualtricsIntegration : NSObject<RSIntegration>

@property (nonatomic) NSString *brandId;
@property (nonatomic) NSString *projectId;

- (instancetype)initWithConfig:(NSDictionary *)config withAnalytics:(RSClient *)client;

@end

NS_ASSUME_NONNULL_END
