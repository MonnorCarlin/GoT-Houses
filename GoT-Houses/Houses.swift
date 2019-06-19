//
//  Houses.swift
//  GoT-Houses
//
//  Created by Laird Connor Stephen Marlin I, Exquire on 6/19.
//  Copyright © 2019 Laird Connor Stephen Marlin I, Exquire. All rights reserved.
//

import Foundation

import Alamofire // both imports needed to call upon data for getHouses
import SwiftyJSON

// includes all info for tableview (houseArray) as well as info needed to call on to get proper data (url and page number)
class Houses {
    var houseArray: [HousesInfo] = []
    var apiURL = "https://www.anapioficeandfire.com/api/houses?page=1&pageSize=50"
    var pageNumber = 1
    
    func getHouses(completed: @escaping() -> ()){ // gets all the data, will throw data once you call it COMPLETED IS CRUCIAL
        Alamofire.request(apiURL).responseJSON { response in
            switch response.result {
            case.success(let value):
                let json = JSON(value)
//                print("\(json)") lets you know that code is working before it prints fr
                let numberOfHouses = json.count //normally need ["results"] or whtever shows each page, but this api doesn't categorize w pages (see pokedex app)
                for index in 0..<numberOfHouses {
                    let name = json[index]["name"].stringValue
                    let region = json[index]["region"].stringValue
                    let coatOfArms = json[index]["coatOfArms"].stringValue
                    let words = json[index]["words"].stringValue
//                    print("\(index + 1) \(name) \(region) \(coatOfArms) \(words)") a good check to see ur getting the right stuff in debug
                    self.houseArray.append(HousesInfo(name: name, region: region, coatOfArms: coatOfArms, words: words))
                }
            case.failure(let error):
                print("ERROR: \(error.localizedDescription) failed to get data from url \(self.apiURL)")
            }
            completed() // CRUCIAL
        }
    }
}


