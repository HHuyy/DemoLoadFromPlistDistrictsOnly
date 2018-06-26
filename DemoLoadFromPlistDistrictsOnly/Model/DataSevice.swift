//
//  DataSevice.swift
//  DemoLoadFromPlistDistrictsOnly
//
//  Created by Đừng xóa on 6/26/18.
//  Copyright © 2018 Đừng xóa. All rights reserved.
//

import Foundation
typealias DICT = Dictionary<AnyHashable, Any>
class DataSevice {
    static var share: DataSevice = DataSevice()
    private var _districts: [District]?
    var districts: [District] {
        get {
            if _districts == nil {
                getDataDistricts()
            }
            return _districts ?? []
        }
        set {
            _districts = newValue
        }
    }
    
    func getDataDistricts() {
        _districts = []
        var results: DICT?
        let filePath = Bundle.main.path(forResource: "Districts", ofType: "plist")
        FileManager.default.fileExists(atPath: filePath!)
        let data = FileManager.default.contents(atPath: filePath!)
        do {
            let root = try PropertyListSerialization.propertyList(from: data!, options: .mutableContainersAndLeaves, format: nil) as? DICT
            results = root
        } catch {
            print("PropertyListSerialization Error")
        }
        
        guard let dictionary = results else {return}
        guard let districtDictionary = dictionary["Districts"] as? [DICT] else {return}
        for districtObject in districtDictionary {
            if let district = District(dictionary: districtObject) {
                _districts?.append(district)
            }
        }
    }
    
}
