//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/16.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            TabView {
                UIKitView().tabItem {
                    Label("UIKit", image: "icon_tab10")
                }
                HomeView().tabItem {
                    Label("首页", image: "icon_tab20")
                }
                MineView().tabItem {
                    Label("我的", image: "icon_tab30")
                }.badge(12)
            }
        }.onAppear {
            UITabBar.appearance().unselectedItemTintColor = .black
            UITabBarItem.appearance().badgeColor = .red
            UITabBar.appearance().backgroundColor = .yellow
            UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 5)
            UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.red,
                                                              .font: UIFont.boldSystemFont(ofSize: 14)],
                                                             for: .normal)
            UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.red,
                                                              .font: UIFont.boldSystemFont(ofSize: 14)],
                                                             for: .selected)
        }
        
    }
    
}

#Preview {
    ContentView()
}
