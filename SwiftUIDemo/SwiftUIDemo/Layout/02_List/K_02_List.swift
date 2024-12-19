//
//  K_02_List.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/18.
//

import SwiftUI

/// 需要实现 Identifiable 协议
struct TodoItem: Identifiable {
    var id: UUID = UUID()
    var task: String
    var imgName: String
}


struct K_02_List: View {
    
    @State var listData: [TodoItem] = [
            TodoItem(task: "写一篇SwiftUI文章", imgName: "pencil.circle"),
            TodoItem(task: "看WWDC视频", imgName: "square.and.pencil"),
            TodoItem(task: "定外卖", imgName: "folder"),
            TodoItem(task: "关注OldBirds公众号", imgName: "link"),
            TodoItem(task: "6点半跑步2公里", imgName: "moon"),
        ]
    
    var body: some View {
        
        List {
            Section(header: Text("待办事项")) {
                ForEach(listData) { item in
                    HStack{
                        Image(systemName: item.imgName)
                        Text(item.task)
                        Spacer()
                        Image(systemName: "chevron.right").foregroundColor(Color.blue)
                        
                    }.listRowInsets(.init(top: 0, leading: 15, bottom: 0, trailing: 15)) /// 调整内边距
                }.onMove { inSet, index in
                    listData.move(fromOffsets: inSet, toOffset: index)  /// 移动
                }.onDelete { inset in
                    listData.remove(atOffsets: inset) /// 删除
                }
            }
            
            Section(header: Text("其他内容"), footer: Text("Footer")) {
                ForEach(0..<6) { data in
                    HStack{
                        Text("Hello World")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                }
                
            }
        }.listStyle(.sidebar)// 或者其他你想要的List样式
            
                    
    }
    
}

#Preview {
    K_02_List()
}
