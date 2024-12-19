//
//  LayoutView.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/18.
//

import SwiftUI

struct LayoutView: View {
    
    let datas: [String] = ["ZStack", "List-Section", "ScrollView"]
    
    var body: some View {
        NavigationView {
            
            List(0..<datas.count, id: \.self) { index in
                HStack {
                    NavigationLink {
                        switch index {
                        case 0: K_01_ZStack()
                        case 1: K_02_List()
                        case 2: K_03_ScrollView()
                        default: K_01_ZStack()
                        }
                    } label: {
                        Text(datas[index])
                    }
                    
                }
                
            }
            .navigationTitle("Layout")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    LayoutView()
}
