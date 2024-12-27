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
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 13)]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.red,.font:UIFont.boldSystemFont(ofSize: 13)]
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
        
        // 设置导航栏颜色
        let navibarAppearance = UINavigationBarAppearance()
        navibarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black,.font:UIFont.boldSystemFont(ofSize: 15)]
        navibarAppearance.configureWithOpaqueBackground()
        navibarAppearance.backgroundColor = .white
        navibarAppearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = navibarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navibarAppearance
        
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
                    MineView().tabItem {
                        Label("我的", image: selection != 3 ? "icon_tab30":"icon_tab31")
                    }.tag(3)
                }
            }
        }
        
    }
    
}

#Preview {
    TabBarView()
}


extension UIApplication {
    var key: UIWindow? {
        self.connectedScenes
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?
            .windows
            .filter({$0.isKeyWindow})
            .first
    }
}
//扩展底层的UIView 以获取到TabBar属性
extension UIView {
    func allSubviews() -> [UIView] {
        var subs = self.subviews
        for subview in self.subviews {
            let rec = subview.allSubviews()
            subs.append(contentsOf: rec)
        }
        return subs
    }
}
//修改TabBar
struct TabBarModifier {
    static func showTabBar() {
        UIApplication.shared.key?.allSubviews().forEach({ subView in
            if let view = subView as? UITabBar {
                view.backgroundColor = .systemGray5 //BUGS: 后台驻足时间够长，返回时TabBar无背景
                view.barTintColor = .systemBackground//BUGS: 后台驻足时间够长，返回时TabBar无背景
                view.isHidden = false //将TabBar隐藏
            }
        })
    }
    
    static func hideTabBar() {
        UIApplication.shared.key?.allSubviews().forEach({ subView in
            if let view = subView as? UITabBar {
                view.isHidden = true//显示 TabBar
            }
        })
    }
}
//使用 ViewModifier 显示TabBar
struct ShowTabBar: ViewModifier {
    func body(content: Content) -> some View {
        return content.padding(.zero).onAppear {
            TabBarModifier.showTabBar()
        }
    }
}
//同上 隐藏TabBar
struct HiddenTabBar: ViewModifier {
    func body(content: Content) -> some View {
        return content.padding(.zero).onAppear {
            TabBarModifier.hideTabBar()
        }
    }
}
//方便调用
extension View {
    var showTabBar:some View {
        return self.modifier(ShowTabBar())
    }
    var hiddenTabBar:some View {
        return self.modifier(HiddenTabBar())
    }
}
