//
//  K_06_Slider.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/18.
//

import SwiftUI

struct K_06_Slider: View {
    
    @State var rating: Double = 0.5
    
    var body: some View {
        VStack {
            Text("Slider Value: \(rating)")
            Slider(value: self.$rating).onChange(of: rating) { newValue in
                print("Value: \(newValue)")
            }.padding()
                .tint(.red)/// 滑动条
                
                
        }
        
    }
}

#Preview {
    K_06_Slider()
}