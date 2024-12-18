//
//  CusAlertView.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/18.
//

import SwiftUI

struct CusAlertView: View {
    
    
    // 绑定变量，用于控制弹窗的显示与隐藏
    @Binding var isPresented: Bool
    
    typealias cancelBlock = () -> Void
    typealias sureBlock = () -> Void
    
    var title: String
    var sub_title: String
    var cancel: String
    var block1: cancelBlock?
    var sure: String
    var block2: cancelBlock?
    
   
   
    
    
    var body: some View {
        ZStack {
            // 弹窗的背景
            Color.black.edgesIgnoringSafeArea(.all).opacity(0.3)
            
            // 弹窗的内容
            VStack (spacing: 0) {
                
                Text(title)
                    .font(.title)
                    .foregroundColor(.red)
                    .padding(.top, 20)
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                    
                Text(sub_title)
                    .foregroundColor(.gray)
                    .padding(.top, 10)
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                    .multilineTextAlignment(.center)
                
                Divider().padding(.bottom, 0).padding(.top, 20)
                
                HStack (spacing: 0) {
                    
                    Button(sure) {
                        // 关闭弹窗
                        isPresented = false
                        block2?()
                    }.frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .foregroundColor(.red)
                    
                    Divider().frame(height: 45)
                    
                    Button(cancel) {
                        // 关闭弹窗
                        isPresented = false
                        block1?()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .foregroundColor(.blue)
                   
                }
                
               
                
            }.background(.white)
                .cornerRadius(18)
                .frame(minWidth: 300, maxWidth: .infinity)
                .padding(.leading, 30)
                .padding(.trailing, 30)
                
        }
    }
}

