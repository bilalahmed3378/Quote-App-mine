//
//  Toast.swift
//  cars conneted
//
//  Created by Bilal Ahmed on 13/12/2022.
//

import Foundation
import SwiftUI

struct Toast: View {
    
    @Binding var isShowing : Bool
    let message : String
    
    var body: some View {
        
        VStack{
            
            Spacer()

            VStack(alignment:.leading){
                
                
                HStack{
                    Text(self.message)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.bottom,5)
                        .padding(.top , 5)
                }
            }
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 0).fill(.white))
            .cornerRadius(10.0)
            .padding(.bottom , 20)
            .padding(.leading , 20)
            .padding(.trailing , 20)
            .shadow(radius: 10,  y: 10)
            
            
          
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                if(self.isShowing){
                    isShowing.toggle()
                }
            }
        })
    }
    
}
