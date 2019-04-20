//
//  Assembly.m
//  PingPong
//
//  Created by Igor on 17/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "Assembly.h"


@implementation Assembly

+ (UIViewController *)assemblyGame
{
    Game *gameModel = [Game new];
    GameStartViewController *gameView = [GameStartViewController new];
    GamePresenter *presenter = [[GamePresenter alloc] initGameWith:gameView model:gameModel];
    gameView.presenter = presenter;
    return gameView;
}

@end
