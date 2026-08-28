#import <UIKit/UIKit.h>
#import <substrate.h>

// Hook cơ chế so sánh chuỗi (Đánh lừa kiểm tra tính năng)
%hook NSString
- (BOOL)isEqualToString:(NSString *)aString {
    if ([aString isEqualToString:@"camera.fake-frame"] || 
        [aString isEqualToString:@"camera.color-sync"] || 
        [aString isEqualToString:@"camera.controls"] ||
        [aString isEqualToString:@"camera.obs"] ||
        [aString isEqualToString:@"media.import"] ||
        [aString isEqualToString:@"capabilities"]) {
        return YES; 
    }
    return %orig;
}
%end

// Hook cơ chế đọc từ điển (Nạp thẳng mảng tính năng Premium)
%hook NSDictionary
- (id)objectForKeyedSubscript:(id)key {
    if ([key isKindOfClass:[NSString class]] && [(NSString *)key isEqualToString:@"capabilities"]) {
        return @[@"camera.color-sync", @"camera.controls", @"camera.fake-frame", @"camera.obs", @"media.import"];
    }
    return %orig;
}
- (id)objectForKey:(id)aKey {
    if ([aKey isKindOfClass:[NSString class]] && [(NSString *)aKey isEqualToString:@"capabilities"]) {
        return @[@"camera.color-sync", @"camera.controls", @"camera.fake-frame", @"camera.obs", @"media.import"];
    }
    return %orig;
}
%end
