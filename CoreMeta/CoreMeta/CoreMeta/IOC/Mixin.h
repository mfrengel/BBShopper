//
//  Mixin.h
//  CoreMeta
//
//  Created by Joshua Gretz on 3/9/12.
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

@interface Mixin : NSObject

+(void) mixClass: (Class) source into: (Class) target;
+(void) mixClass: (Class) source into: (Class) target inherit: (BOOL) inherit replaceExistingMethods: (BOOL) replaceExisting;

@end

@interface NSObject (Mixin)

- (void) mixinClass: (Class)source;
- (void) mixinClass: (Class)source inherit: (BOOL) inherit replaceExistingMethods: (BOOL) replaceExisting;

@end