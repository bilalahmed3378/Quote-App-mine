//
//  GetQuotesByCategoryApi.swift
//  Quote App
//
//  Created by Bilal Ahmed on 30/03/2023.
//

import Foundation
import SwiftUI

class GetQuotesByCategoryApi : ObservableObject{
    
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var dataRetrivedSuccessfully = false
    @Published var apiResponse :  GetQuotesByCategoryResponseModel?
    
    
    
    
    func getQuotes(quoteList : Binding<[GetQuotesByCategoryDocsModel]>, quoteCategory : String){
        
        self.isLoading = true
        self.isApiCallSuccessful = true
        self.dataRetrivedSuccessfully = false
        self.isApiCallDone = false
        
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.quotebycategory + "?page=1&limit=10&category=\(quoteCategory)") else {return}
        
        
        

        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(NetworkConfig.secretKey, forHTTPHeaderField: "secretkey")

        
        
        
        //:end
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.isApiCallSuccessful=false
                    self.isLoading = false
                }
                return
            }
            //If sucess
            
            
            do{
                print("Got quotes response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(GetQuotesByCategoryResponseModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    
                    if(main.message == "Ok" ){
                        self.dataRetrivedSuccessfully = true
                        quoteList.wrappedValue.removeAll()
                        quoteList.wrappedValue.append(contentsOf: main.docs)
                          
                    }
                 
                    else{
                        self.dataRetrivedSuccessfully = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    print(error)
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.dataRetrivedSuccessfully = false
                    self.isLoading = false
                }
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print(responseJSON)
        }
        
        task.resume()
    }
    
    
    
}
