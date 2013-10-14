//
//  NSString+Helpers.h
//  CoreMeta
//
//  Created by Joshua Gretz on 7/16/12.
//
/* Copyright 2011 TrueFit Solutions
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <Foundation/Foundation.h>

@interface NSString (Helpers)

-(NSString*) trimLeft: (int) length;
-(NSString*) trimRight: (int) length;
-(NSString*) trimWhiteSpaceLeft;
-(NSString*) trimWhiteSpaceRight;

-(NSString*) substring: (int) length start: (int) index;

-(BOOL) isNilOrEmpty;
-(BOOL) contains: (NSString*) search;
-(BOOL) startsWith: (NSString*) search;
-(BOOL) endsWith: (NSString*) search;

-(NSString*) properCaseAtSpace;
-(NSString*) insertSpaceBeforeProperCase;
-(NSString*) xmlSimpleEscape;

-(NSString*) padLeftToLength: (int) length;
-(NSString*) padRightToLength: (int) length;
-(NSString*) padBothToLength: (int) length;

+(NSString*) stringFromInt: (int) value;
+(NSString*) stringFromFloat: (float) value;
+(NSString*) stringFromFloat: (float) value format: (NSString*) format;

+(NSString*) newStringWithUUID;

@end