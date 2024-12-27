//
//  K_01_Text.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/16.
//

import SwiftUI

@available(iOS 15, *)
struct K_01_Text: View {
    
    var text1: AttributedString {
        var text = AttributedString("感谢您下载xxxxxx。在您开始使用本软件时，我们可能会对您的部分个人信息进行收集、使用和共享。请您务必仔细阅读")
        text.foregroundColor = .black
        return text
    }
    var text2: AttributedString {
        var text = AttributedString("《用户协议》")
        text.link = URL(string: "111")
        text.foregroundColor = .red
        return text
    }
    var text3: AttributedString {
        var text = AttributedString("与")
        text.foregroundColor = .black
        return text
    }
    var text4: AttributedString {
        var text = AttributedString(localized:"《隐私政策》")
        text.link = URL(string: "222")
        text.foregroundColor = .blue
        return text
    }
    var text5: AttributedString {
        var text = AttributedString("全文，并确定完全了解我们对您个人信息的处理如您同意 ")
        text.foregroundColor = .black
        return text
    }
    var text: AttributedString {
        text1 + text2 + text3 + text4 + text5
    }
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
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
                    
                    Text("富文本点击事件").font(.title)
                    + Text("bold").font(.title)
                    
                    Text("This is a link")
                        .onTapGesture {
                            // 在这里处理点击事件
                            print("Link tapped!11112222")
                        }
                        .font(.title)
                        .foregroundColor(.blue)
                    
                    
                    
                }).background(.red)
                
                /// 图文混编
                HStack (spacing: 0, content: {
                    let nv = Image(.icon勾选)
                    Text("图文混编图文混编图文混编图文混编图文混编图文混编图\(nv)如果语言列表中没有中文，您可以在手表配对iPhone->设置通用->键盘->添加新键盘->简体中文->拼音-全键盘")
                    
                }).background(.blue)
                
                /// 图文混编Link
                Text(text).environment(\.openURL, OpenURLAction(handler: { url in
                    let path = url.absoluteString
                    if path.hasPrefix("111") {
                        print("111...")
                        self.presentationMode.wrappedValue.dismiss()
                    } else if path.hasPrefix("222") {
                        print("222...")
                    }
                    return .handled
                }))
                
                
            })
            
        }.NavigationBar(title: "Text").hiddenTabBar
        
        
    }
    
}

#Preview {
    if #available(iOS 15, *) {
        K_01_Text()
    } else {
        // Fallback on earlier versions
    }
}
