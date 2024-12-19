//
//  UIKitView.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/17.
//

import SwiftUI

struct UIKitView: View {
    
    let datas: [String] = ["Text", "TextField", "Button", "Image", "Toggle", "Slider", "Picker", "DatePicker", "Alert"]
    
    var body: some View {
        
        
        NavigationView {
            
            List(0..<datas.count, id: \.self) { index in
                HStack {
                    NavigationLink {
                        switch index {
                        case 0: K_01_Text()
                        case 1: K_02_TextField()
                        case 2: K_03_Button()
                        case 3: K_04_Image()
                        case 4: K_05_Toggle()
                        case 5: K_06_Slider()
                        case 6: K_07_Picker()
                        case 7: K_08_DatePicker()
                        case 8: K_09_Alert()
                        default: K_01_Text()
                        }
                    } label: {
                        Text(datas[index])
                    }
                    
                }
                
            }
            .navigationTitle("UIKit")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
}

#Preview {
    UIKitView()
}
