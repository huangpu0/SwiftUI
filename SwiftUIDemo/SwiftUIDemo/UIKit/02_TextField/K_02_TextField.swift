//
//  K_02_TextField.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/16.
//

import SwiftUI

struct K_02_TextField: View {
    @State var account: String = ""
    @State var paswoed: String = ""
    
    var body: some View {
        
        VStack(spacing: 12){
        
            HStack ( spacing: 8) {
                /// 账号
                Text("账号:")
                if #available(iOS 15.0, *) {
                    TextField(text: self.$account) {
                        Text("请输入账号")
                    }.onChange(of: account, perform: { newValue in
                        print("nv=\(newValue)")
                    })
                    .foregroundColor(.gray)
                    .textFieldStyle(.roundedBorder)
                } else {
                    // Fallback on earlier versions
                }
                    
                    
               
            }.padding(.leading, 12)
                .padding(.trailing, 12)
                .padding(.top, 60)
                
            HStack(spacing: 8) {
                /// 账号
                Text("密码:")
                if #available(iOS 15.0, *) {
                    SecureField(text: self.$paswoed) {
                        Text("请输入密码")
                    }.foregroundColor(.black)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                } else {
                    // Fallback on earlier versions
                }
               
               
            }.padding(.leading, 12)
                .padding(.trailing, 12)
            
            
            HStack {
                Spacer()
                Text("登录").foregroundColor(.white).frame(height: 40)
                Spacer()
            }.background(Color.red)
                .cornerRadius(8)
                .padding(.leading, 12)
                .padding(.trailing, 12)
                .onTapGesture {
                    print("账号2222=\(account)=密码=\(paswoed)")
                }
            
            /// 剩余填充满
            Spacer()
            
        }.NavigationBar(title: "TextField")
            
        
        
    }
    
  
    
}

#Preview {
    K_02_TextField()
}
