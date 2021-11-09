//
//  APIRouter.swift
//  VoyagerTestProject2
//
//  Created by Krupali Patel on 11/8/21.
//

import Foundation
import Alamofire

enum APIRouter : URLRequestConvertible{
    func asURLRequest() throws -> URLRequest {
        let baseUrl = URL(string: "https://api.investvoyager.com")
        let urlRequest = URLRequest(url: (baseUrl?.appendingPathComponent(path))!)
        return urlRequest
    }
    
    case fetchMarketInfo(moduleName: String, type: String, arg1: String, arg2: String)
    
    private var path: String{
        switch self{
        case .fetchMarketInfo(let moduleName, type: let type, arg1: let arg1, arg2: let arg2):
            let url = "/api/v1/price" //Bundle.main.path(forResource: "marketDemoData", ofType: "json")! //"api.investvoyager.com/api/v1/price"
            return url
        }
    }
}
