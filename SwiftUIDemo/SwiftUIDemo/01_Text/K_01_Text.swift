//
//  K_01_Text.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/16.
//

import SwiftUI

struct K_01_Text: View {
    var body: some View {
        
        VStack(content: {
            
            /// 默认
            Text("SwiftUIahshajhjdhajshdjas")
                .padding(8)
                .background(Color.hexFF0000)
                .foregroundColor(.white)
                .font(.PFRegular(18))
                .lineLimit(1)
            /// 多行文本对其方式
                .multilineTextAlignment(.leading)
                .cornerRadius(20)
            
                
                
            
            /// 分割线长度
            Divider().background(Color.black).scaleEffect(.init(width: 1, height: 20))
            
            /// 富文本1
            Text("SwiftUI1").font(.title).foregroundColor(.orange)
            + Text("SwiftUI1").font(.title).foregroundColor(.blue)
            
            /// 富文本点击事件
            HStack (spacing: 0, content: {
                
                Text("This is ").font(.title)
                + Text("bold").font(.title)
                + Text(" and ").font(.title)
                + Text(".lka").font(.title)
                
                Text("This is a link")
                    .font(.title)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        // 在这里处理点击事件
                        print("Link tapped!1111")
                    }
                
            }).background(.red)
             
            HStack (spacing: 0, content: {
                
                Text("sjkjk").font(.title)
                + Text("bold").font(.title)
                + Text(" and ").font(.title)
                + Text(".lka").font(.title)
                
                Text("This is a link")
                    .font(.title)
                    .foregroundColor(.red)
                    .onTapGesture {
                        // 在这里处理点击事件
                        print("Link tapped!测试呀")
                    }
                
            }).background(.blue).padding(0)
                        


            
               
        })
        
        
    }
    
}

#Preview {
    K_01_Text()
}
