//
//  K_07_Picker.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/18.
//

import SwiftUI

struct K_07_Picker: View {
    
    @State var leftIndex = 0
   
    let leftSource: [String] = (0..<10).map { $0%2 == 0 ? "🧜‍♀️\($0)":"🧚‍♀️\($0)" }
    
    var body: some View {
        VStack {
            Text("Left Value:")
            Text("\(self.leftSource[self.leftIndex])")
                .foregroundColor(.orange)
                .bold()
                .font(.largeTitle)
            
            Picker("测试呀", selection: $leftIndex) {
                /// 在SwiftUI中，ForEach需要一个常量范围来优化性能，因此不能使用变量来动态生成范围。
                ForEach(0..<leftSource.count, id: \.self) { index in
                    Text(self.leftSource[index]).tag(index)
                }
            }
            
            Picker("测试呀", selection: $leftIndex) {
                /// 在SwiftUI中，ForEach需要一个常量范围来优化性能，因此不能使用变量来动态生成范围。
                ForEach(0..<leftSource.count, id: \.self) { index in
                    Text(self.leftSource[index]).tag(index)
                }
            }.pickerStyle(.wheel)
            
            Picker("测试呀", selection: $leftIndex) {
                /// 在SwiftUI中，ForEach需要一个常量范围来优化性能，因此不能使用变量来动态生成范围。
                ForEach(0..<leftSource.count, id: \.self) { index in
                    Text(self.leftSource[index]).tag(index)
                }
            }.pickerStyle(.segmented)
           
        }
    }
}

#Preview {
    K_07_Picker()
}
