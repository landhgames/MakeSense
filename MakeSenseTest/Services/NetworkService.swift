//
//  NetworkService.swift
//  MakeSenseTest
//
//  Created by Nacho on 19/02/2018.
//  Copyright © 2018 MakeSense. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkService: NSObject {
    
    static func getFeedRequest(getFeedUrl : String, completionHandler completion: @escaping (JSON?,NSError?) -> Void) {    
        
        Alamofire.request(getFeedUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler:{
            (response) in
            
            if(response.result.isFailure) {
                let error = response.result.error! as NSError?
                print("\nError: \(String(describing: error)) at host: \(getFeedUrl)")
                
                completion(nil,error)
            } else {
                let value = response.result.value
                let json = JSON(value as Any)
                completion(json, nil)
            }
        })    
    }
}
