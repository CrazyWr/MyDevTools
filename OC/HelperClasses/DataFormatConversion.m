//
//  DataFormatConversion.m
//
//  Created by wei on 16/8/10.
//  Copyright © 2016年 wei. All rights reserved.
//

#import "DataFormatConversion.h"

@implementation DataFormatConversion

/**
 *  @brief 10进制转16进制
 *
 *  @param tmpid
 *
 *  @return HexString
 */
+ (NSString *)ToHex:(int)tmpid{
    
    if (tmpid == 0) {
        return @"0x0000";
    }
    
    NSString *nLetterValue;
    NSString *str =@"";
    int ttmpig;
    for (int i = 0; i<9; i++) {
        ttmpig=tmpid%16;
        tmpid=tmpid/16;
        switch (ttmpig)
        {
            case 10:
                nLetterValue =@"A";break;
            case 11:
                nLetterValue =@"B";break;
            case 12:
                nLetterValue =@"C";break;
            case 13:
                nLetterValue =@"D";break;
            case 14:
                nLetterValue =@"E";break;
            case 15:
                nLetterValue =@"F";break;
            default:nLetterValue=[[NSString alloc]initWithFormat:@"%i",ttmpig];
                
        }
        str = [nLetterValue stringByAppendingString:str];
        
        if (tmpid == 0) {
            break;
        }
    }

    return str;
}

//通过前3个数据生成第四个校验数据,并返回新数据数组
+ (NSArray *)verifyOrderData:(NSArray *)array{
    
    if (array.count<3) {
        return nil;
    }
    
//    NSLog(@"vertify data%@", array);
    
    NSMutableArray *dataArray = [NSMutableArray arrayWithArray:array];
    Byte orVerify = 0;
    Byte sumVerify = 0;
    
    for (int i = 0; i < 3; i++) {
        
        Byte bytes[2];
        long value = strtoul([array[i] UTF8String],0,16);
        int data = (int)value;
        bytes[1] = (Byte) (data & 0x000000FF);
        bytes[0] = (Byte) ((data>>8) & 0x000000FF);
        orVerify ^= bytes[0];
        orVerify ^= bytes[1];
        sumVerify += bytes[0];
        sumVerify += bytes[1];
        
    }
    Byte resultByte[2] = {sumVerify, orVerify};
    
    NSString *hexStr=@"";
    
    for(int i=0;i<2;i++){
        
        NSString *newHexStr = [NSString stringWithFormat:@"%x",resultByte[i]&0xFF];///16进制数
        
        if([newHexStr length]==1){
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        }
        else{
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
        }
    }
    
    NSString *dataString = [NSString stringWithFormat:@"0x%@",[hexStr uppercaseString]];
    [dataArray addObject:dataString];
    return dataArray;
}

//低8位和高8位转换
+ (NSData *)dataExchangeLowHight:(NSData *)data{
    
    Byte bytes[54];
    //低8位 高8位转换
    for (int i = 0; i < 54; i = i+2) {
        
        bytes[i] = ((Byte *)[[data subdataWithRange:NSMakeRange(i+1, 1)] bytes])[0];
        bytes[i+1] = ((Byte *)[[data subdataWithRange:NSMakeRange(i, 1)] bytes])[0];
        
    }
    
    return [[NSData alloc] initWithBytes:bytes length:54];
    
}

//data转换成NSNumner数组
+ (NSArray *)arrayFromData:(NSData *)data{
    
    NSMutableArray * array = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < data.length; i=i+2) {
        
        int value = CFSwapInt16BigToHost(*(int*)[[data subdataWithRange:NSMakeRange(i, 2)] bytes]);
        [array addObject:@(value)];
        
    }
    
    return array;
    
}

//将十六进制字符串转化成NSData 最多20字节
+ (NSData *)hexString:(NSString *)hexString length:(int)length{
    int j=0;
    Byte bytes[20];
    ///3ds key的Byte 数组， 128位
    for(int i=0; i<[hexString length]; i++)
    {
        int int_ch;  /// 两位16进制数转化后的10进制数
        
        unichar hex_char1 = [hexString characterAtIndex:i]; ////两位16进制数中的第一位(高位*16)
        int int_ch1;
        if(hex_char1 >= '0' && hex_char1 <='9')
            int_ch1 = (hex_char1-48)*16;   //// 0 的Ascll - 48
        else if(hex_char1 >= 'A' && hex_char1 <='F')
            int_ch1 = (hex_char1-55)*16; //// A 的Ascll - 65
        else
            int_ch1 = (hex_char1-87)*16; //// a 的Ascll - 97
        i++;
        
        unichar hex_char2 = [hexString characterAtIndex:i]; ///两位16进制数中的第二位(低位)
        int int_ch2;
        if(hex_char2 >= '0' && hex_char2 <='9')
            int_ch2 = (hex_char2-48); //// 0 的Ascll - 48
        else if(hex_char1 >= 'A' && hex_char1 <='F')
            int_ch2 = hex_char2-55; //// A 的Ascll - 65
        else
            int_ch2 = hex_char2-87; //// a 的Ascll - 97
        
        int_ch = int_ch1+int_ch2;
        
        bytes[j] = int_ch;  ///将转化后的数放入Byte数组里
        j++;
    }
    
    NSData *newData = [[NSData alloc] initWithBytes:bytes length:length];
    
    return newData;
}

+ (NSString *)hexStringFromData:(NSData *)data{
    Byte *bytes = (Byte *)[data bytes];
    NSString *hexStr=@"";
    for(int i=0;i<[data length];i++)
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff]; ///16进制数
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
}

+ (unsigned long)intergerFromHexString:(NSString *)hex{
    return strtoul([hex UTF8String],0,16);
}

@end
