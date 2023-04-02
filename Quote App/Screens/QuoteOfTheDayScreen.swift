//
//  QuoteOfTheDayScreen.swift
//  Quote App
//
//  Created by Bilal Ahmed on 01/04/2023.
//

import SwiftUI

@available(iOS 16.0, *)
struct QuoteOfTheDayScreen: View {
    @Environment(\.presentationMode) var presentationMode

    @State var notificationInfo: [AnyHashable: Any]

    
    @State private var copied = false
    
    @State private var currentIndex = 0
    
    let imageNames = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75" ]
    
    @State private var showShareSheet : Bool = false

    @State private var isText : Bool = false
    
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
                  
                    
                    Text("Quote of the day")
                        .foregroundColor(.blue)
                        .font(.headline)
                        .padding(.leading,5)
                    
                    Spacer()
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
               
             
                ZStack{
                    VStack{
                      
                       myView
                        
                       
                        HStack{
                            Spacer()
                            Button(action: {

                            }, label: {
                                VStack{
                                    Image(systemName: "heart")
                                        .resizable()
                                        .aspectRatio( contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                    
                                    Text("Like")
                                        .foregroundColor(.black)
                                        .font(.body)
                                }
                            })
                          
                            Spacer()
                            
                            Button(action: {
                                

                                guard let image = ImageRenderer(content: myView).uiImage else{
                                    
                                    return
                                }
                                
                                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)

                            }, label: {
                                VStack{
                                    Image(systemName: "square.and.arrow.down")
                                        .resizable()
                                        .aspectRatio( contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                    
                                    Text("Save")
                                        .foregroundColor(.black)
                                        .font(.body)
                                }
                            })
                           
                            Spacer()
                            

                            Menu(content: {
                                Button(action: {
                                    self.showShareSheet = true
                                    self.isText = true
                                }, label: {
                                    Text("Share as Text")
                                })
                                
                                Button(action: {
                                    self.showShareSheet = true
                                    self.isText = false

                                   
                                }, label: {
                                    Text("Share as Image")
                                })
                            }, label: {
                                VStack{
                                    Image(systemName: "square.and.arrow.up")
                                        .resizable()
                                        .aspectRatio( contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                    
                                    Text("Share")
                                        .foregroundColor(.black)
                                        .font(.body)
                                }
                                
                            })
                          
                            Spacer()
                            Button(action: {
                                UIPasteboard.general.string = "self.quoteList.quote"
                                self.copied = true
                            }, label: {
                                VStack{
                                    Image(systemName: "doc.on.doc")
                                        .resizable()
                                        .aspectRatio( contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                    
                                    Text("Copy")
                                        .foregroundColor(.black)
                                        .font(.body)
                                }
                            })
                            .alert(isPresented: $copied) {
                                Alert(title: Text("Copied"), message: Text("The text has been copied to the clipboard."), dismissButton: .default(Text("OK")))
                            }
                            Spacer()
                        }
                        .padding(.top,10)
                        .padding(.bottom,20)
                        .background(.white)
                        .frame(height: 60)
                    }
                    .frame(width: UIScreen.screenWidth - 40, height: 300)
                    .cornerRadius(10)
                    .shadow(radius: 5)

                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .sheet(isPresented: $showShareSheet) {
                    let images = ImageRenderer(content: myView).uiImage

                    if(self.isText){
                        ActivityView(activityItems: ["self.quoteList.quote"])
                    }
                    else{
                        ActivityView(activityItems: [images as Any])
                    }

                    
                        }
                
               
               
                
                
            }
        }
        .navigationBarHidden(true)
    }
    
    var myView : some View{
        
        ZStack{
            Image(imageNames[currentIndex])
                .resizable()
                .frame(height: 240)
                .aspectRatio(contentMode: .fill)

            VStack{
                HStack{
                    Image(uiImage: UIImage(named: AppImages.CommaWhite)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 15, height: 15)
                        .padding(.leading,30)

                    Image(uiImage: UIImage(named: AppImages.CommaWhite)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 15, height: 15)

                    Spacer()
                }


                Text(notificationInfo["content"] as? String ?? "")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.leading,30)
                    .padding(.trailing,30)


                HStack{
                    Spacer()

                    Image(uiImage: UIImage(named: AppImages.CommaWhiteDown)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 15, height: 15)

                    Image(uiImage: UIImage(named: AppImages.CommaWhiteDown)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 15, height: 15)
                        .padding(.trailing,30)


                }
            }


        }
        .frame(width: UIScreen.screenWidth - 40, height: 240)
        .onTapGesture {
            if currentIndex == imageNames.count - 1 {
                currentIndex = 0
            } else {
                currentIndex += 1
            }
        }
    }
}

