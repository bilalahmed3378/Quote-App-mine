//
//  LikedQuotesScreen.swift
//  Quote App
//
//  Created by Bilal Ahmed on 04/04/2023.
//

import SwiftUI

@available(iOS 16.0, *)
struct LikedQuotesScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    
    @StateObject var coreDataViewModel = CoreDataViewModel()
    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    
    
    
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
                    
                    
                    Text("Liked Quotes")
                        .foregroundColor(.blue)
                        .font(.headline)
                        .padding(.leading,5)
                    
                    Spacer()
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                ScrollView(.vertical, showsIndicators: false){
                    
                    ForEach(self.coreDataViewModel.quoteRecords, id: \.self){ value in
                        
                        LikedQuotesCard(quotesRecord: value, showToast: self.$showToast, toastMessage: self.$toastMessage, quoteList: self.$coreDataViewModel.quoteRecords)
                        
                    }
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


@available(iOS 16.0, *)
struct LikedQuotesCard : View {
    
    let quotesRecord: LikedQuotes
    
    @Binding var showToast : Bool
    @Binding var toastMessage : String
    
    @State private var copied = false
    
    @State private var currentIndex = 0
    
    let imageNames = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80" ]
    
    @State private var showShareSheet : Bool = false
    
    let coreDataViewModel = CoreDataViewModel()
    
    @Binding var quoteList: [LikedQuotes]

    
    
    @State private var isText : Bool = false
    
    @State private var Liked = true
    
    @State private var selected : Int = 0
    
    @State private var addLogo : Bool = false

    
    
    var body: some View {
        
        ZStack{
            VStack{
                
                myView
                
                
                HStack{
                    Spacer()
                    Button(action: {
                        if(self.Liked){
                            self.coreDataViewModel.deleteItem(quote: quotesRecord)
                            
                            self.Liked = false
                            self.quoteList.removeAll{$0.id == self.quotesRecord.id}
                            
                        }
                        else{
                            self.coreDataViewModel.addItem(name: self.quotesRecord.quote ?? "")
                            self.Liked = true
                        }
                        
                    }, label: {
                        VStack{
                            Image(systemName: "heart.fill")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .foregroundColor(self.Liked ? .red :  .black)
                            
                            Text("Like")
                                .foregroundColor(self.Liked ? .red :  .black)
                                .font(.body)
                        }
                       
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                        self.showToast = true
                        self.toastMessage = "Image Saved Successfully"
                        
                        guard let image = ImageRenderer(content: imageView).uiImage else{
                            
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
                        UIPasteboard.general.string = "\(self.quotesRecord.quote ?? "")"
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
            let images = ImageRenderer(content: imageView).uiImage
            
            if(self.isText){
                ActivityView(activityItems: [self.quotesRecord.quote ?? "", "Shared By : https://apps.apple.com/us/app/best-quotes-statuses/id6447101542"])
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
                
                
                Text(self.quotesRecord.quote ?? "")
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
                
                if(self.addLogo){
                    HStack{
                        Image("logoName")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .onAppear{
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                    
                                    self.addLogo = false
                                    
                                }
                            }
                            .padding(.top,20)
                           
                    }
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
    
    var imageView : some View{
        
        ZStack{
            Image(imageNames[currentIndex])
                .resizable()
                .frame(height: 540)
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


                Text(self.quotesRecord.quote ?? "")
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
                
              
                    HStack{
                        Image("logoName")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .onAppear{
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                    
                                    self.addLogo = false
                                    
                                }
                            }
                            .padding(.top,30)
                           
                    }
                
            }


        }
        .frame(width: UIScreen.screenWidth - 40, height: 540)
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


