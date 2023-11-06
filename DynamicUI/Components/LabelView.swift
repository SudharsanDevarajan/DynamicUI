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
        Text(label.text)
            .font(.system(size: label.fontSize))
    }
}



