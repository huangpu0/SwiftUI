//
//  K_03_ScrollView.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/19.
//

import SwiftUI

struct K_03_ScrollView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            HStack {
                Text("Hello, World!1 测试呀卡就是看见肯德基家啊数据打卡数据打开卡数量扩大了深刻的拉升扩大卡就是来的拉升扩大啦深刻的拉升扩大卡数量的卡拉斯科的拉升扩大卡的卢卡申科的拉升扩大卡桑德拉卡桑德拉开始的卡数量的卡洛斯打卡").background(Color.blue).frame(height: 300)
                Spacer()
            }
            
            Divider().background(Color.black).scaleEffect(CGSize(width: 1, height: 20))
            
            Text("Hello, World!1 \n 测试呀卡就是看见肯德基家啊数据打卡数据打开卡数量扩大了深刻的拉升扩大卡就是来的拉升扩大啦深刻的拉升扩大卡数量的卡拉斯科的拉升扩大卡的卢卡申科的拉升扩大卡桑德拉卡桑德拉开始的卡数量的卡洛斯打卡").background(Color.blue).frame(height: 300)
            Text("Hello, World!2 \n 测试呀卡就是看见肯德基家啊数据打卡数据打开卡数量扩大了深刻的拉升扩大卡就是来的拉升扩大啦深刻的拉升扩大卡数量的卡拉斯科的拉升扩大卡的卢卡申科的拉升扩大卡桑德拉卡桑德拉开始的卡数量的卡洛斯打卡").background(Color.blue).frame(height: 300)
            Text("Hello, World!3\n测试呀卡就是看见肯德基家啊数据打卡数据打开卡数量扩大了深刻的拉升扩大卡就是来的拉升扩大啦深刻的拉升扩大卡数量的卡拉斯科的拉升扩大卡的卢卡申科的拉升扩大卡桑德拉卡桑德拉开始的卡数量的卡洛斯打卡").background(Color.blue)
        }
        .frame(maxWidth: .infinity)
        .background(Color.red)
           
        
    }
}

#Preview {
    K_03_ScrollView()
}
