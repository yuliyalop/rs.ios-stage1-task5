#import "Converter.h"

// Do not change
NSString *KeyPhoneNumber = @"phoneNumber";
NSString *KeyCountry = @"country";

@implementation PNConverter
- (NSDictionary*)converToPhoneNumberNextString:(NSString*)string; {
    // good luck
    NSString *eight = @" (xx) xxx-xxx";
    NSString *nine = @" (xx) xxx-xx-xx";
    NSString *ten = @" (xxx) xxx-xx-xx";
    NSDictionary *countries = @{
        @"7": @"KZ",
        @"7": @"RUS",
        @"373": @"MD",
        @"374": @"AM",
        @"375": @"BY",
        @"380": @"UA",
        @"992": @"TJ",
        @"993": @"TM",
        @"994": @"AZ",
        @"996": @"KG",
        @"998": @"UZ"
    };
    NSDictionary *codes = @{
        @"7": @"10",
        @"373": @"8",
        @"374": @"8",
        @"375": @"9",
        @"380": @"9",
        @"992": @"9",
        @"993": @"8",
        @"994": @"9",
        @"996": @"9",
        @"998": @"9"
    };
    NSMutableString *result;
    NSString *code = [NSString new];
    NSString *country = [NSString new];
    NSArray *keys = [NSArray new];
    NSString *number = [NSString new];
    NSMutableString *number1;
    int obj;
    NSString *i = [NSString new];
    
    
    if ([string length] >= 3  && [string characterAtIndex:0] != '7'){
        code = [string substringToIndex:3];
        number = [string substringFromIndex:3];
        number1 = [[NSMutableString alloc]initWithString:number];
        NSMutableArray *array = [NSMutableArray new];
        [array addObject:code];
        keys = [codes allKeys];
        i = [array objectAtIndex:0];
        if ([keys containsObject:i]) {
            int obj = [[codes valueForKey:i]intValue];
#pragma mark 9
            if (obj == 9){
                if ([number length] > 9) {
                    [number1 deleteCharactersInRange:NSMakeRange(9, [number1 length]-9)];
                }
                int k = 0;
                int j = [code length];
                while ( k < [nine length] && j < [string length]) {
                    if ([nine characterAtIndex:k] == 'x') {
                        k++;
                        j++;
                    } else {
                        [number1 insertString:[nine substringWithRange:(NSMakeRange(k, 1))] atIndex:k];
                        k++;
                    }
                }
                NSString *number2 = [[NSString alloc]initWithString:number1];
                result = [[NSMutableString alloc]initWithString:code];
                [result insertString:@"+" atIndex:0];
                [result appendString:number1];
                NSLog(result);
                country = [countries valueForKey:i];
                return @{KeyPhoneNumber: result,
                         KeyCountry: country};
                
                
#pragma mark 8
            } if (obj == 8) {
                if ([number length] > 8) {
                    [number1 deleteCharactersInRange:NSMakeRange(8, [number1 length]-8)];
                }
                int k = 0;
                int j = [code length];
                while ( k < [eight length] && j < [string length]) {
                    if ([eight characterAtIndex:k] == 'x') {
                        k++;
                        j++;
                    } else {
                        [number1 insertString:[eight substringWithRange:(NSMakeRange(k, 1))] atIndex:k];
                        k++;
                    }
                }
                NSString *number2 = [[NSString alloc]initWithString:number1];
                result = [[NSMutableString alloc]initWithString:code];
                [result insertString:@"+" atIndex:0];
                [result appendString:number1];
                NSLog(result);
                country = [countries valueForKey:i];
                return @{KeyPhoneNumber: result,
                         KeyCountry: country};
            }
            } else {
                NSMutableString *alternative = [[NSMutableString alloc]initWithString:string];
                if ([alternative length] > 12) {
                    [alternative deleteCharactersInRange:NSMakeRange(12, [alternative length]-12)];
                }
                [alternative insertString:@"+" atIndex:0];
                return @{KeyPhoneNumber: alternative,
                         KeyCountry: @""};
                    }
                                                                    }
        

            else if ([string characterAtIndex:0] == '7'){
                number = [string substringFromIndex:1];
                NSMutableString *number1 = [[NSMutableString alloc]initWithString:number];
                if ([number length] > 10) {
                    [number1 deleteCharactersInRange:NSMakeRange(10, [number1 length]-10)];
                }
                result = [[NSMutableString alloc]initWithString:@"+7"];
                int k = 0;
                int j = 1;
                while ( k < [ten length] && j < [string length]) {
                    if ([ten characterAtIndex:k] == 'x') {
                        k++;
                        j++;
                    } else {
                        [number1 insertString:[ten substringWithRange:(NSMakeRange(k, 1))] atIndex:k];
                        k++;
                    }
                }
                [result appendString:number1];
                if ([string length] > 1 && [string characterAtIndex:1] == '7'){
                    country = @"KZ";
                    return @{KeyPhoneNumber: result,
                             KeyCountry: country};
                } else {
                    country = @"RU";
                    return @{KeyPhoneNumber: result,
                             KeyCountry: country};
                }
            } else {
                NSMutableString *alternative = [[NSMutableString alloc]initWithString:string];
                if ([alternative length] > 12) {
                    [alternative deleteCharactersInRange:NSMakeRange(12, [alternative length]-12)];
                }
                [alternative insertString:@"+" atIndex:0];
                return @{KeyPhoneNumber: alternative,
                         KeyCountry: @""};
            }
            
    
            
            
            
            
            
            return @"";
            
        }
        
        @end
