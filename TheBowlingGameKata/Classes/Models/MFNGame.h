//
//  MFNGame.h
//  TheBowlingGameKata
//
//  Created by Miguel Ferrando Navalón on 13/05/14.
//  Copyright (c) 2014 Miguel Ferrando. All rights reserved.
//

@interface MFNGame : NSObject

@property (nonatomic, strong, readonly) NSNumber *score;

- (void)roll:(NSNumber *)pins;

@end
