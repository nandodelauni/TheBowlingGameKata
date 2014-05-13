//
//  TheBowlingGameKataTestsSpec.m
//  TheBowlingGameKata
//
//  Created by Miguel Ferrando Navalón on 13/05/14.
//  Copyright (c) 2014 Miguel Ferrando. All rights reserved.
//

#import <Kiwi.h>
#import "MFNGame.h"

SPEC_BEGIN(TheBowlingGameKataTestsSpec)

void (^rollMany)(int n, NSNumber *pins, MFNGame *game) = ^(int n, NSNumber *pins, MFNGame *game) {
    for (int i = 0; i < n; i++) {
        [game roll:pins];
    }
};

void (^rollSpare)(MFNGame *game) = ^(MFNGame *game) {
    [game roll:@5];
    [game roll:@5];
};

void (^rollStrike)(MFNGame *game) = ^(MFNGame *game) {
    [game roll:@10];
};

describe(@"Game", ^{
    
    __block MFNGame *game = nil;
    beforeEach(^{
        game = [MFNGame new];
    });
    
    context(@"when empty", ^{
        
        it(@"score should be zero", ^{
            rollMany(20, @0, game);
            [[game.score should] beZero];
        });
    });
    
    context(@"when all rolls are one", ^{
        
        it(@"score should be 20", ^{
            rollMany(20, @1, game);
            [[game.score should] equal:@20];
        });
    });
    
    context(@"when there is one spare and the next roll is 3", ^{
        it(@"score should be 16", ^{
            rollSpare(game);
            [game roll:@3];
            rollMany(17, @0, game);
            [[game.score should] equal:@16];
        });
    });
    
    context(@"when there is one strike and next rolls are 3 and 4", ^{
        it(@"score should be 24", ^{
            rollStrike(game);
            [game roll:@3];
            [game roll:@4];
            rollMany(16, @0, game);
            [[game.score should] equal:@24];
        });
    });
    
    context(@"when there is a perfect game", ^{
        it(@"score should be 300", ^{
            rollMany(12, @10, game);
            [[game.score should] equal:@300];
        });
    });
});

SPEC_END