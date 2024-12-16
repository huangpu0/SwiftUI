//
//  Corlor_Ext.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/16.
//

import SwiftUI

extension Color {
    
    init(hex: Int, alpha: Double = 1.0) {
        let red = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue = Double(hex & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
    
    /// FF0000
    static let hexFF0000 = Color.init(hex: 0xFF0000)
    
}
