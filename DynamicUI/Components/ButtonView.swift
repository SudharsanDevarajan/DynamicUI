//
//  ButtonView.swift
//  DynamicUI
//
//  Created by htcuser on 02/11/23.
//

import SwiftUI

struct ButtonView: View {
    
    var buttonModel: ButtonModel
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(buttonModel.text ?? "Nil")
        }

    }
}
