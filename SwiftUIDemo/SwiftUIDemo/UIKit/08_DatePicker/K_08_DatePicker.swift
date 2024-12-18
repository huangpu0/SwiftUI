//
//  K_08_DatePicker.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/18.
//

import SwiftUI

struct K_08_DatePicker: View {
    
    @State var nv_Date: Date = Date()
    
    var body: some View {
        
        DatePicker("日期控件", selection: $nv_Date,  in: dateRange(), displayedComponents: .date)
            .datePickerStyle(.wheel)
            .environment(\.locale, Locale.init(identifier: "zh_CN")) /// 中文显示
            .fixedSize()
    }
    
    func dateRange() -> ClosedRange<Date> {
        let start = Calendar.current.date(from: DateComponents(year: 1900, month: 1, day: 1))!
        let end = Calendar.current.date(from: DateComponents(year: 2100, month: 1, day: 1))!
        return start...end
    }
    
}

#Preview {
    K_08_DatePicker()
}
