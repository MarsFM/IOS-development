//
//  FoundationTestDemo.m
//  FoundationTestDemo
//
//  Created by ilya on 17.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface FoundationTestDemo : XCTestCase

@end

@implementation FoundationTestDemo

- (void)testExample {
    NSObject *obj = nil;
    [obj description];
    [NSNull null];
    //    NSArray *array = @[@"1", [NSNull null]];
    //    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"121212" attributes:@{NSForegroundColorAttributeName: UIColor.redColor }];
    //    NSDate *date = [NSDate date];
    //    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    //    dateFormater.dateStyle = NSDateFormatterLongStyle;
    //    NSString *str = [dateFormater stringFromDate:date];
    //
    //    NSCalendar *calendar = [NSCalendar currentCalendar];
    //    NSDateComponents *components = [calendar components:NSCalendarUnitQuarter | NSCalendarUnitEra | NSCalendarUnitMonth fromDate:date];
    
    //    NSURL *url = [[NSURL alloc] initWithString:@"https://google.com"];
    //    [[NSBundle mainBundle] URLForResource:@"text" withExtension:@"txt"];
    //    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:false];
    //    NSLog(@"%@", components.scheme);
    //    NSLog(@"%@", components.host);
    
    //    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://google.com"]];
    //    NSMutableString *str = @"1234";
    //    [str dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:true];
    //    NSByteCountFormatter *bformatter = [[NSByteCountFormatter alloc] init];
    //    NSString *fornattedBytes = [bformatter stringFromByteCount:data.length];
    
    //    NSUUID *uuid = [[NSUUID UUID] UUIDString];
    
    //    NSRange range = NSMakeRange(0, @"Hello world".length);
    //    NSString *str = [@"Hello world" stringByReplacingOccurrencesOfString:@"o"
    //                                                              withString:@"()"
    //                                                                 options:NSCaseInsensitiveSearch
    //                                                                   range:range];
    
    //    NSString *str = @"wdasdasd 3242ewda sadfdsfasdfasdf";
    //    NSArray *array = [str componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //    NSString *str2 = [array componentsJoinedByString:@""];
    //
    //    NSString *ss = @"sdasdasd +1212122323 https://google.com";
    //    NSError *error;
    //    NSDataDetector *detector = [[NSDataDetector alloc] initWithTypes:NSTextCheckingTypePhoneNumber error:&error];
    
    //    NSLocale
    
    //    NSString *str = @"123 abc 456 def 789  ghi 0";
    //    NSRegularExpression *regexp = [NSRegularExpression regularExpressionWithPattern:@"[0-9]{3}"
    //                                                                            options:NSRegularExpressionCaseInsensitive
    //                                                                              error:NULL];
    //
    //    NSArray *matches = [regexp matchesInString:str options:0 range:NSMakeRange(0, str.length)];
    //    for (NSTextCheckingResult *result in matches) {
    //        NSLog(@"%@", [str substringWithRange:result.range]);
    //    }
    
    //    NSString *str = @"122323, USA, Unated road, The street, 12,  +1-123-344-43 https://google.com/ asd asdsad";
    //    NSTextCheckingTypes types = NSTextCheckingTypeAddress | NSTextCheckingTypePhoneNumber | NSTextCheckingTypeLink;
    //    NSDataDetector *detecor = [NSDataDetector dataDetectorWithTypes:types error:NULL];
    //    NSArray *array = [detecor matchesInString:str options:0 range:NSMakeRange(0, str.length)];
    //    for (NSTextCheckingResult *result in array) {
    //        NSLog(@"%llu: %@", result.resultType, [str substringWithRange:result.range]);
    //    }
    
    
    
}

@end
