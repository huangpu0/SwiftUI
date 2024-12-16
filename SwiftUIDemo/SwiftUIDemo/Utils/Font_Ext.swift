//
//  Font_Ext.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/16.
//

import SwiftUI

public enum PingFangSCType {
    case Medium
    case Semibold
    case Light
    case Ultralight
    case Regular
    case Thin
    
    var description: String {
        switch self {
        case .Medium: return "Medium"
        case .Semibold: return "Semibold"
        case .Light: return "Light"
        case .Ultralight: return "Ultralight"
        case .Regular: return "Regular"
        case .Thin: return "Thin"
        }
    }
    
}


extension Font {
    
    class PingFang {
        
        public static func Font(ofSize size: CGFloat, subType: PingFangSCType = .Regular) -> Font {
            return custom("PingFangSC-\(subType.description)", size: size)
        }
        
    }
    
    static func PFRegular(_ size: CGFloat) -> Font {
        return Font.PingFang.Font(ofSize: size)
    }
    static func PFMedium(_ size: CGFloat) -> Font {
        return Font.PingFang.Font(ofSize: size, subType: .Medium)
    }
   
    
}
