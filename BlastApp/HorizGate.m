/*
     File: HorizGate.m
 Abstract: HorizGate, a subclass of Gate
  Version: 1.0
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2012 Apple Inc. All Rights Reserved.
 
 */


#import "HorizGate.h"

@implementation HorizGate
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"hblock" numFrames:1 numPoses:2])) return nil;
    [self setPerFrameTime:10000000];
    return self;
}

- (BOOL)touches:(GamePiece *)obj {
    if ([super touches:obj]) {
        if ([self isClosed]) return YES;	// If closed, the whole gate is bad...
        if ([obj touchesRect:NSMakeRect(pos.origin.x, pos.origin.y, 5.0, 5.0)] || [obj touchesRect:NSMakeRect(NSMaxX(pos) - 5.0, pos.origin.y, 5.0, 5.0)]) return YES;
    }
    return NO;
}

- (BOOL)touchesRect:(NSRect)rect {
    if ([super touchesRect:rect]) {
        if ([self isClosed]) return YES;	// If closed, the whole gate is bad...
        if ([GamePiece intersectsRects:rect :NSMakeRect(pos.origin.x, pos.origin.y, 5.0, 5.0)] || [GamePiece intersectsRects:rect :NSMakeRect(NSMaxX(pos) - 5.0, pos.origin.y, 5.0, 5.0)]) return YES;
    }
    return NO;
}
@end
