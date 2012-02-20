//
//  WorldMapLayer.m
//  KingdomUndead
//
//  Created by Andrea Magini on 20/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WorldMapLayer.h"

// HelloWorldLayer implementation
@implementation WorldMapLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	WorldMapLayer *layer = [WorldMapLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"WorldMap" fontName:@"Marker Felt" fontSize:32];
        
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
       		// position the label onthe center of the screen
		label.position =  ccp(size.width/2,size.height-32);
		// add the label as a child to this Layer
		[self addChild:label z:10];
		
        
        
        
        CCLayerColor *color = [CCLayerColor layerWithColor:ccc4(0,0,0,255)];
		[self addChild:color z:-1];
        
		CCTMXTiledMap *map = [CCTMXTiledMap tiledMapWithTMXFile:@"Assets/worldmap1.tmx"];
		[self addChild:map z:0 tag:1];
        
        for( CCTMXLayer* child in [map children] ) {
            [[child texture] setAntiAliasTexParameters];
        }
        
       // float x, y, z;
		//[[map camera] eyeX:&x eyeY:&y eyeZ:&z];
		//[[map camera] setEyeX:x-100 eyeY:y eyeZ:z];
        
        /*id flipx  = [CCFlipX3D actionWithDuration:1];
        id flipx_back = [flipx reverse];
        id delay = [CCDelayTime actionWithDuration:0.2];
        
        //[CCSequence actions: flipx, delay, flipx_back, nil];
        
        [map runAction:[CCSequence actions: flipx, delay, flipx_back, nil]];
        */
        //[map setAnchorPoint:ccp(0.5f, 0.5f)];
        // move map to the center of the screen
	/*	CGSize ms = [map mapSize];
		CGSize ts = [map tileSize];
		[map runAction:[CCMoveTo actionWithDuration:1.0f position:ccp( +ms.width * ts.width/2, +ms.height * ts.height/2 ) ]];
      */
        // [map runAction:[CCScaleBy actionWithDuration:1 scale:0.5f]];
        
	}
	return self;
}
-(void) onEnter
{
    [super onEnter];
    
//	[//self centerSprites:3];    
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
