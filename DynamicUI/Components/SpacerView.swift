//
//  SpacerView.swift
//  DynamicUI
//
//  Created by htcuser on 02/11/23.
//

import SwiftUI

struct SpacerView: View {
    @Binding var hspace: Int
    @Binding var vspace: Int
    
    var body: some View {
        VStack{
            Spacer()
                .frame(width: CGFloat(hspace), height: CGFloat(hspace))
        }
    }
}
