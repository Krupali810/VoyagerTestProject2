//
//  MarketTableHeaderView.swift
//  VoyagerTestProject2
//
//  Created by Krupali Patel on 11/8/21.
//

import UIKit

class MarketTableHeaderView : UITableViewHeaderFooterView{
    @IBOutlet var asset : UILabel!
    @IBOutlet var price : UILabel!
    @IBOutlet var high24H : UILabel!
    @IBOutlet var low24H : UILabel!
    
    static var identifier: String{
        return String(describing: self)
    }
}
