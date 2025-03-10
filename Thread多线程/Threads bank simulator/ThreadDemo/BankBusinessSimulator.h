//
//  BankBusinessSimulator.h
//  ThreadDemo
//
//  Created by  on 12-8-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BankBusinessSimulatorDelegate.h"

@interface BankBusinessSimulator : NSObject{
    //id<BankBusinessSimulatorDelegate> delegate;
    NSMutableArray *customersQueue;
    NSMutableArray *threads;    
    int state;//0表示初始状态，1工作中，2结束
    NSCondition *condition;
}

@property (nonatomic,retain) id<BankBusinessSimulatorDelegate> delegate;

@property (nonatomic,readonly) int state;

- (void) enqueueCustomer:(NSString *) customer;

- (NSString *) dequeueCustomer;

- (void) start;

- (void) stop;

@end
