//
//  MFNGame.m
//  TheBowlingGameKata
//
//  Created by Miguel Ferrando Navalón on 13/05/14.
//  Copyright (c) 2014 Miguel Ferrando. All rights reserved.
//

#import "MFNGame.h"

NSUInteger const kRollMax = 21;

@interface MFNGame ()

@property (nonatomic, strong) NSMutableArray *rolls;
@property (nonatomic) NSInteger currentRoll;

@end

@implementation MFNGame

- (NSMutableArray *)rolls
{
    if (!_rolls) {
        _rolls = [NSMutableArray array];
        for (int i = 0; i < kRollMax; i++) {
            _rolls[i] = @0;
        }
    }
    
    return _rolls;
}

- (NSNumber *)score
{
    NSUInteger score = 0;
    int frameIndex = 0;
    for (int frame = 0; frame < 10; frame++) {
        if ([self isStrike:frameIndex]) {
            score += 10 + [self strikeBonus:frameIndex];
            frameIndex++;
        }
        else if ([self isSpare:frameIndex]) {
            score += 10 + [self spareBonus:frameIndex];
            frameIndex += 2;
        }
        else {
            score += [self sumOfBallsInFrame:frameIndex];
            frameIndex += 2;
        }
    }
    
    return @(score);
}

- (void)roll:(NSNumber *)pins
{
    self.rolls[self.currentRoll++] = pins;
}

- (BOOL)isStrike:(NSInteger)frameIndex
{
    return [self.rolls[frameIndex] integerValue] == 10;
}

- (BOOL)isSpare:(NSInteger)frameIndex
{
    return [self.rolls[frameIndex] integerValue] + [self.rolls[frameIndex + 1] integerValue] == 10;
}

- (NSInteger)sumOfBallsInFrame:(NSInteger)frameIndex
{
    return [self.rolls[frameIndex] integerValue] + [self.rolls[frameIndex + 1] integerValue];
}

- (NSInteger)spareBonus:(NSInteger)frameIndex
{
    return [self.rolls[frameIndex + 2] integerValue];
}

- (NSInteger)strikeBonus:(NSInteger)frameIndex
{
    return [self.rolls[frameIndex + 1] integerValue] + [self.rolls[frameIndex + 2] integerValue];
}

@end
