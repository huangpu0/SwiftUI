//
//  CusNavigationView.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/17.
//

import SwiftUI

struct CusNavigationView: View {
    
    var navTitle: String = ""
    
    init(navTitle: String) {
        self.navTitle = navTitle
    }
    
    var body: some View {
        NavigationView {
            Text("")
                .navigationBarTitle(navTitle, displayMode: .inline)
                .navigationBarItems(leading: CustomBackButton())
        }.onAppear {
            let navibarAppearance = UINavigationBarAppearance()
            navibarAppearance.configureWithOpaqueBackground()
            navibarAppearance.backgroundColor = .orange
            UINavigationBar.appearance().standardAppearance = navibarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navibarAppearance
        }
    }
    
}

struct CustomBackButton: View {
    var body: some View {
        Button(action: {
            // 返回上一页的操作
            print("Back button tapped")
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.white)
        }
    }
}

#Preview {
    CusNavigationView(navTitle: "")
}
