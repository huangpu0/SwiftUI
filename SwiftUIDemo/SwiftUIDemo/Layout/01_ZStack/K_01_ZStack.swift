//
//  K_01_ZStack.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/18.
//

import SwiftUI

struct K_01_ZStack: View {
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            Text("Hello, World!4").background(Color.blue).padding(.leading, 15).padding(.top, 5)
            Text("Hello, World!5").background(Color.yellow).offset(x: 0, y: 20)
            Text("Hello, World!6").background(Color.green).padding(.top, 50)
            
            /// 布局显示
            VStack (spacing: 8) {
                Text("Hello, World!1").background(Color.blue)
                Text("Hello, World!2").background(Color.yellow)
                Text("Hello, World!3").background(Color.green)
            }.padding(.top, 100)
            
        }.background(Color.red)
        
    }
}

#Preview {
    K_01_ZStack()
}
