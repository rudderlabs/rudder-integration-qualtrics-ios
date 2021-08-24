//
//  RudderQualtricsFactory.m
//  FBSnapshotTestCase
//
//  Created by Abhishek Pandey on 15/11/19.
//

#import "RudderQualtricsFactory.h"
#import "RudderQualtricsIntegration.h"

@implementation RudderQualtricsFactory

+ (instancetype)instance {
    static RudderQualtricsFactory *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    return self;
}

- (nonnull NSString *)key {
    return @"Qualtrics";
}

- (nonnull id<RSIntegration>)initiate:(nonnull NSDictionary *)config client:(nonnull RSClient *)client rudderConfig:(nonnull RSConfig *)rudderConfig {
    return [[RudderQualtricsIntegration alloc] initWithConfig:config withAnalytics:client];
}


@end
