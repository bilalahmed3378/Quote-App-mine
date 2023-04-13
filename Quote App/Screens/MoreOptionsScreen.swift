//
//  MoreOptionsScreen.swift
//  Quote App
//
//  Created by Bilal Ahmed on 29/03/2023.
//

import SwiftUI
import StoreKit

@available(iOS 16.0, *)
struct MoreOptionsScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showShareSheet : Bool = false
    
    @Environment(\.requestReview) var requestReview



    var body: some View {
        ZStack{
            VStack{
                ZStack{
                    Image(uiImage: UIImage(named: AppImages.moreOptionsImage)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.widthBlockSize*100, height: 200)
                    
                    VStack{
                        HStack{
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Image(systemName: "arrowshape.turn.up.backward")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.white)
                                   
                            })
                           
                            Spacer()
                        }
                        .padding(.leading,20)
                        Spacer()
                    }
                    
                }
                .frame(width: UIScreen.widthBlockSize*100, height: 200)
                .padding(.top,30)


                
                
                ScrollView(.vertical, showsIndicators: false){
                    Group{
                        
                        NavigationLink(destination: LikedQuotesScreen(), label: {
                            HStack{
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .aspectRatio( contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.red)

                                Text("Liked Quotes")
                                    .foregroundColor(.black)
                                    .font(.body)
                                    .padding(.leading,5)

                            Spacer()
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        })
                        .padding(.top,40)
                        
                        NavigationLink(destination: {
                            QuoteOfTheDayMainScreen()
                        }, label: {
                            HStack{
                                Image(systemName: "quote.closing")
                                    .resizable()
                                    .aspectRatio( contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                                
                                Text("Quotes of the day")
                                    .foregroundColor(.black)
                                    .font(.body)
                                    .padding(.leading,5)
                                Spacer()
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                        })
                       
                        Divider()
                        
                    }
                    
                    Group{
//                        HStack{
//                            Image(uiImage: UIImage(named: AppImages.VibrateIcon)!)
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 20, height: 20)
//                            
//                            Text("Buzz")
//                                .foregroundColor(.black)
//                                .font(.body)
//                                .padding(.leading,5)
//                            Spacer()
//                        }
//                        .padding(.leading,20)
//                        .padding(.trailing,20)
//                        .padding(.top,10)
                        
                        NavigationLink(destination: ContactUsScreen(), label: {
                            HStack{
                                Image(uiImage: UIImage(named: AppImages.contactUsIcon)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                
                                
                                Text("Contact Us")
                                    .foregroundColor(.black)
                                    .font(.body)
                                    .padding(.leading,5)
                                Spacer()
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                        })
                     
                        
                        Button(action: {
                            requestReview()
                        }, label: {
                            HStack{
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .aspectRatio( contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                                
                                Text("Rate Us")
                                    .foregroundColor(.black)
                                    .font(.body)
                                    .padding(.leading,5)
                                Spacer()
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                        })
                       
                        
                        Button(action: {
                            self.showShareSheet = true
                        }, label: {
                            HStack{
                                Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .aspectRatio( contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                                
                                Text("Share App")
                                    .foregroundColor(.black)
                                    .font(.body)
                                    .padding(.leading,5)
                                Spacer()
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                        })
                        .sheet(isPresented: $showShareSheet) {
                                ActivityView(activityItems: ["https://apps.apple.com/us/app/best-quotes-statuses/id6447101542"])
                          
                                }
                        
                        Link(destination: URL(string: "https://codecue.solutions/quotes/privacypolicy.html")!) {
                            HStack{
                                Image(uiImage: UIImage(named: AppImages.privacyPolicyIcon)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                
                                
                                Text("Privacy Policy")
                                    .foregroundColor(.black)
                                    .font(.body)
                                    .padding(.leading,5)
                                Spacer()
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                        }
                        
                       
                        
//                        HStack{
//                            Image(systemName: "ellipsis.circle.fill")
//                                .resizable()
//                                .aspectRatio( contentMode: .fit)
//                                .frame(width: 20, height: 20)
//                                .foregroundColor(.black)
//                            
//                            Text("More Apps")
//                                .foregroundColor(.black)
//                                .font(.body)
//                                .padding(.leading,5)
//                            Spacer()
//                        }
//                        .padding(.leading,20)
//                        .padding(.trailing,20)
//                        .padding(.top,10)
                    }
                    
                    
                }
                .padding(.top,30)
                
              
                
                
                
                
                
            }
        }
        .navigationBarHidden(true)
    }
}



struct TextView: View {
    var body: some View {
        Color.green.opacity(0.4)
            .cornerRadius(20)
            .frame(width: 250, height: 100, alignment: .center)
            .overlay(
                Text("Text to Image")
                    .font(.largeTitle)
            )
            .edgesIgnoringSafeArea(.all)
    }
}


struct TextCardView: View {
    var textView = TextView()
    
    var body: some View {
        VStack {
            Text("Text outside of the textView")
            
            textView
            
            Spacer().frame(height:100)
            
            Button {
                let image = convertViewToUiImage(textView)
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            } label: {
                HStack {
                    Image(systemName: "photo.on.rectangle.angled")
                    Text("Add to Photos")
                }
                .font(.title)
                .foregroundColor(.purple)
            }
            
            Spacer()
        }
    }
    
    func convertViewToUiImage(_ myView: TextView) -> UIImage {
        var uiImage = UIImage(systemName: "exclamationmark.triangle.fill")!
        let controller = UIHostingController(rootView: myView)
       
        if let view = controller.view {
            let contentSize = view.intrinsicContentSize
            view.bounds = CGRect(origin: .zero, size: contentSize)
            view.backgroundColor = .lightGray

            let renderer = UIGraphicsImageRenderer(size: contentSize)
            uiImage = renderer.image { _ in
                view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
            }
        }
        return uiImage
    }
}
