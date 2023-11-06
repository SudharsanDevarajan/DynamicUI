//
//  CreateOrderViewModel.swift
//  DynamicUI
//
//  Created by htcuser on 02/11/23.
//

import Foundation


class CreateOrderViewModel: ObservableObject{
    @Published var createOrderModel: DynamicModel?
    
    @Published var deliverTo: String = ""
    
    func fetchCreateOrderUI(){
        if let path = Bundle.main.path(forResource: "CreateOrder", ofType: "json") {
            do {
                let url = URL(fileURLWithPath: path)
                let jsonData = try Data(contentsOf: url)
                                
                // Example: Decoding JSON into a model
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(DynamicModel.self, from: jsonData)
                
                // You can access the decoded data in `decodedData`
                debugPrint("Json \(decodedData)")
                self.createOrderModel = decodedData
                
            } catch {
                print("Error loading JSON data: \(error)")
            }
        } else {
            print("JSON file not found in the bundle")
        }
    }
    
}
