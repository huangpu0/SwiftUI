//
//  K_05_GroupBox.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/19.
//

import SwiftUI

struct K_05_GroupBox: View {
    var body: some View {
        
        GroupBox("Settings") {
            VStack(spacing: 10) {
                HStack {
                    Text("Hello World !11") 
                }
                HStack {
                    Text("Hello World !22")
                    Spacer()
                }
            }
        }.padding()
        
        GroupBox {
            VStack(spacing: 10) {
                HStack {
                    Text("Hello World !11")
                }
                HStack {
                    Text("Hello World !22")
                    Spacer()
                }
            }
        } label: {
            Text("自定义头部").font(.title).background(.red)
        }

        
        
    }
}

#Preview {
    K_05_GroupBox()
}
