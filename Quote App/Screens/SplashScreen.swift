//
//  SplashScreen.swift
//  Quote App
//
//  Created by Bilal Ahmed on 25/03/2023.
//

import SwiftUI
import Firebase
import FirebaseMessaging

@available(iOS 16.0, *)
struct SplashScreen: View {
    @State var toHome : Bool = false
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                
                NavigationLink(destination: HomeScreen(), isActive: self.$toHome){
                   EmptyView()
                }
                
                Image(uiImage: UIImage(named: AppImages.splashScreenLogo)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.screenWidth - 40, height: 300)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.toHome = true
                        }
                    }
                
              
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
        
       
    }
}

