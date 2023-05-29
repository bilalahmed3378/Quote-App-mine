//
//  HomeScreen.swift
//  Quote App
//
//  Created by Bilal Ahmed on 25/03/2023.
//

import SwiftUI
import Firebase
import FirebaseMessaging
import GoogleMobileAds


@available(iOS 16.0, *)
struct HomeScreen: View {
    @State var searchText = ""


    @State var  showAd : Bool = false
    


 
   
   let cards = [
    Cardss(title: "alone",  imageName: "alone"),
    Cardss(title: "Angry",  imageName: "Angry"),
    Cardss(title: "Anniversary",  imageName: "Anniversary"),
    Cardss(title: "Attitude",  imageName: "Attitude"),
    Cardss(title: "Awesome",  imageName: "Awesome"),
    Cardss(title: "Awkward",  imageName: "Awkward"),
    Cardss(title: "Beautiful",  imageName: "Beautiful"),
    Cardss(title: "Best",  imageName: "Best"),
    Cardss(title: "Bike",  imageName: "Bike"),
    Cardss(title: "Birthday",  imageName: "Birthday"),
    Cardss(title: "Breakup",  imageName: "Breakup"),
    Cardss(title: "Brother",  imageName: "Brother"),
    Cardss(title: "Busy",  imageName: "Busy"),
    Cardss(title: "Cheat",  imageName: "Cheat"),
    Cardss(title: "Childhood",  imageName: "Childhood"),
    Cardss(title: "Clever",  imageName: "Clever"),
    Cardss(title: "College",  imageName: "College"),
    Cardss(title: "Cool",  imageName: "Cool"),
    Cardss(title: "Creative",  imageName: "Creative"),
    Cardss(title: "Cute",  imageName: "Cute"),
    Cardss(title: "Dance",  imageName: "Dance"),
    Cardss(title: "Emotional",  imageName: "Emotional"),
    Cardss(title: "Exam",  imageName: "Exam"),
    Cardss(title: "Facebook",  imageName: "Facebook"),
    Cardss(title: "Family",  imageName: "Family"),
    Cardss(title: "Fathers Day",  imageName: "Father’s_Day"),
    Cardss(title: "Flirt",  imageName: "Flirt"),
    Cardss(title: "Food",  imageName: "Food"),
    Cardss(title: "Forgiveness",  imageName: "Forgiveness"),
    Cardss(title: "Friends",  imageName: "Friends"),
    Cardss(title: "Funny",  imageName: "Funny"),
    Cardss(title: "God",  imageName: "God"),
    Cardss(title: "Good morning",  imageName: "Good_morning"),
    Cardss(title: "Good night",  imageName: "Good_night"),
    Cardss(title: "Gym",  imageName: "Gym"),
    Cardss(title: "Happiness",  imageName: "Happiness"),
    Cardss(title: "Hate You",  imageName: "Hate_You"),
    Cardss(title: "Heart Touching",  imageName: "Heart_Touching"),
    Cardss(title: "Heartbreak",  imageName: "Heartbreak"),
    Cardss(title: "Hindi",  imageName: "Hindi"),
    Cardss(title: "Home",  imageName: "Home"),
    Cardss(title: "Hot",  imageName: "Hot"),
    Cardss(title: "Hurt",  imageName: "Hurt"),
    Cardss(title: "Husband",  imageName: "Husband"),
    Cardss(title: "Inspiration",  imageName: "Inspiration"),
    Cardss(title: "Insult",  imageName: "Insult"),
    Cardss(title: "Jealous",  imageName: "Jealous"),
    Cardss(title: "Kids",  imageName: "Kids"),
    Cardss(title: "Kiss",  imageName: "Kiss"),
    Cardss(title: "Life",  imageName: "Life"),
    Cardss(title: "Lonely",  imageName: "Lonely"),
    Cardss(title: "Love",  imageName: "Love"),
    Cardss(title: "Marriage",  imageName: "Marriage"),
    Cardss(title: "Men",  imageName: "Men"),
    Cardss(title: "Miss You",  imageName: "Miss_You"),
    Cardss(title: "Monday",  imageName: "Monday"),
    Cardss(title: "Mothers day",  imageName: "Mothers_day"),
    Cardss(title: "Motivational",  imageName: "Motivational"),
    Cardss(title: "Moving On",  imageName: "Moving_On"),
    Cardss(title: "Music",  imageName: "Music"),
    Cardss(title: "Naughty",  imageName: "Naughty"),
    Cardss(title: "Pain",  imageName: "Pain"),
    Cardss(title: "Parents",  imageName: "Parents"),
    Cardss(title: "Party",  imageName: "Party"),
    Cardss(title: "Pets",  imageName: "Pets"),
    Cardss(title: "Punjabi",  imageName: "Punjabi"),
    Cardss(title: "Rain",  imageName: "Rain"),
    Cardss(title: "Relationship",  imageName: "Relationship"),
    Cardss(title: "Romantic",  imageName: "Romantic"),
    Cardss(title: "Sad",  imageName: "Sad"),
    Cardss(title: "School",  imageName: "School"),
    Cardss(title: "Selfie",  imageName: "Selfie"),
    Cardss(title: "Selfish",  imageName: "Selfish"),
    Cardss(title: "Shopping",  imageName: "Shopping"),
    Cardss(title: "Sick",  imageName: "Sick"),
    Cardss(title: "Single",  imageName: "Single"),
    Cardss(title: "Sister",  imageName: "Sister"),
    Cardss(title: "Smart",  imageName: "Smart"),
    Cardss(title: "Smile",  imageName: "Smile"),
    Cardss(title: "Sorry",  imageName: "Sorry"),
    Cardss(title: "Success",  imageName: "Success"),
    Cardss(title: "Summer",  imageName: "Summer"),
    Cardss(title: "Sunday",  imageName: "Sunday"),
    Cardss(title: "Sweet",  imageName: "Sweet"),
    Cardss(title: "Tears",  imageName: "Tears"),
    Cardss(title: "Technology",  imageName: "Technology"),
    Cardss(title: "Thank you",  imageName: "Thank_you"),
    Cardss(title: "Though",  imageName: "Though"),
    Cardss(title: "Tired",  imageName: "Tired"),
    Cardss(title: "True",  imageName: "True"),
    Cardss(title: "Trust",  imageName: "Trust"),
    Cardss(title: "Unique",  imageName: "Unique"),
    Cardss(title: "Weekend",  imageName: "Weekend"),
    Cardss(title: "Whatsapp",  imageName: "Whatsapp"),
    Cardss(title: "Wife",  imageName: "Wife"),
    Cardss(title: "Winter",  imageName: "Winter"),
    Cardss(title: "Wise",  imageName: "Wise"),
    Cardss(title: "Women",  imageName: "Women"),
    Cardss(title: "Work",  imageName: "Work")
   
]
    
    var filteredCards: [Cardss] {
           if searchText.isEmpty {
               return cards
           } else {
               return cards.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
           }
       }
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Best Quotes & Statuses")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    NavigationLink(destination: MoreOptionsScreen(), label: {
                        Image(uiImage: UIImage(named: AppImages.menuIcon)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 24, height: 24)
                    })
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,20)
                
                                TextField("Search user name here", text: self.$searchText)
                                    .foregroundColor(.black)
                                    .font(.body)
                                    .padding(15)
                                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(.gray))
                                    .overlay(
                                        HStack{
                                            Spacer()
                                            Image(systemName: "magnifyingglass")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.black)
                                                .padding(.trailing,20)
                                        }
                                    )
                                    .padding(.top,10)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                

//                BannerWrapper().frame(height: 50)
                
             
                
                ZStack{
                    ScrollView(.vertical, showsIndicators: false){
                        
                        
                        
                        
                        LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], spacing: 10){
                            
                            ForEach(filteredCards) { card in
                                
                             
                                NavigationLink(destination: QuotesByCategoryScreen( screenName: card.title), label: {
                                    ZStack {
                                        Image("\(card.imageName)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 160, height: 100)
                                            .cornerRadius(10)
                                            .shadow(radius: 3)
                                        
                                        VStack {
                                            Spacer()
                                            HStack {
                                                Text("\(card.title)")
                                                    .foregroundColor(.white)
                                                    .font(.headline)
                                                Spacer()
                                            }
                                            .padding(.leading, 12)
                                            .padding(.bottom, 10)
                                            
                                            
                                        }
                                    }
                                    .frame(width: 160, height: 100)
                                    .searchable(text: self.$searchText)
                                })
                                
                                
                            }
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.bottom,20)
                        
                        
                       
                        
                        
                      
                        
                    }
                  
                    


                   


                  
                }
                
            
                
            }
            
            
           
        }
        .navigationBarHidden(true)
        .onAppear{
            Messaging.messaging().subscribe(toTopic: "Quoteoftheday") { error in
                if error != nil {
                    print("Error subscribing to topic: \(error!.localizedDescription)")
                } else {
                    print("Subscribed to topic successfully!")
                }
            }
            
     
               
           
        }
        
       
        
    }
    
 
   
}



struct Cardss: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    
   
}





//struct NativeAdView: View {
//
//    private var nativeAd: GADNativeAd
//
//    init(nativeAd: GADNativeAd) {
//        self.nativeAd = nativeAd
//    }
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            NativeAdView(nativeAd: nativeAd)
//                .frame(height: 300)
//            Text(nativeAd.headline ?? "")
//                .font(.headline)
//            Text(nativeAd.body ?? "")
//                .font(.body)
//            Text(nativeAd.callToAction ?? "")
//                .font(.footnote)
//                .foregroundColor(.blue)
//                .padding(.top, 8)
//                .padding(.bottom, 8)
//        }
//    }
//}



