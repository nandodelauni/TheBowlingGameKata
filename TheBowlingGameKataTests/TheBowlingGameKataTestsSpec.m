//
//  TheBowlingGameKataTestsSpec.m
//  TheBowlingGameKata
//
//  Created by Miguel Ferrando Navalón on 13/05/14.
//  Copyright (c) 2014 Miguel Ferrando. All rights reserved.
//

#import <Kiwi.h>

SPEC_BEGIN(TheBowlingGameKataTestsSpec)

describe(@"Math", ^{
    it(@"is pretty cool", ^{
        NSUInteger a = 16;
        NSUInteger b = 26;
        [[theValue(a + b) should] equal:theValue(42)];
    });
});

SPEC_END