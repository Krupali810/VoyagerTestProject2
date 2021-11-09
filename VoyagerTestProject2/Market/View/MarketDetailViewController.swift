//
//  MarketDetailViewController.swift
//  VoyagerTestProject2
//
//  Created by Krupali Patel on 11/8/21.
//

import UIKit

class MarketDetailViewController: UIViewController{
    var marketDataValue = [MarketModel]()
    var selectedIndexValue = 0
    
    @IBOutlet var assetSymbol : UILabel!
    @IBOutlet var currentPrice : UILabel!
    @IBOutlet var currentPriceValue : UILabel!
    @IBOutlet var change24 : UILabel!
    @IBOutlet var change24Value : UILabel!
    @IBOutlet var bidPrice : UILabel!
    @IBOutlet var bidPriceValue : UILabel!
    @IBOutlet var askPrice : UILabel!
    @IBOutlet var askPriceValue : UILabel!
    @IBOutlet var high24h : UILabel!
    @IBOutlet var high24hValue : UILabel!
    @IBOutlet var low24h : UILabel!
    @IBOutlet var low24hValue : UILabel!
    @IBOutlet var high52w : UILabel!
    @IBOutlet var high52wValue : UILabel!
    @IBOutlet var low52w : UILabel!
    @IBOutlet var low52wValue : UILabel!
    @IBOutlet var marketCap : UILabel!
    @IBOutlet var marketCapValue : UILabel!
    @IBOutlet var circulation : UILabel!
    @IBOutlet var circulationValue : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let customFormatter = CustomFormatters()
        print(marketDataValue[selectedIndexValue])
        let assetInfo = marketDataValue[selectedIndexValue]
        assetSymbol.text = customFormatter.assetNameFormatter(value: assetInfo.pair_symbol)
        currentPrice.text = "Current Price"
        currentPriceValue.text = "$" + customFormatter.getFormattedString(value:assetInfo.price)
                change24.text = "24H Change"
        change24Value.text = "$" + assetInfo.change_pct_24hr + "%"
        change24Value.textColor = customFormatter.priceColorFormatter(price: assetInfo.change_pct_24hr)
        bidPrice.text = "Bid Price"
        bidPriceValue.text = "$" + customFormatter.getFormattedString(value:assetInfo.bid)
                askPrice.text = "Ask Price"
        askPriceValue.text = "$" + customFormatter.getFormattedString(value:assetInfo.ask)
                high24h.text = "24H High"
        high24hValue.text = "$" + customFormatter.getFormattedString(value:assetInfo.high_24hr)
                low24h.text = "24H Low"
        low24hValue.text = "$" + customFormatter.getFormattedString(value:assetInfo.low_24hr)
                high52w.text = "52W High"
        high52wValue.text = "$" + customFormatter.decimalPlaceFormatter(value: assetInfo.high_52w)
                low52w.text = "52W Low"
        low52wValue.text = "$" + assetInfo.low_52w
                marketCap.text = "Market Cap"
        marketCapValue.text = customFormatter.formatNumber(Double(assetInfo.market_cap) ?? 0.0) //assetInfo.market_cap
                circulation.text = "Circulation"
        circulationValue.text = customFormatter.formatNumber(Double(assetInfo.circulation) ?? 0.0)
    }
}

