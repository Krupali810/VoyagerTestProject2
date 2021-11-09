//
//  NumberFormatter.swift
//  VoyagerTestProject2
//
//  Created by Krupali Patel on 11/8/21.
//

import Foundation
import UIKit

class CustomFormatters {
    
    func currencyFormatter(value: String) -> String{
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .decimal
        currencyFormatter.maximumFractionDigits = 2
        currencyFormatter.decimalSeparator = "."
//        currencyFormatter.locale = Locale(identifier: "es_CL")
//        if let currInt = Double(value){
//            let currNum = NSNumber(value: currInt)
//            return currencyFormatter.string(from: currNum) ?? value
//        }

        var formattedCurrency = value
        if(value.prefix(1)=="-"){
            formattedCurrency = String(value.dropFirst())
        }
        return "$"+formattedCurrency
    }
    
    func assetNameFormatter(value:String)->String{
        if let index = value.index(of: "/") {
            let substring = value[..<index]
            return String(substring)
        }
        return ""
    }
    

    func priceColorFormatter(price: String) -> UIColor{
        if(price.prefix(1)=="-"){
            return UIColor.red
        }
        return UIColor.green
    }
    
    func formatNumber(_ n: Double) -> String {
        let num = n
        let sign = (n < 0) ? "-" : ""

        switch num {
        case 1_000_000_000...:
            var formatted = num / 1_000_000_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted)B"

        case 1_000_000...:
            var formatted = num / 1_000_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted)M"

        case 1_000...:
            var formatted = num / 1_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted)K"

        case 0...:
            return "\(n)"

        default:
            return "\(sign)\(n)"
        }
    }
    func decimalPlaceFormatter(value: String) -> String{
        let doubleValue = Double(value) ?? 0.0
        return String(format: "%.2f", doubleValue)
    }
    
    func getFormattedString(value: String)->String{
        let prefix = String(value.prefix(1))
        var val : String = value
        if(val == "" || val == "-"){
            return ""
        }
        if(prefix == "-"){
            val.remove(at: val.startIndex)
        }
        if let myInteger = Double(val){
            let bigNumber = NSNumber(value: myInteger)
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            guard let formattedNumber = numberFormatter.string(from: bigNumber) else {return ""}
            if(prefix == "-"){
                let formattedNumberWithPrefix = "-"+formattedNumber
                return formattedNumberWithPrefix
            }
            return formattedNumber
            
        }
        return "0"
    }
}

extension Double{
    func reduceScale(to places: Int) -> Double {
        let multiplier = pow(10, Double(places))
        let newDecimal = multiplier * self // move the decimal right
        let truncated = Double(Int(newDecimal)) // drop the fraction
        let originalDecimal = truncated / multiplier // move the decimal back
        return originalDecimal
    }
    

}

extension Double {
      static let twoFractionDigits: NumberFormatter = {
          let formatter = NumberFormatter()
          formatter.numberStyle = .decimal
          formatter.minimumFractionDigits = 2
          formatter.maximumFractionDigits = 2
          return formatter
      }()
      var formatted: String {
          return Double.twoFractionDigits.string(for: self) ?? ""
      }
  }

