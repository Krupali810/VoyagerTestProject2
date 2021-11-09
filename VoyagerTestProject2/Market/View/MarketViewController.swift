//
//  MarketViewController.swift
//  VoyagerTestProject2
//
//  Created by Krupali Patel on 11/7/21.
//

import Foundation
import UIKit

class MarketViewController : UIViewController {
    
    @IBOutlet weak var marketTable: UITableView!
    var marketViewModel = MarketViewModel(marketService: MarketAPI())
    var marketDataModelArray = [MarketModel]()
    var selectedIndexValue = 0
    let currencyFormatter = NumberFormatter()
    let customFormatter = CustomFormatters()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInitialView()
        self.getDataFromMarketAPI()
        marketDataModelArray = self.marketViewModel.marketDataModelArray ?? []
        let headerNib = UINib.init(nibName: "MarketTableHeaderView", bundle: Bundle.main)
        marketTable.register(headerNib, forHeaderFooterViewReuseIdentifier: "MarketTableHeaderView")
    }
    
    func formatCurrency(){
        
    }
    
    func setupInitialView() {
        self.marketTable.dataSource = self
        self.marketTable.delegate = self
    }
    
    func getDataFromMarketAPI(){
        marketViewModel.fetchMarketData()
        self.updateUIonNetworkCallCompletion()
    }
    
    func updateUIonNetworkCallCompletion(){
        self.marketViewModel.didFinishFetch={
            (_ forValue:ApiResponseType) in
            
            if forValue == ApiResponseType.marketAPI{
                self.marketDataModelArray  = self.marketViewModel.marketDataModelArray ?? []
                self.marketTable.reloadData()
            }
        }
       
    }
}



extension MarketViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.marketDataModelArray.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = self.marketTable.dequeueReusableHeaderFooterView(withIdentifier: MarketTableHeaderView.identifier) as! MarketTableHeaderView
        
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndexValue = indexPath.row
        self.performSegue(withIdentifier: "detailViewSegue", sender: nil)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(self.marketDataModelArray[indexPath.row])
        let identifier: String = "marketCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)! as! MarketTableViewCell
        var assetText = self.marketDataModelArray[indexPath.row].pair_symbol
        if let index = assetText.index(of: "/") {
            let substring = assetText[..<index]
            assetText = String(substring)
        }
        cell.asset.text = customFormatter.assetNameFormatter(value: self.marketDataModelArray[indexPath.row].pair_symbol)
        
        //price
        cell.price.textColor = UIColor.green
        if(self.marketDataModelArray[indexPath.row].change_pct_24hr.prefix(1)=="-"){
            
            cell.price.textColor = UIColor.red
        }
        cell.price.text = "$" + customFormatter.getFormattedString(value: self.marketDataModelArray[indexPath.row].price)

        cell.high24h.text = "$" + customFormatter.getFormattedString(value: self.marketDataModelArray[indexPath.row].high_24hr)
        cell.low24h.text = "$" + customFormatter.getFormattedString(value:self.marketDataModelArray[indexPath.row].low_24hr)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detailViewSegue"){
            let detailVC = segue.destination as? MarketDetailViewController
            detailVC?.marketDataValue = self.marketDataModelArray
            detailVC?.selectedIndexValue = self.selectedIndexValue
            detailVC?.navigationController?.title = self.marketDataModelArray[selectedIndexValue].pair_symbol
        }
    }
    
}


