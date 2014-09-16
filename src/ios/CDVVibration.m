/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

#import "CDVVibration.h"

@implementation CDVVibration

- (void)vibrate:(CDVInvokedUrlCommand*)command
{
    //AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    NSMutableArray* arr = [NSMutableArray array ];
    int vibracao = [[command.arguments objectAtIndex:0] intValue];
    
    [arr addObject:[NSNumber numberWithBool:YES]];
    [arr addObject:[NSNumber numberWithInt:vibracao]];
    
    [dict setObject:arr forKey:@"VibePattern"];
    [dict setObject:[NSNumber numberWithInt:1] forKey:@"Intensity"];
    
    
    AudioServicesPlaySystemSoundWithVibration(4095,nil,dict);
}

- (void)vibrateArr:(CDVInvokedUrlCommand*)command
{
    //AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    NSMutableArray* arr = [NSMutableArray array ];
    NSMutableArray* vibracoes = [command.arguments objectAtIndex:0];
    int i;
    
    for (i = 0; i < [vibracoes count]; i++) {
        if(i % 2 == 0)
            [arr addObject:[NSNumber numberWithBool:YES]];
        else
            [arr addObject:[NSNumber numberWithBool:NO]];
        [arr addObject:[NSNumber numberWithInt:[[vibracoes objectAtIndex: i] intValue]]];
    }
    
    [dict setObject:arr forKey:@"VibePattern"];
    [dict setObject:[NSNumber numberWithInt:1] forKey:@"Intensity"];
    
    
    AudioServicesPlaySystemSoundWithVibration(4095,nil,dict);
}

- (void)cancel:(CDVInvokedUrlCommand*)command
{
    AudioServicesStopSystemSound(4095);
    //AudioServicesRemoveSystemSoundCompletion(<#SystemSoundID inSystemSoundID#>)
}


@end