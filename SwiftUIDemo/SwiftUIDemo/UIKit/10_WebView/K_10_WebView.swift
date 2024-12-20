//
//  K_10_WebView.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/19.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct K_10_WebView: View {
    var body: some View {
        WebView(url: URL(string: "https://www.baidu.com")!)
    }
}

#Preview {
    K_10_WebView()
}
