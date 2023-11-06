//
//  CreateOrderView.swift
//  DynamicUI
//
//  Created by htcuser on 01/11/23.
//

import SwiftUI

struct CreateOrderView: View {
    
    @StateObject var viewModel = ServerDrivenViewModel()
    
    var body: some View {
        VStack{
            Text("Dynamic Drivern UI")
        }
        .onAppear{
            viewModel.fetchCreateOrderUI()
        }
    }
}

#Preview {
    CreateOrderView()
}
