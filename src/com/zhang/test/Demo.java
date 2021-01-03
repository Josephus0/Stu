package com.zhang.test;

public class Demo {
    public static void main(String[] args) {
//        int num =5;
//        Well oldw = new Well(num,"---猪八戒---");
//        oldw.start();
//        Well oldw1 = new Well(num,"---孙悟空---");
//        oldw1.start();
//        for(int i=1;i<=num;i++)
//        {
//            System.out.println("当前线程："+Thread.currentThread().getName());
//            try {
//                Thread.sleep(2000);
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//            }
//        }
        Thread t = new Thread("xxx");
        //t.start();
        System.out.println("当前线程："+Thread.currentThread().getName());
        try {
            t.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        t.start();System.out.println("当前线程："+Thread.currentThread().getName());
    }
}
