//
//  K_03_Button.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/17.
//

import SwiftUI

struct K_03_Button: View {
    
    @State private var buttonClicked = false
    
    var body: some View {
        
        VStack {
            
            Button("文字按钮") {
                print("文字按钮")
            }.font(.PFMedium(18))
            
            if #available(iOS 15.0, *) {
                Button {
                    print("图片文字点击")
                } label: {
                    HStack {
                        Image("icon_勾选")
                        Text("图片文字按钮")
                    }
                }.frame(maxWidth: .infinity, maxHeight: 30)
                    .foregroundColor(.white)
                    .background(Color.brown).cornerRadius(4).padding()
            } else {
                // Fallback on earlier versions
            }
            
            if #available(iOS 15.0, *) {
                Button {
                    print("图片文字点击")
                } label: {
                    HStack {
                        Image("icon_勾选")
                        Text("buttonStyle按钮")
                    }
                }.buttonStyle(.borderedProminent)
            } else {
                // Fallback on earlier versions
            }
            
            if #available(iOS 15.0, *) {
                Button {
                    print("图片文字点击")
                } label: {
                    HStack {
                        Text("buttonStyle按钮")
                        Image("icon_勾选")
                    }
                }.buttonStyle(.borderedProminent)
            } else {
                // Fallback on earlier versions
            }


            /// 正确设置圆角边框
            if #available(iOS 15.0, *) {
                Button {
                    print("图片文字点击")
                } label: {
                    HStack {
                        Image("icon_勾选")
                        Text("边框背景按钮")
                    }
                }.frame(maxWidth: .infinity, maxHeight: 30)
                    .foregroundColor(.white)
                    .background(Color.brown)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15, style: .circular).stroke(.red, lineWidth: 1)
                    ).padding()
            } else {
                // Fallback on earlier versions
            }
            
            /// 正确设置圆角边框
            if #available(iOS 15.0, *) {
                Button {
                    print("图片文字点击")
                    buttonClicked = !buttonClicked
                } label: {
                    
                    HStack {
                        Image("icon_勾选")
                        if buttonClicked {
                            Text("Selected状态按钮")
                        }else {
                            Text("Normal状态按钮")
                        }
                        
                    }
                }.frame(maxWidth: .infinity, maxHeight: 30)
                    .foregroundColor(buttonClicked ? .red:.white)
                    .background(buttonClicked ? Color.blue:Color.brown)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15, style: .circular).stroke(.red, lineWidth: 1)
                    ).padding()
            } else {
                // Fallback on earlier versions
            }
            
        }
        
        
        
        
    }
}

#Preview {
    K_03_Button()
}
