//
//  HomeScreen.swift
//  Quote App
//
//  Created by Bilal Ahmed on 25/03/2023.
//

import SwiftUI
import Firebase
import FirebaseMessaging


@available(iOS 16.0, *)
struct HomeScreen: View {
    @State var search = ""
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Home")
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
                
                //                TextField("Search user name here", text: self.$search)
                //                    .foregroundColor(.black)
                //                    .font(.body)
                //                    .padding(15)
                //                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(.gray))
                //                    .overlay(
                //                        HStack{
                //                            Spacer()
                //                            Image(systemName: "magnifyingglass")
                //                                .resizable()
                //                                .frame(width: 20, height: 20)
                //                                .foregroundColor(.black)
                //                                .padding(.trailing,20)
                //                        }
                //                    )
                //                    .padding(.top,10)
                //                    .padding(.leading,20)
                //                    .padding(.trailing,20)
                
                ScrollView(.vertical, showsIndicators: false){
                    LazyVStack{
                        
                        Group{
                            HStack{
                                //Alone
                                NavigationLink(destination: QuotesByCategoryScreen(screenName: "alone"), label: {
//                                    ZStack{
//                                        Image(uiImage: UIImage(named: AppImages.alone)!)
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fill)
//                                            .frame(width: 170, height: 100)
//
//                                        VStack{
//                                            Spacer()
//                                            HStack{
//                                                Text("Alone")
//                                                    .foregroundColor(.white)
//                                                    .font(.body)
//                                                Spacer()
//                                            }
//                                            .padding(.leading,12)
//                                            .padding(.bottom,10)
//                                        }
//
//                                    }
//                                    .frame(width: 170, height: 100)
                                    Cards(text: "Alone", image: AppImages.alone)
                                })
                                
                                
                                Spacer()
                                
                                //Angry
                                NavigationLink(destination: QuotesByCategoryScreen(screenName: "angry"), label: {
                                    
                                    ZStack{
                                        Image(uiImage: UIImage(named: AppImages.Angry)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 170, height: 100)
                                        
                                        VStack{
                                            Spacer()
                                            HStack{
                                                Text("Angry")
                                                    .foregroundColor(.white)
                                                    .font(.body)
                                                Spacer()
                                            }
                                            .padding(.leading,12)
                                            .padding(.bottom,10)
                                        }
                                        
                                    }
                                    .frame(width: 170, height: 100)
                                })
                                
                                
                            }
                            .padding(.top,20)
                            
                            HStack{
                                //Anniversary
                                NavigationLink(destination: {
                                    QuotesByCategoryScreen(screenName: "anniversary")
                                }, label: {
                                    ZStack{
                                        Image(uiImage: UIImage(named: AppImages.Anniversary)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 170, height: 100)
                                        
                                        VStack{
                                            Spacer()
                                            HStack{
                                                Text("Anniversary")
                                                    .foregroundColor(.white)
                                                    .font(.body)
                                                Spacer()
                                            }
                                            .padding(.leading,12)
                                            .padding(.bottom,10)
                                        }
                                        
                                    }
                                    .frame(width: 170, height: 100)
                                })
                                
                                
                                
                                Spacer()
                                
                                //Attitude
                                NavigationLink(destination: QuotesByCategoryScreen(screenName: "attitude"), label: {
                                    
                                    ZStack{
                                        Image(uiImage: UIImage(named: AppImages.Attitude)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 170, height: 100)
                                        
                                        VStack{
                                            Spacer()
                                            HStack{
                                                Text("Attitude")
                                                    .foregroundColor(.white)
                                                    .font(.body)
                                                Spacer()
                                            }
                                            .padding(.leading,12)
                                            .padding(.bottom,10)
                                        }
                                        
                                    }
                                    .frame(width: 170, height: 100)
                                })
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Awesome
                                NavigationLink(destination: QuotesByCategoryScreen(screenName: "awesome"), label: {
                                    
                                    ZStack{
                                        Image(uiImage: UIImage(named: AppImages.Awesome)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 170, height: 100)
                                        
                                        VStack{
                                            Spacer()
                                            HStack{
                                                Text("Awesome")
                                                    .foregroundColor(.white)
                                                    .font(.body)
                                                Spacer()
                                            }
                                            .padding(.leading,12)
                                            .padding(.bottom,10)
                                        }
                                        
                                    }
                                    .frame(width: 170, height: 100)
                                    
                                })
                                
                                
                                Spacer()
                                
                                //Awkward
                                NavigationLink(destination: QuotesByCategoryScreen(screenName: "awkward"), label: {
                                    
                                    ZStack{
                                        Image(uiImage: UIImage(named: AppImages.Awkward)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 170, height: 100)
                                        
                                        VStack{
                                            Spacer()
                                            HStack{
                                                Text("Awkward")
                                                    .foregroundColor(.white)
                                                    .font(.body)
                                                Spacer()
                                            }
                                            .padding(.leading,12)
                                            .padding(.bottom,10)
                                        }
                                        
                                    }
                                    .frame(width: 170, height: 100)
                                })
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Beard
                                NavigationLink(destination: QuotesByCategoryScreen(screenName: "beard"), label: {
                                    
                                    ZStack{
                                        Image(uiImage: UIImage(named: AppImages.Beard)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 170, height: 100)
                                        
                                        VStack{
                                            Spacer()
                                            HStack{
                                                Text("Beard")
                                                    .foregroundColor(.white)
                                                    .font(.body)
                                                Spacer()
                                            }
                                            .padding(.leading,12)
                                            .padding(.bottom,10)
                                        }
                                        
                                    }
                                    .frame(width: 170, height: 100)
                                })
                                
                                
                                Spacer()
                                
                                //Beautiful
                                NavigationLink(destination: QuotesByCategoryScreen(screenName: "beautiful"), label: {
                                    
                                    ZStack{
                                        Image(uiImage: UIImage(named: AppImages.Beautiful)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 170, height: 100)
                                        
                                        VStack{
                                            Spacer()
                                            HStack{
                                                Text("Beautiful")
                                                    .foregroundColor(.white)
                                                    .font(.body)
                                                Spacer()
                                            }
                                            .padding(.leading,12)
                                            .padding(.bottom,10)
                                        }
                                        
                                    }
                                    .frame(width: 170, height: 100)
                                })
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Best
                                NavigationLink(destination: QuotesByCategoryScreen(screenName: "best"), label: {
                                    
                                    ZStack{
                                        Image(uiImage: UIImage(named: AppImages.Best)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 170, height: 100)
                                        
                                        VStack{
                                            Spacer()
                                            HStack{
                                                Text("Best")
                                                    .foregroundColor(.white)
                                                    .font(.body)
                                                Spacer()
                                            }
                                            .padding(.leading,12)
                                            .padding(.bottom,10)
                                        }
                                        
                                    }
                                    .frame(width: 170, height: 100)
                                    
                                })
                                
                                
                                Spacer()
                                
                                //Bike
                                NavigationLink(destination: QuotesByCategoryScreen(screenName: "bike"), label: {
                                    
                                    ZStack{
                                        Image(uiImage: UIImage(named: AppImages.Bike)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 170, height: 100)
                                        
                                        VStack{
                                            Spacer()
                                            HStack{
                                                Text("Bike")
                                                    .foregroundColor(.white)
                                                    .font(.body)
                                                Spacer()
                                            }
                                            .padding(.leading,12)
                                            .padding(.bottom,10)
                                        }
                                        
                                    }
                                    .frame(width: 170, height: 100)
                                })
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Birthday
                                NavigationLink(destination: QuotesByCategoryScreen(screenName: "birthday"), label: {
                                    
                                    ZStack{
                                        Image(uiImage: UIImage(named: AppImages.Birthday)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 170, height: 100)
                                        
                                        VStack{
                                            Spacer()
                                            HStack{
                                                Text("Birthday")
                                                    .foregroundColor(.white)
                                                    .font(.body)
                                                Spacer()
                                            }
                                            .padding(.leading,12)
                                            .padding(.bottom,10)
                                        }
                                        
                                    }
                                    .frame(width: 170, height: 100)
                                    
                                })
                                
                                
                                Spacer()
                                
                                //Breakup
                                NavigationLink(destination: QuotesByCategoryScreen(screenName: "breakup"), label: {
                                    
                                    ZStack{
                                        Image(uiImage: UIImage(named: AppImages.Breakup)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 170, height: 100)
                                        
                                        VStack{
                                            Spacer()
                                            HStack{
                                                Text("Breakup")
                                                    .foregroundColor(.white)
                                                    .font(.body)
                                                Spacer()
                                            }
                                            .padding(.leading,12)
                                            .padding(.bottom,10)
                                        }
                                        
                                    }
                                    .frame(width: 170, height: 100)
                                })
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Brother
                                NavigationLink(destination: QuotesByCategoryScreen(screenName: "brother"), label: {
                                    
                                    ZStack{
                                        Image(uiImage: UIImage(named: AppImages.Brother)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 170, height: 100)
                                        
                                        VStack{
                                            Spacer()
                                            HStack{
                                                Text("Brother")
                                                    .foregroundColor(.white)
                                                    .font(.body)
                                                Spacer()
                                            }
                                            .padding(.leading,12)
                                            .padding(.bottom,10)
                                        }
                                        
                                    }
                                    .frame(width: 170, height: 100)
                                    
                                })
                                
                                
                                Spacer()
                                
                                //Busy
                                NavigationLink(destination: QuotesByCategoryScreen(screenName: "busy"), label: {
                                    
                                    ZStack{
                                        Image(uiImage: UIImage(named: AppImages.Busy)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 170, height: 100)
                                        
                                        VStack{
                                            Spacer()
                                            HStack{
                                                Text("Busy")
                                                    .foregroundColor(.white)
                                                    .font(.body)
                                                Spacer()
                                            }
                                            .padding(.leading,12)
                                            .padding(.bottom,10)
                                        }
                                        
                                    }
                                    .frame(width: 170, height: 100)
                                })
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Cheat
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Cheat)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Cheat")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Childhood
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Childhood)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Childhood")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Clever
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Clever)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Clever")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //College
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.College)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("College")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Cool
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Cool)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Cool")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Creative
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Creative)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Creative")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                        }
                        
                        Group{
                            HStack{
                                //Cute
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Cute)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Cute")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Dance
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Dance)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Dance")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Emotional
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Emotional)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Emotional")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Exam
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Exam)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Exam")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Facebook
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Facebook)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Facebook")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Family
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Family)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Family")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Father’s Day
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Fathers_Day)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Father’s Day")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Flirt
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Flirt)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Flirt")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Food
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Food)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Food")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Forgiveness
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Forgiveness)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Forgiveness")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Friends
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Friends)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Friends")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Funny
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Funny)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Funny")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //God
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.God)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("God")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Good morning
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Good_morning)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Good morning")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Good night
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Good_night)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Good night")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Gym
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Gym)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Gym")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Happiness
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Happiness)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Happiness")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Hate You
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Hate_You)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Hate You")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Heart Touching
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Heart_Touching)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Heart Touching")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Heartbreak
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Heartbreak)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Heartbreak")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            
                        }
                        
                        Group{
                            
                            HStack{
                                //Hindi
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Hindi)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Hindi")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Home
                                NavigationLink(destination: QuotesByCategoryScreen(screenName: "home"), label: {
                                    ZStack{
                                        Image(uiImage: UIImage(named: AppImages.Home)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 170, height: 100)
                                        
                                        VStack{
                                            Spacer()
                                            HStack{
                                                Text("Home")
                                                    .foregroundColor(.white)
                                                    .font(.body)
                                                Spacer()
                                            }
                                            .padding(.leading,12)
                                            .padding(.bottom,10)
                                        }
                                        
                                    }
                                    .frame(width: 170, height: 100)
                                })
                                
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Hot
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Hot)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Hot")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Hurt
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Hurt)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Hurt")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Husband
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Husband)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Husband")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Inspiration
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Inspiration)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Inspiration")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Insult
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Insult)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Insult")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Jealous
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Jealous)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Jealous")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Kids
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Kids)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Kids")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Kiss
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Kiss)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Kiss")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Life
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Life)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Life")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Lonely
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Lonely)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Lonely")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Love
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Love)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Love")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Marriage
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Marriage)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Marriage")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Men
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Men)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Men")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Miss You
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Miss_You)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Miss You")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Monday
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Monday)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Monday")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Mother’s day
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Mothers_day)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Mother’s day")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Motivational
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Motivational)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Motivational")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Moving On
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Moving_On)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Moving On")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                        }
                        
                                                Group{
                                                    Group{
                                                        HStack{
                                                            //Music
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Music)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Music")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                        
                                                            Spacer()
                        
                                                            //Naughty
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Naughty)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Naughty")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                                                        }
                                                        .padding(.top,12)
                        
                                                        HStack{
                                                            //Pain
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Pain)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Pain")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                        
                                                            Spacer()
                        
                                                            //Parents
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Parents)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Parents")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                                                        }
                                                        .padding(.top,12)
                        
                                                        HStack{
                                                            //Party
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Party)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Party")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                        
                                                            Spacer()
                        
                                                            //Pets
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Pets)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Pets")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                                                        }
                                                        .padding(.top,12)
                        
                                                        HStack{
                                                            //Punjabi
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Punjabi)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Punjabi")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                        
                                                            Spacer()
                        
                                                            //Quotes
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Quotes)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Quotes")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                                                        }
                                                        .padding(.top,12)
                        
                                                        HStack{
                                                            //Rain
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Rain)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Rain")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                        
                                                            Spacer()
                        
                                                            //Relationship
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Relationship)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Relationship")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                                                        }
                                                        .padding(.top,12)
                        
                                                        HStack{
                                                            //Romantic
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Romantic)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Romantic")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                        
                                                            Spacer()
                        
                                                            //Sad
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Sad)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Sad")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                                                        }
                                                        .padding(.top,12)
                        
                                                        HStack{
                                                            //School
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.School)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("School")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                        
                                                            Spacer()
                        
                                                            //Selfie
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Selfie)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Selfie")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                                                        }
                                                        .padding(.top,12)
                        
                                                        HStack{
                                                            //Selfish
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Selfish)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Selfish")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                        
                                                            Spacer()
                        
                                                            //Shopping
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Shopping)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Shopping")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                                                        }
                                                        .padding(.top,12)
                        
                                                        HStack{
                                                            //Sick
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Sick)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Sick")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                        
                                                            Spacer()
                        
                                                            //Single
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Single)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Single")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                                                        }
                                                        .padding(.top,12)
                        
                                                        HStack{
                                                            //Sister
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Sister)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Sister")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                        
                                                            Spacer()
                        
                                                            //Smart
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Smart)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Smart")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                                                        }
                                                        .padding(.top,12)
                                                    }
                        
                                                    Group{
                                                        HStack{
                                                            //Smile
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Smile)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Smile")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                        
                                                            Spacer()
                        
                                                            //Sorry
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Sorry)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Sorry")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                                                        }
                                                        .padding(.top,12)
                        
                                                        HStack{
                                                            //Success
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Success)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Success")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                        
                                                            Spacer()
                        
                                                            //Summer
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Summer)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Summer")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                                                        }
                                                        .padding(.top,12)
                        
                                                        HStack{
                                                            //Sunday
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Sunday)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Sunday")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                        
                                                            Spacer()
                        
                                                            //Sweet
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Sweet)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Sweet")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                                                        }
                                                        .padding(.top,12)
                        
                                                        HStack{
                                                            //Tears
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Tears)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Tears")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                        
                                                            Spacer()
                        
                                                            //Technology
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Technology)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Technology")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                                                        }
                                                        .padding(.top,12)
                        
                                                        HStack{
                                                            //Thank you
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Thank_you)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Thank you")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                        
                                                            Spacer()
                        
                                                            //Though
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Though)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Though")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                                                        }
                                                        .padding(.top,12)
                        
                                                        HStack{
                                                            //Tired
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Tired)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Tired")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                        
                                                            Spacer()
                        
                                                            //True
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.True)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("True")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                                                        }
                                                        .padding(.top,12)
                        
                                                        HStack{
                                                            //Trust
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Trust)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Trust")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                        
                                                            Spacer()
                        
                                                            //Unique
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Unique)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Unique")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                                                        }
                                                        .padding(.top,12)
                        
                                                        HStack{
                                                            //Weekend
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Weekend)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Weekend")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                        
                                                            Spacer()
                        
                                                            //Whatsapp
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Whatsapp)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Whatsapp")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                                                        }
                                                        .padding(.top,12)
                        
                                                        HStack{
                                                            //Wife
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Wife)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Wife")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                        
                                                            Spacer()
                        
                                                            //Winter
                                                            ZStack{
                                                                Image(uiImage: UIImage(named: AppImages.Winter)!)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 170, height: 100)
                        
                                                                VStack{
                                                                    Spacer()
                                                                    HStack{
                                                                        Text("Winter")
                                                                            .foregroundColor(.white)
                                                                            .font(.body)
                                                                        Spacer()
                                                                    }
                                                                    .padding(.leading,12)
                                                                    .padding(.bottom,10)
                                                                }
                        
                                                            }
                                                            .frame(width: 170, height: 100)
                        
                                                        }
                                                        .padding(.top,12)
                        
                                                    }
                                                }
                        
                        Group{
                            
                            HStack{
                                //Wise
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Wise)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Wise")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                //Women
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.Women)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Women")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                            }
                            .padding(.top,12)
                            
                            HStack{
                                //Work
                                ZStack{
                                    Image(uiImage: UIImage(named: AppImages.alone)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 100)
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text("Wise")
                                                .foregroundColor(.white)
                                                .font(.body)
                                            Spacer()
                                        }
                                        .padding(.leading,12)
                                        .padding(.bottom,10)
                                    }
                                    
                                }
                                .frame(width: 170, height: 100)
                                
                                
                                Spacer()
                                
                                
                                
                            }
                            .padding(.top,12)
                        }
                        
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
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


struct Cards : View{
     var text : String
     var image : String
    var body : some View{
        ZStack{
            Image(uiImage: UIImage(named: image)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 100)
            
            VStack{
                Spacer()
                HStack{
                    Text(text)
                        .foregroundColor(.white)
                        .font(.body)
                    Spacer()
                }
                .padding(.leading,12)
                .padding(.bottom,10)
            }
            
        }
        .frame(width: 170, height: 100)
        
    }
}
