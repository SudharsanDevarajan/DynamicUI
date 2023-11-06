//
//  AppLabelView.swift
//  DynamicUI
//
//  Created by htcuser on 31/10/23.
//

import SwiftUI


struct LabelView: View{
    
    var label: LabelModel
    
    var body: some View {
        Text(label.text ?? "")
            .font(.custom("Roboto", size: CGFloat(label.size ?? 0)))
            .frame(maxWidth: .infinity,alignment: alignment(align: label.alignment ?? "left"))
    }
    
    func alignment(align: String) -> Alignment{
        switch align{
        case "right":
            return .trailing
        case "center":
            return .center
        default:
            return .leading
        }
    }
}



