//
//  QuotesByCategoryScreen.swift
//  Quote App
//
//  Created by Bilal Ahmed on 27/03/2023.
//

import SwiftUI
import UIKit
import Foundation
import PhotosUI

@available(iOS 16.0, *)
struct QuotesByCategoryScreen: View {
   
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var quotesApi = GetQuotesByCategoryApi()

    @State var quotesList : [GetQuotesByCategoryDocsModel] = []
    



     var screenName : String
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
                  
                    
                    Text("\(self.screenName)")
                        .foregroundColor(.blue)
                        .font(.headline)
                        .padding(.leading,5)
                    
                    Spacer()
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                if(self.quotesApi.isLoading){
                    Spacer()
                    ProgressView()
                        .padding()
                    Spacer()

                }
                
                else if(self.quotesApi.isApiCallDone && !(self.quotesApi.isApiCallSuccessful)){
                    Spacer()

                    
                    Text("No Quote Available")
                    
                    Spacer()

                }
                
                else if(self.quotesApi.isApiCallDone && self.quotesApi.isApiCallSuccessful){
                    if(self.quotesApi.dataRetrivedSuccessfully){
//                        if(self.quotesApi.apiResponse?.docs[0].category == self.screenName){
                            ScrollView(.vertical, showsIndicators: false){
                                LazyVStack{
                                    ForEach(self.quotesList.indices, id: \.self){ index in
                                        QuoteCards( quoteList: self.quotesList[index])
                                    }
                                   
                                }
                                .padding(.bottom,10)
                               
                            }
                     //   }
                       
                    }
                    
                    else{
                        Spacer()

                        Text("No Quote Available")
                        Spacer()

                    }
                   
                   
                }
                
                else{
                    Spacer()

                    Text("No Quote Available")
                    Spacer()

                }
               
                
                
            }
        }
        .navigationBarHidden(true)
        .onAppear{
            quotesApi.getQuotes(quoteList: self.$quotesList, quoteCategory: self.screenName)
        }
        
    }
    
    
}

@available(iOS 16.0, *)
struct QuoteCards : View{
    

    let quoteList : GetQuotesByCategoryDocsModel
    
    @State private var copied = false
    
    @State private var currentIndex = 0
    
    let imageNames = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75" ]
    
    @State private var showShareSheet : Bool = false

    @State private var isText : Bool = false

   
    var body: some View{
        
      
        ZStack{
            VStack{
              
                
              
              myView
                
               
                HStack{
                    Spacer()
                    Button(action: {
                        LocalStorage.myValue = "dfgfgdfg"

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
                        UIPasteboard.general.string = self.quoteList.quote
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
                ActivityView(activityItems: [self.quoteList.quote])
            }
            else{
                ActivityView(activityItems: [images as Any])
            }

            
                }
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


                Text("\(self.quoteList.quote)")
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
            let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                impactHeavy.impactOccurred()
            
            if currentIndex == imageNames.count - 1 {
                currentIndex = 0
            } else {
                currentIndex += 1
            }
        }
    }
   
   
}


struct ActivityView: UIViewControllerRepresentable {
    let activityItems: [Any]
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityView>) {

    }
}


//////
///////
///
//////



class LocalStorage {
    
    private static let quoteText: String = "myQuote"
    
    public static var myValue: String {
        set {
            UserDefaults.standard.set(newValue, forKey: quoteText)
        }
        get {
            return UserDefaults.standard.string(forKey: quoteText) ?? ""
        }
    }
    
    public static func removeValue() {
        UserDefaults.standard.removeObject(forKey: quoteText)
    }
    
}


//////
///////
///
///
///
///

extension UIView {
    func captureImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

struct ImageWrapper: Identifiable {
    let id = UUID()
    let image: UIImage
}
