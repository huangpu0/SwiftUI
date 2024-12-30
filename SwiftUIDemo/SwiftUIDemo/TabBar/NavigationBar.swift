//
//  NavigationView.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/17.
//

import SwiftUI

// MARK: - navigationBar background view
struct NavBar_BackgroundView: View {

    var content: AnyView?

    var body: some View {
        if content != nil {
            content
        } else {
            Color.clear
        }
    }
}

// MARK: - navigationBar leading view
struct NavBar_LeadingView: View {

    var content: AnyView?
    
    var hasBackButton: Bool = false
    
    var backButtonTapAction: WRBlock? = nil
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        if content != nil {
            content
        } else {
            Button {
                
                if backButtonTapAction != nil {
                    backButtonTapAction?()
                }else{
                    presentationMode.wrappedValue.dismiss()
                }
                
            } label: {
                if !hasBackButton {
                    Image(systemName: "chevron.left")
                }
            }

        }
    }
}

// MARK: - navigationBar title view
struct NavBar_TitleView: View {

    var content: AnyView?
    
    var title: String = ""

    var body: some View {
        if content != nil {
            content
        } else {
            Text(title).foregroundColor(.black).font(.PFMedium(17))
        }
    }
}


// MARK: - navigationBar trailing view
struct NavBar_TrailingView: View {
    
    var content: AnyView?

    var body: some View {
        if content != nil {
            content
        } else {
            Color.clear
        }
    }
}

 
// MARK: - 自定义导航栏视图
struct NavigationBar<Content>: View where Content: View {
    
    // Background of navigationBar
    private var background: NavBar_BackgroundView
    
    // The title of navigationBar (titleView default)
    private var title: String = ""

    // TitleView of navigationBar
    private var titleView: NavBar_TitleView

    // LeadingView of navigationBar
    private var leadingView: NavBar_LeadingView

    // TrailingView of navigationBar
    private var trailingView: NavBar_TrailingView

    // Max width of leadingView
    private var leadingMaxWidth: CGFloat = 80

    // Max width of trailingView
    private var trailingMaxWidth: CGFloat = 80

    // Content view between navigationBar
    private let content: Content

    public var body: some View {
        ZStack(alignment: .top) {
            ZStack {
                Color.clear
                content
            }
            .padding(.top, WRHelper.NavigationBar.bottom)
            .frame(maxHeight: WRHelper.height)
            
            ZStack(alignment: .bottom) {
                HStack(alignment: .center, spacing: 0) {
                    // leading
                    HStack(spacing: 0) {
                        leadingView
                        Spacer()
                    }
                    .padding(.leading, 15)
                    .frame(maxWidth: leadingMaxWidth)
                    .background(Color.clear)
                    
                    // title
                    titleView
                        .frame(maxWidth: .infinity)
                        .background(Color.clear)
                    
                    // trailing
                    HStack(spacing: 0) {
                        Spacer()
                        trailingView
                    }
                    .padding(.trailing, 15)
                    .frame(maxWidth: trailingMaxWidth)
                    
                }
                .frame(height: WRHelper.NavigationBar.height)
                .padding(.top, WRHelper.UnsafeArea.top)
                .background(background)
                .clipped()
                
            }
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}
 
extension NavigationBar {

    public init(@ViewBuilder content: () -> Content) {
        self.background = NavBar_BackgroundView()
        self.titleView = NavBar_TitleView()
        self.leadingView = NavBar_LeadingView()
        self.trailingView = NavBar_TrailingView()
        self.content = content()
    }
    
    // MARK: - background
    public func navBackground<Background>(_ background: Background)
    -> NavigationBar where Background: View {
        var result = self
        result.background.content = AnyView(background)
        return result
    }

    // MARK: - The title
    public func navTitle(_ title: String) -> NavigationBar {
        var result = self
        result.titleView.title = title
        return result
    }
    public func navTitleView<nv_content: View>(@ViewBuilder content: () -> nv_content) -> NavigationBar {
        let v = content()
        var result = self
        result.titleView.content = AnyView(v)
        return result
    }

    // MARK: - The BackItem
    public func navBackItemHidden(_ hidden: Bool)
    -> NavigationBar {
        var result = self
        result.leadingView.hasBackButton = hidden
        return result
    }
    public func navBackItemTapAction(_ tapAction: @escaping WRBlock)
    -> NavigationBar {
        var result = self
        result.leadingView.backButtonTapAction = tapAction
        return result
    }
    public func navLeadingView<content: View>(@ViewBuilder Leading: () -> content) -> NavigationBar {
        let v = Leading()
        var result = self
        result.leadingView.content = AnyView(v)
        return result
    }
    
    // MARK: - The TrailingView
    public func navTrailingView<content: View>(@ViewBuilder Trailing: () -> content) -> NavigationBar {
        let v = Trailing()
        var result = self
        result.trailingView.content = AnyView(v)
        return result
    }

    // MARK: - Max width of leadingView  and max width of trailingView
    public func maxWidth(leading: CGFloat = 80, trailing: CGFloat = 80) -> NavigationBar {
        var result = self
        result.leadingMaxWidth = leading
        result.trailingMaxWidth = trailing
        return result
    }
    
    

}
