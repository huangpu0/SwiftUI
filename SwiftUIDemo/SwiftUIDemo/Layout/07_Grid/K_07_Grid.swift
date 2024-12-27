//
//  K_07_Grid.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/19.
//

import SwiftUI

struct K_07_Grid: View {
    
    private var datas = Array(1...50)
    
    /// 左右间距12 中间8 上下 8
    private var columns: [GridItem] = [
        GridItem(.fixed(UIScreen.main.bounds.width/2-16), spacing: 8),
        GridItem(.fixed(UIScreen.main.bounds.width/2-16), spacing: 8),
    ]
    private var columns1: [GridItem] = [
        GridItem(.adaptive(minimum: UIScreen.main.bounds.width/2-16)),
    ]
    private var columns2: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible(minimum: UIScreen.main.bounds.width/2-16)),
    ]
    
    var body: some View {
        if #available(iOS 16.0, *) {
            Grid {
                GridRow {
                    Text("第一行")
                }
                GridRow {
                    Text("第二行")
                }
                GridRow {
                    Text("第三行")
                }
            }.padding().frame(height: 300)// 设置高度和内边距
                .background(.red)
        } else {
            // Fallback on earlier versions
        }
        
        ScrollView{
            LazyVGrid(columns: columns2, spacing: 8) {
                ForEach(datas, id: \.self) { item in
                    Text(String(item))
                        .frame(width: UIScreen.main.bounds.width/2-16, height: 50, alignment: .center)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.title)
                }
            }
        }.padding(.leading, 12)
        .padding(.trailing, 12)
        
        
    }
}

#Preview {
    K_07_Grid()
}
