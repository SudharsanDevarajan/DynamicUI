//
//  ButtonView.swift
//  DynamicUI
//
//  Created by htcuser on 02/11/23.
//

import SwiftUI

struct MyButtonView: View {
    
    var buttonModel: ButtonModel
    var action: () -> Void
    
    var body: some View {
        VStack{
            Button {
                action()
            } label: {
                Text(buttonModel.text ?? "Nil")
                    .padding(.horizontal,24)
                    .padding(.vertical,16)
                    .backgroundStyle(Color.red)
                    .clipShape(Capsule())
            }
            .buttonStyle(.plain)
            
        }
    }
}
