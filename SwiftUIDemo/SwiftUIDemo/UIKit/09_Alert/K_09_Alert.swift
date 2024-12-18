//
//  K_09_Alert.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/18.
//

import SwiftUI

struct K_09_Alert: View {
    
    @State var showAlert: Bool = false
    @State var showSheet: Bool = false
    
    // 弹窗的显示状态
    @State private var showingPopup: Bool = false
    
    var body: some View {
        
        VStack {
            
            Button("默认Alert不能修改字体大小颜色") {
                showAlert.toggle()
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("标题呀"), message: Text("副标题呀"),
                      primaryButton: .default(Text("默认样式"), action: {
                    print("点击事件")
                }), secondaryButton: .cancel(Text("取消")))
            }
            
            Button("默认Sheet不能修改字体大小颜色") {
                showSheet.toggle()
            }.actionSheet(isPresented: $showSheet) {
                ActionSheet(title: Text("sheet标题"),
                            message: Text("sheet副标题"),
                            buttons: [
                                .default(Text("actionsheet"), action: {
                                    print("点击actionsheet1")
                                }),
                                .cancel(),
                            ]
                )
            }
            
            Button("自定义Alert") {
                withAnimation {
                    showingPopup.toggle()
                }
            }.fullScreenCover(isPresented: $showingPopup) {
                
                CusAlertView(isPresented: $showingPopup,
                             title: "自定义Alert标题呀",
                             sub_title: "自定义Alert副标题呀",
                             cancel: "取消",
                             block1: {
                    print("取消啦")
                },
                             sure: "确定",
                             block2:  {
                    print("确定啦")
                })
            }
            
        }
       
    }
}

#Preview {
    K_09_Alert()
}
