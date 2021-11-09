//
//  MarketTableViewCell.swift
//  VoyagerTestProject2
//
//  Created by Krupali Patel on 11/8/21.
//

import UIKit

class MarketTableViewCell : UITableViewCell{
    @IBOutlet var asset : UILabel!
    @IBOutlet var price : UILabel!
    @IBOutlet var high24h : UILabel!
    @IBOutlet var low24h : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
}
