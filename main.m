//
//  main.m
//  交换礼物
//
//  Created by zhufengzhu on 15/12/14.
//  Copyright © 2015年 zhufengzhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
//交换礼物
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *path = @"/Users/zhufengzhu/Desktop/stu_info.txt";
        NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSArray *sArray = [str componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\t\n"]];
        //放入数组
        NSMutableArray *stuArray = [NSMutableArray array];
        for (int i=0;i<sArray.count;i=i+2) {
            Student *stu = [[Student alloc]init];
            stu.name = sArray[i];
            stu.stu_id = sArray[i+1];
            NSLog(@"%@",stu);
            [stuArray addObject:stu];
        }
        //乱序
        int N = stuArray.count;
        for (int i=0; i<N; i++) {
            //随机1个数,交换到后面去
            int A = arc4random()%(N-i);
            if(A != N-i-1)
            [stuArray exchangeObjectAtIndex:N-i-1 withObjectAtIndex:A];
//            NSLog(@"交换 index ")
        }
        NSLog(@"乱序后");
        for (Student *s in stuArray) {
            NSLog(@"%@",s);
        }
        //配对
        NSLog(@"配对");
        for (int i=0; i<stuArray.count; i=i+2) {
            NSLog(@"%@与同学%@交换礼物",stuArray[i],stuArray[i+1]);
        }
        
    }
    return 0;
}
