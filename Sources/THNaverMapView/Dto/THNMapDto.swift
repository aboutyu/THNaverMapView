//
//  File.swift
//  
//
//  Created by 유태훈 on 11/28/23.
//

import Foundation
import CoreLocation

public struct THNMapDto {
    var index: Int
    var location: CLLocationCoordinate2D
    var name: String?
    var description: String?
    var icon: UIImage?
    var data: Any?

    init(_ index: Int, location: CLLocationCoordinate2D, name: String? = nil, description: String? = nil, icon: UIImage? = nil, data: Any?) {
        self.index = index
        self.location = location
        self.name = name
        self.description = description
        self.icon = icon
        self.data = data
    }
    
    var viewPoint: CGPoint {
        return CGPoint(x: location.latitude, y: location.longitude)
    }
    
    var nmgLatLng: NMGLatLng {
        return NMGLatLng(lat: location.latitude, lng: location.longitude)
    }
}
