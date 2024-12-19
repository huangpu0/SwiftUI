//
//  K_06_Form.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/19.
//

import SwiftUI

struct K_06_Form: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    
    var body: some View {
        VStack {
            
            Text("顶部文字")
            
            if #available(iOS 16.0, *) {
                Form {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                }.formStyle(.columns)
            } else {
                // Fallback on earlier versions
            }
            
            if #available(iOS 16.0, *) {
                Form {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                }.formStyle(.grouped)
            } else {
                // Fallback on earlier versions
            }
            
            Text("底部文字")
        }
        
    }
}

#Preview {
    K_06_Form()
}
