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
            
            Button {
                print("图片文字点击")
            } label: {
                HStack {
                    Image("icon_勾选")
                    Text("图片文字按钮")
                }
            }.frame(maxWidth: .infinity, maxHeight: 30)
                .foregroundColor(.white)
            .background(.brown).cornerRadius(4).padding()
            
            Button {
                print("图片文字点击")
            } label: {
                HStack {
                    Image("icon_勾选")
                    Text("buttonStyle按钮")
                }
            }.buttonStyle(.borderedProminent)
            
            Button {
                print("图片文字点击")
            } label: {
                HStack {
                    Text("buttonStyle按钮")
                    Image("icon_勾选")
                }
            }.buttonStyle(.borderedProminent)


            /// 正确设置圆角边框
            Button {
                print("图片文字点击")
            } label: {
                HStack {
                    Image("icon_勾选")
                    Text("边框背景按钮")
                }
            }.frame(maxWidth: .infinity, maxHeight: 30)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15, style: .circular).stroke(.red, lineWidth: 1)
                ).padding()
            
            /// 正确设置圆角边框
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
                .background(buttonClicked ? .blue:.brown)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15, style: .circular).stroke(.red, lineWidth: 1)
                ).padding()
            
        }
        
        
        
        
    }
}

#Preview {
    K_03_Button()
}
