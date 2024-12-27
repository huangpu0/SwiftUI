//
//  NavigationView.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/17.
//

import SwiftUI
 
// 自定义导航栏视图修饰符
struct NavigationBarView: ViewModifier {
    
    /// 返回按钮
    @State var show_navBack: Bool = false
    @State var backBlock: NoParamsBlock?
    
    @Environment(\.presentationMode) var presentationMode
    
    /// 导航文字
    @State var navBarTitle: String = ""
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitle(navBarTitle, displayMode: .inline)
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading: Button(action: {
                if (backBlock != nil) {
                    backBlock?()
                }else {
                    presentationMode.wrappedValue.dismiss()
                }
            }, label: {
                if show_navBack {
                    Image(systemName: "chevron.left").foregroundColor(Color.black)
                }
            }))
        
    }
    
}
 
// 扩展View以使用CustomNavigationBar
extension View {
    func NavigationBar(_ showBack: Bool = true, backBlock: NoParamsBlock? = nil, title: String) -> some View {
        self.modifier(NavigationBarView(show_navBack: showBack, backBlock: backBlock, navBarTitle: title))
    }
}
 
