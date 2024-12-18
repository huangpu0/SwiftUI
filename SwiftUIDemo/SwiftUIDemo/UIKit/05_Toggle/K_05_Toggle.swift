//
//  K_05_GridView.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/18.
//

import SwiftUI
import Combine

struct K_05_Toggle: View {
    
    @State var isOn: Bool = false
    
    var body: some View {
        
        VStack {
            
            Text("默认样式")
            Toggle("开关按钮", isOn: self.$isOn).padding()
            
            Text("去除文字")
            Toggle(isOn: self.$isOn) {
                
            }.onChange(of:isOn) { newValue in
                print("ssss==\(isOn)")
            }
            .fixedSize()
            .toggleStyle(SwitchToggleStyle(tint: .hexFF0000))
            
        }
        
        
    }
}

#Preview {
    K_05_Toggle()
}


