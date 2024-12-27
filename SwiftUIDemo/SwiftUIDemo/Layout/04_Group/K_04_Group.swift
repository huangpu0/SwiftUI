//
//  K_04_Group.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/19.
//

import SwiftUI

struct K_04_Group: View {
    var body: some View {
        
        ScrollView{
            
            Group {
                Text("Hello World !11")
                Text("Hello World !22")
                
                Group {
                    Text("Hello World !33")
                    Text("Hello World !44")
                }.background(Color.blue)
                
            }.background(Color.red)
            
//            Group {
//                Text("Hello World !33")
//                Text("Hello World !44")
//            }.background(.blue)
            
        }
        
    }
}

#Preview {
    K_04_Group()
}
