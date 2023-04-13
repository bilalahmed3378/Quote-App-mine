//
//  ContactUsScreen.swift
//  Quote App
//
//  Created by Bilal Ahmed on 02/04/2023.
//

import SwiftUI

struct ContactUsScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var name : String = ""
    @State var email : String = ""
    @State var message : String = ""
    @State var whatsapp : String = ""
    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    @StateObject var contactus = ContactUsApi()


    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()

                    }, label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                    })
                  
                    
                    Text("Contact Us")
                        .foregroundColor(.blue)
                        .font(.headline)
                        .padding(.leading,5)
                    
                    Spacer()
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                TextField("Enter Your Name", text: self.$name)
                    .foregroundColor(.black)
                    .font(.body)
                    .padding(15)
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(.gray))
                    .padding(.top,10)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                
                TextField("Enter Your Email", text: self.$email)
                    .foregroundColor(.black)
                    .font(.body)
                    .padding(15)
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(.gray))
                    .padding(.top,10)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                
                TextField("Enter Your Message", text: self.$message)
                    .foregroundColor(.black)
                    .font(.body)
                    .padding(15)
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(.gray))
                    .padding(.top,10)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                
                TextField("Enter Your Whatsapp Number", text: self.$whatsapp)
                    .foregroundColor(.black)
                    .font(.body)
                    .padding(15)
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(.gray))
                    .padding(.top,10)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                
                
                if(self.contactus.isLoading){
                    ProgressView()
                        .padding(20)
                        .onDisappear{
                            if(self.contactus.dataRetrivedSuccessfully){
                                self.showToast = true
                                self.toastMessage = "Message Send Successfully"
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    presentationMode.wrappedValue.dismiss()

                                }
                            }
                        }
                }
                
                else{
                    
                    Button(action: {
                        if(self.name.isEmpty){
                            self.showToast = true
                            self.toastMessage = "Please enter your Name"
                        }
                        else if(self.email.isEmpty){
                            self.showToast = true
                            self.toastMessage = "Please enter your Email"
                        }
                        else if(self.message.isEmpty){
                            self.showToast = true
                            self.toastMessage = "Please enter your message"
                        }
                        else if(self.whatsapp.isEmpty){
                            self.showToast = true
                            self.toastMessage = "Please enter your whatsapp number"
                        }
                        else {
                            self.contactus.chat(message: self.message, email: self.email, name: self.name, whatsapp: Int(self.whatsapp)!)
                        }
                    }, label: {
                        HStack{
                            Spacer()
                            Text("Send Message")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        .padding(20)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,20)
                        
                    })
                    .disabled(self.showToast)
                }
                
                Spacer()
             
            }
            
            if(showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }

        }
        .navigationBarHidden(true)
    }
}

