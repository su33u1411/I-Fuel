//
//  RequestHandler.swift
//  Prices
//
//  Created by Subramanyam Mogili on 7/22/17.
//  Copyright © 2017 Subramanyam Mogili. All rights reserved.
//

import Foundation
import Alamofire

class PriceRequest{
    
    private static var domain:String = "http://fuelpriceindia.herokuapp.com"
    
    static var Cities:[String]?
    
    // MARK:getFuelRate
    static func getFuelRate(CityName:String,FuelType:String,completion:@escaping(_ FuelPrice:Double,_ StatusCode:Int)->Void){
        switch CityName{
            case "":
                print(CityName)
                break
            default:
            let RequestLink:String = "\(self.domain)/price?city=\(CityName)&fuel_type=\(FuelType)"
            let RequestURL:URL = URL(string: RequestLink.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
            Alamofire.request(RequestURL).responseJSON { (response) in
                switch response.response!.statusCode{
                case 200:
                    if let data = response.result.value as? [String:AnyObject]{
                        if let price = data[FuelType] as? Double{
                            completion(price, response.response!.statusCode)
                        }
                    }
                default:
                    completion(0.0, response.response!.statusCode)
                }

            }
        }
    }
    
    // MARK:getListOfCities
    static func getListOfCities(completion:@escaping(_ Cities:[String],_ StatusCode:Int)->Void){
        let RequestURL:String = "\(self.domain)/cities"
        Alamofire.request(RequestURL).responseJSON { (response) in
            switch response.response!.statusCode{
            case 200:
                if let data = response.result.value as? [String:AnyObject]{
                    if let citiesList = data["cities"] as? [String]{
                        completion(citiesList, response.response!.statusCode)
                    }
                }
            default:
                completion([], response.response!.statusCode)
            }
        }
    }
    
    // MARK:getFuelTypes
    static func getFuelTypes(completion:@escaping(_ FuelTypes:[String],_ StatusCode:Int)->Void){
        let RequestURL:String = "\(self.domain)/fuel_types"
        Alamofire.request(RequestURL).responseJSON { (response) in
            switch response.response!.statusCode{
            case 200:
                if let data = response.result.value as? [String:AnyObject]{
                    if let fuelTypeList = data["fuel_types"] as? [String]{
                        completion(fuelTypeList, response.response!.statusCode)
                    }
                }
            default:
                completion([], response.response!.statusCode)
            }
        }
    }
}
