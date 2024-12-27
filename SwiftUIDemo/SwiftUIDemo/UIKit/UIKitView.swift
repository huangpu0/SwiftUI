//
//  UIKitView.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/17.
//

import SwiftUI

struct UIKitView: View {
    
    let datas: [String] = ["Text", "TextField", "Button", "Image", "Toggle", "Slider", "Picker", "DatePicker", "Alert", "WebView", "UIViewController"]
    
    var body: some View {
        
        NavigationView {
            VStack (spacing: 0){
                // 自定义导航栏
               
             //   Spacer()

                // 其他内容
                List(0..<datas.count, id: \.self) { index in
                    HStack {
                        NavigationLink {
                            switch index {
                            case 0: if #available(iOS 15, *) {
                                K_01_Text()
                            } else {
                                // Fallback on earlier versions
                            }
                            case 1: K_02_TextField()
                            case 2: K_03_Button()
                            case 3: K_04_Image()
                            case 4: K_05_Toggle()
                            case 5: K_06_Slider()
                            case 6: K_07_Picker()
                            case 7: K_08_DatePicker()
                            case 8: K_09_Alert()
                            case 9: K_10_WebView()
                            case 10: K_11_ViewControllerPage()
                            default: if #available(iOS 15, *) {
                                K_01_Text()
                            } else {
                                // Fallback on earlier versions
                            }
                            }
                        } label: {
                            Text(datas[index])
                        }
                        
                    }
                    
                }
                
            }.NavigationBar(false, title: "UIKIT")
            
            
        }
       
        
        
    }
}

#Preview {
    UIKitView()
}
