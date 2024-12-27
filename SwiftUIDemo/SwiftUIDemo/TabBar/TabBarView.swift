//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/16.
//

import SwiftUI

struct TabBarView: View {
    
    @State var selection:Int = 0
    
    init() {
        // 设置选中和非选中文字颜色
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black,
                                                                         .font: UIFont.systemFont(ofSize: 13)]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.red,
                                                                           .font:UIFont.boldSystemFont(ofSize: 13)]
        appearance.shadowImage = UIImage()
        appearance.shadowColor = .clear
        appearance.backgroundColor = .white
        /// 调整文字位置
        appearance.stackedLayoutAppearance.normal.titlePositionAdjustment =  UIOffset(horizontal: 0, vertical: 0)
        
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        } else {
            // Fallback on earlier versions
        }
        
//        // 设置导航栏颜色
//        let navibarAppearance = UINavigationBarAppearance()
//        navibarAppearance.configureWithOpaqueBackground()
//        navibarAppearance.backgroundColor = .white
//        UINavigationBar.appearance().standardAppearance = navibarAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = navibarAppearance
        
    }
    
    
    var body: some View {
        VStack {
            TabView (selection: $selection) {
                UIKitView().tabItem {
                    Label("UIKit", image: selection != 0 ? "icon_tab10":"icon_tab11")
                }.tag(0)
                LayoutView().tabItem {
                    Label("Layout", image: selection != 1 ? "icon_tab10":"icon_tab11")
                }.tag(1)
                HomeView().tabItem {
                    Label("首页", image: selection != 2 ? "icon_tab20":"icon_tab21")
                }.tag(2)
                if #available(iOS 15.0, *) {
                    MineView().tabItem {
                        Label("我的", image: selection != 3 ? "icon_tab30":"icon_tab31")
                    }.tag(3).badge(12)
                } else {
                    // Fallback on earlier versions
                }
            }
        }
        
    }
    
}

#Preview {
    TabBarView()
}
