//
//  File.swift
//  VoyagerTestProject2
//
//  Created by Krupali Patel on 11/7/21.
//

import Foundation
import SwiftyJSON

enum MarketModelType {
    case marketData
}
class MarketViewModel: NSObject{
    
    private var marketAPIService: MarketAPI?
    
    init(marketService: MarketAPI){
        self.marketAPIService = marketService
    }
    
    var didFinishFetch: ((_ forValue: ApiResponseType)->())?

    var marketDataModelArray : [MarketModel]?{
        didSet{
            self.didFinishFetch?(.marketAPI)
        }
    }

    
    
    func fetchMarketData(){
        self.marketAPIService?.fetchMarketInfo(success: {(json, error) in
            var marketDataArray = [MarketModel]()
            
            if let jsonResult = json?.array{
//                print(jsonResult)
                marketDataArray = jsonResult.compactMap{MarketModel.init(from: $0.dictionaryValue)}
//                print(marketDataArray)
            }
            self.marketDataModelArray = marketDataArray
        })
    }
}
