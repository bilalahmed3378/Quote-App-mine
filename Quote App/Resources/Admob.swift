//
//  Admob.swift
//  Quote App
//
//  Created by Bilal Ahmed on 07/04/2023.
//

import Foundation
import UIKit
import GoogleMobileAds
import SwiftUI






final class OpenAd: NSObject, GADFullScreenContentDelegate {
   var appOpenAd: GADAppOpenAd?
   var loadTime = Date()
   
   func requestAppOpenAd() {
       let request = GADRequest()
       GADAppOpenAd.load(withAdUnitID: "ca-app-pub-7540620933217632/3176042610",
                         request: request,
                         orientation: UIInterfaceOrientation.portrait,
                         completionHandler: { (appOpenAdIn, _) in
                           self.appOpenAd = appOpenAdIn
                           self.appOpenAd?.fullScreenContentDelegate = self
                           self.loadTime = Date()
                           print("[OPEN AD] Ad is ready")
                         })
   }
   
   func tryToPresentAd() {
       if let gOpenAd = self.appOpenAd, wasLoadTimeLessThanNHoursAgo(thresholdN: 4) {
           gOpenAd.present(fromRootViewController: (UIApplication.shared.windows.first?.rootViewController)!)
       } else {
           self.requestAppOpenAd()
       }
   }
   
   func wasLoadTimeLessThanNHoursAgo(thresholdN: Int) -> Bool {
       let now = Date()
       let timeIntervalBetweenNowAndLoadTime = now.timeIntervalSince(self.loadTime)
       let secondsPerHour = 3600.0
       let intervalInHours = timeIntervalBetweenNowAndLoadTime / secondsPerHour
       return intervalInHours < Double(thresholdN)
   }
   
   func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
       print("[OPEN AD] Failed: \(error)")
       requestAppOpenAd()
   }
   
   func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
       requestAppOpenAd()
       print("[OPEN AD] Ad dismissed")
   }
   
  
}

final private class BannerVC: UIViewControllerRepresentable  {

    func makeUIViewController(context: Context) -> UIViewController {
        let view = GADBannerView(adSize: GADPortraitAnchoredAdaptiveBannerAdSizeWithWidth(.infinity))

        let viewController = UIViewController()
        view.adUnitID = "ca-app-pub-7540620933217632/8392710273"
        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: GADPortraitAnchoredAdaptiveBannerAdSizeWithWidth(.infinity).size)
        view.load(GADRequest())

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}


struct BannerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<BannerWrapper>) -> UIViewController {
        let viewController = UIViewController()
        let bannerView = GADBannerView(adSize: GADPortraitAnchoredAdaptiveBannerAdSizeWithWidth(340))
        addBannerViewToView(bannerView, viewController: viewController)
        bannerView.adUnitID = "ca-app-pub-7540620933217632/8392710273"
        bannerView.rootViewController = viewController
        bannerView.load(GADRequest())
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<BannerWrapper>) {
    }
    
    private func addBannerViewToView(_ bannerView: GADBannerView, viewController: UIViewController) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(bannerView)
        viewController.view.centerXAnchor.constraint(equalTo: bannerView.centerXAnchor).isActive = true
        viewController.view.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor).isActive = true
    }
}





//////////////////////////////////
//Native Ads
struct NativeAdView: UIViewRepresentable {
 typealias UIViewType = GADNativeAdView

 @ObservedObject var nativeViewModel: NativeAdViewModel

 func makeUIView(context: Context) -> GADNativeAdView {
   return
     Bundle.main.loadNibNamed(
       "View",
       owner: nil,
       options: nil)?.first as! GADNativeAdView
 }

 func updateUIView(_ nativeAdView: GADNativeAdView, context: Context) {
   guard let nativeAd = nativeViewModel.nativeAd else { return }

   (nativeAdView.headlineView as? UILabel)?.text = nativeAd.headline

   nativeAdView.mediaView?.mediaContent = nativeAd.mediaContent

   (nativeAdView.bodyView as? UILabel)?.text = nativeAd.body

   (nativeAdView.iconView as? UIImageView)?.image = nativeAd.icon?.image

   (nativeAdView.starRatingView as? UIImageView)?.image = imageOfStars(from: nativeAd.starRating)

   (nativeAdView.storeView as? UILabel)?.text = nativeAd.store

   (nativeAdView.priceView as? UILabel)?.text = nativeAd.price

   (nativeAdView.advertiserView as? UILabel)?.text = nativeAd.advertiser

   (nativeAdView.callToActionView as? UIButton)?.setTitle(nativeAd.callToAction, for: .normal)

   // In order for the SDK to process touch events properly, user interaction should be disabled.
   nativeAdView.callToActionView?.isUserInteractionEnabled = false

   // Associate the native ad view with the native ad object. This is required to make the ad clickable.
   // Note: this should always be done after populating the ad views.
   nativeAdView.nativeAd = nativeAd
 }

  func imageOfStars(from starRating: NSDecimalNumber?) -> UIImage? {
   guard let rating = starRating?.doubleValue else {
     return nil
   }
   if rating >= 5 {
     return UIImage(named: "stars_5")
   } else if rating >= 4.5 {
     return UIImage(named: "stars_4_5")
   } else if rating >= 4 {
     return UIImage(named: "stars_4")
   } else if rating >= 3.5 {
     return UIImage(named: "stars_3_5")
   } else {
     return nil
   }
 }
}

class NativeAdViewModel: NSObject, ObservableObject, GADNativeAdLoaderDelegate {
 @Published var nativeAd: GADNativeAd?
 private var adLoader: GADAdLoader!

 func refreshAd() {
   adLoader = GADAdLoader(
     adUnitID:
       "ca-app-pub-7540620933217632/5160042274",
     rootViewController: nil,
     adTypes: [.native], options: nil)
   adLoader.delegate = self
   adLoader.load(GADRequest())
 }

 func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADNativeAd) {
   self.nativeAd = nativeAd
   nativeAd.delegate = self
 }

 func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: Error) {
   print("\(adLoader) failed with error: \(error.localizedDescription)")
 }
}

// MARK: - GADNativeAdDelegate implementation
extension NativeAdViewModel: GADNativeAdDelegate {
 func nativeAdDidRecordClick(_ nativeAd: GADNativeAd) {
   print("\(#function) called")
 }

 func nativeAdDidRecordImpression(_ nativeAd: GADNativeAd) {
   print("\(#function) called")
 }

 func nativeAdWillPresentScreen(_ nativeAd: GADNativeAd) {
   print("\(#function) called")
 }

 func nativeAdWillDismissScreen(_ nativeAd: GADNativeAd) {
   print("\(#function) called")
 }

 func nativeAdDidDismissScreen(_ nativeAd: GADNativeAd) {
   print("\(#function) called")
 }
}
