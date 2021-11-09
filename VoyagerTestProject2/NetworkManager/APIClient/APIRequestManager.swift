//
//  APIRequestManager.swift
//  VoyagerTestProject2
//
//  Created by Krupali Patel on 11/7/21.
//

import UIKit
import Alamofire
import SwiftyJSON


public enum HTTPRequestError : Error{
    case None
    case SystemError(error: NSError?)
    case NetworkError
    case BusinessError(description: String)
}


public typealias HTTPRequestJSONHandlerWithString = ( _ responseJSON: JSON?, _ responseObject : String?, _ error: HTTPRequestError?) -> Void

public typealias HTTPRequestJSONHandler = (_ responseObject: JSON?, _ error: HTTPRequestError?) -> Void


public typealias HTTPRequestHandler = (_ responseObject: AnyObject?, _ error: HTTPRequestError?) -> Void

class APIRequestManager{
    let Almgr : Alamofire.Session = {
        let manager = Alamofire.Session(
            configuration: URLSessionConfiguration.default
        )
        return manager
    }()
    
    public func dataRequest(request req: URLRequestConvertible, completionHandler: HTTPRequestJSONHandler?) -> Void {
        Almgr.request(req).responseJSON{(resp) -> Void in
            switch resp.result{
            case .success(let value):
                if let handler = completionHandler{
                    handler(JSON(value), nil)
                }
                break
            case .failure(let error):
                if let handler = completionHandler{
                    handler(nil, HTTPRequestError.SystemError(error: error as NSError))
                }
                break
                
            }
        }
    }
}
