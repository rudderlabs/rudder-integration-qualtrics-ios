//  RudderQualtricsIntegration.m
//  Pods-Rudder-Qualtrics
//
//  Created by Abhishek Pandey on 15/11/19.
//  Copyright (c) 2021 Abhishek Pandey. All rights reserved.
//

#import "RudderQualtricsIntegration.h"
@import Qualtrics;

@implementation RudderQualtricsIntegration

- (instancetype)initWithConfig:(NSDictionary *)config withAnalytics:(RSClient *)client {
    self = [super init];
    if (self)
    {
        [RSLogger logDebug:@"Initializing Qualtrics Factory"];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (config == nil)
            {
                [RSLogger logError:@"Failed to Initialize Qualtrics Factory as Config is null"];
                return;
            }
            if (![config objectForKey:@"brandId"] || ![config objectForKey:@"projectId"]) {
                [RSLogger logError:@"Invalid Qualtrics Account Credentials, Aborting"];
                return;
            }
            self.qualtrics  = Qualtrics.shared;
            self.brandId = [config objectForKey:@"brandId"];
            self.projectId = [config objectForKey:@"projectId"];
            [self.qualtrics initializeProjectWithBrandId:self.brandId projectId:self.projectId completion:nil];
        });
    }
    return self;
}

- (void) processRudderEvent: (nonnull RSMessage *) message {
    NSString *type = message.type;
        if ([type isEqualToString:@"identify"])
        {
            NSMutableDictionary<NSString*, NSObject*>* traits = [message.context.traits mutableCopy];
            for (NSString *key in traits) {
                [self.qualtrics.properties setStringWithString:[NSString stringWithFormat:@"%@", traits[key]]  for:key];
            }
        }
        else
        {
            [RSLogger logDebug:@"Qualtrics Integration: Message type not supported"];
        }
}


- (void)dump:(nonnull RSMessage *)message {
    @try
    {
        if (message != nil)
        {
            dispatch_async(dispatch_get_main_queue(),^{
                [self processRudderEvent:message];
            });
        }
    }
    @catch (NSException *ex)
    {
        [RSLogger logError:[[NSString alloc] initWithFormat:@"%@", ex]];
    }
}

- (void)reset {
    [RSLogger logDebug:@"Qualtrics Factory doesn't support Reset Call"];
}
@end
