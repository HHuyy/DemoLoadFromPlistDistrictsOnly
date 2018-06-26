//
//  Districts.swift
//  DemoLoadFromPlistDistrictsOnly
//
//  Created by Đừng xóa on 6/26/18.
//  Copyright © 2018 Đừng xóa. All rights reserved.
//

import Foundation

class District {
    var name: String
    var districtCode: Int
    var cityCode: Int
    
    init?(dictionary: DICT) {
        guard let name = dictionary["Name"] as? String else {return nil}
        guard let districtCode = dictionary["DistrictCode"] as? Int else {return nil}
        guard let cityCode = dictionary["CityCode"] as? Int else {return nil}
        
        self.name = name
        self.cityCode = cityCode
        self.districtCode = districtCode
    }
    
}
