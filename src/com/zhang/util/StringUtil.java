package com.zhang.util;

/**
 * 字符串工具类
 */
public class StringUtil {
    /**
     * 判断字符串是否为空
     *  如果为空返回true
     */
    public static  boolean isEmpty(String str){

        if(str == null || str.trim()== ""){
            return true;
        }
        return false;
    }
}
