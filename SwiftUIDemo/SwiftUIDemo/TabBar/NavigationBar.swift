//
//  CusNavigationView.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/17.
//

import SwiftUI
 
// 自定义导航栏视图修饰符
struct CustomNavigationBar: ViewModifier {
    
    /// 返回按钮
    @State var show_navBack: Bool = false
    @State var navBarBackItem: String = ""
    @State var backBlock: NoParamsBlock?
    
    /// 导航文字
    @State var navBarTitle: String = ""
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitle(navBarTitle, displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                if (backBlock != nil) {
                    backBlock?()
                }else {
                    
                }
            }, label: {
                if show_navBack {
                    navBarBackItem.isEmpty ? Image(systemName: "chevron.left"):Image(navBarBackItem)
                }
            }))
            
    }
}
 
// 扩展View以使用CustomNavigationBar
extension View {
    func NavigationBar(_ showBack: Bool = true ,back: String = "", backBlock: NoParamsBlock?, title: String) -> some View {
        self.modifier(CustomNavigationBar(show_navBack: showBack, navBarBackItem: back, backBlock: backBlock, navBarTitle: title))
    }
}
 
