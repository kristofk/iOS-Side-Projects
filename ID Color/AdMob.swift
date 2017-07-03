//
//  AdMob.swift
//  ID Color
//
//  Created by Kristof Kocsis on 2017. 07. 03..
//  Copyright © 2017. Kristof Kocsis. All rights reserved.
//

import Foundation
import GoogleMobileAds

// MARK: - AdMob func

public class AdMob_ad {
    let request: GADRequest
    let adView: GADBannerView
    
    init(size: GADAdSize = kGADAdSizeFullBanner, id: String = "ca-app-pub-5958170520650541/7129119711") {
//        let request = GADRequest()
//        request.testDevices = [ kGADSimulatorID, "c4868a24863d9af44e24cd3aff515a37"]
//        self.request = request
        self.request = GADRequest()
        self.request.testDevices = [ kGADSimulatorID, "c4868a24863d9af44e24cd3aff515a37"]
        
        let bannerView = GADBannerView(adSize: size)
        bannerView.adUnitID = id
        self.adView = bannerView
    }
    
    func displayAd(on view: ViewController) {
        view.view.addSubview(adView)
        adView.rootViewController = view
        adView.load(request)
        adView.delegate = view
    }
}



//func createAdMobBannerView(with request: GADRequest, in view: ViewController) -> UIView {
//    var bannerView: GADBannerView!
//    
//    bannerView = GADBannerView(adSize: kGADAdSizeFullBanner)
//    view.view.addSubview(bannerView)
//    bannerView.rootViewController = view
//    
//    bannerView.adUnitID = "ca-app-pub-5958170520650541/7129119711"//"ca-app-pub-3940256099942544/2934735716"
//    
//    bannerView.load(request)
//    bannerView.delegate = view
//    
//    return bannerView
//}
