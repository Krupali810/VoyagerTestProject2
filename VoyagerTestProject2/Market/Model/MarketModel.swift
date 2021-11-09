//
//  MarketModel.swift
//  VoyagerTestProject2
//
//  Created by Krupali Patel on 11/7/21.
//

import Foundation
import SwiftyJSON


struct MarketModel {
    //      "pair_symbol": "AAVE/USD",
    //      "price": "319.01",
    //      "ask": "323.15",
    //      "bid": "314.93",
    //      "volume_24hr": "63001830.95",
    //      "change_amt_24hr": "0.46",
    //      "change_pct_24hr": "0.14",
    //      "high_24hr": "324.00",
    //      "low_24hr": "316.44",
    //      "high_52w": "456.72",
    //      "low_52w": "170.25",
    //      "circulation": "16000000",
    //      "market_cap": "5104080068.32",
    //      "time": 1636324343,
    //      "stats": [
    //        {
    //          "period": 1,
    //          "price": "321.12"
    //        },
    //        {
    //          "period": 24,
    //          "price": "318.55"
    //        },
    //        {
    //          "period": 168,
    //          "price": "314.35"
    //        },
    //        {
    //          "period": 720,
    //          "price": "307.49"
    //        },
    //        {
    //          "period": 8760,
    //          "price": "44.65"
    //        }
    //      ]
    let pair_symbol:String
    let price:String
    let ask:String
    let bid:String
    let volume_24hr:String
    let change_amt_24hr:String
    let change_pct_24hr:String
    let high_24hr:String
    let low_24hr:String
    let high_52w:String
    let low_52w:String
    let circulation:String
    let market_cap:String
    let time:String
    let stats: Any
    let modelType : String
}

extension MarketModel{
    init?(from json: [String:JSON]){
        
        let pair_symbol = json["pair_symbol"]?.stringValue ?? ""
        let price = json["price"]?.stringValue ?? ""
        let ask = json["ask"]?.stringValue ?? ""
        let bid = json["bid"]?.stringValue ?? ""
        let volume_24hr = json["volume_24hr"]?.stringValue ?? ""
        let change_amt_24hr = json["change_amt_24hr"]?.stringValue ?? ""
        let change_pct_24hr = json["change_pct_24hr"]?.stringValue ?? ""
        let high_24hr = json["high_24hr"]?.stringValue ?? ""
        let low_24hr = json["low_24hr"]?.stringValue ?? ""
        let high_52w = json["high_52w"]?.stringValue ?? ""
        let low_52w = json["low_52w"]?.stringValue ?? ""
        let circulation = json["circulation"]?.stringValue ?? ""
        let market_cap = json["market_cap"]?.stringValue ?? ""
        let time = json["time"]?.stringValue ?? ""
        let stats = json["stats"]
        
        let modelType = "MarketModel"
        
        self.init(pair_symbol: pair_symbol, price: price, ask: ask, bid: bid, volume_24hr: volume_24hr, change_amt_24hr: change_amt_24hr, change_pct_24hr: change_pct_24hr, high_24hr: high_24hr, low_24hr: low_24hr, high_52w: high_52w, low_52w: low_52w, circulation: circulation, market_cap: market_cap, time: time, stats: stats, modelType: modelType)
    }
}
