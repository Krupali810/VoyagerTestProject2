
import Foundation
import Alamofire
import SwiftyJSON


func fetchMarketInfoAPI() -> URLRequestConvertible{
    var url : URLRequestConvertible
    url = APIRouter.fetchMarketInfo(moduleName: "https://api.investVoyager", type:"api", arg1: "v1", arg2: "price")
    return url
}

struct MarketAPI{
    static let shared = MarketAPI()
    let manager = APIRequestManager()
    
    func fetchMarketInfo(success:@escaping(JSON?, Error?)->()){
        manager.dataRequest(request: fetchMarketInfoAPI()){(responseObject, error) in
            if(responseObject == nil){
                success(nil, error)
            }else{
                success(responseObject, nil)
            }
        }
    }
}
