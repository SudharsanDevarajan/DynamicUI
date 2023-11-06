//
//  CreateOrderView.swift
//  DynamicUI
//
//  Created by htcuser on 01/11/23.
//

import SwiftUI



struct CreateOrderView: View {
    
    @StateObject var viewModel = CreateOrderViewModel()
    
    var body: some View {
        VStack{
            if let element = viewModel.createOrderModel?.elements{
                ForEach(element) { element in
                    if element.type == "column"{
                        VStack{
                            ForEach(element.children) { children in
                                Text("Hello")
    //                            if children.type == "label" && children.label != nil{
    //                                LabelView(label: children.label!)
    //                            }else if children.type == "textField" && children.textField != nil{
    //                                TextFieldView(textString: $viewModel.deliverTo, textFieldData: children.textField!)
    //                            }else if children.type == "spacer"{
    //                                if let spacer = children.space{
    //                                    VStack{
    //                                    }.frame(height: CGFloat(spacer.vSpace ?? 0))
    //                                }
    //                            }
                            }
                        }
                    }else if element.type == "row"{
                        
                    }
                }
            }
        }
        .onAppear{
            viewModel.fetchCreateOrderUI()
        }
            
    }
    
    func constructView(with children: [CommonComponentModel]) -> some View{
        List(children) { item in
            if item.type == "label"{
                LabelView(label: item.label!)
            }
        }
    }
}

#Preview {
    CreateOrderView()
}
