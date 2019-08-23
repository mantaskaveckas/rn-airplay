//
//  RNAirplayBridge.m
//  RNAirplay
//
//  Created by Mantas Kaveckas on 23/08/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE(RNAirplay, RCTEventEmitter)

RCT_EXTERN_METHOD(endScan)
RCT_EXTERN_METHOD(startScan)

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}
@end
