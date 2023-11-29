//
//  File.swift
//  
//
//  Created by 유태훈 on 11/28/23.
//

import UIKit
import CoreLocation
import NMapsMap

public struct THNMapDto {
    public var index: Int
    public var location: CLLocationCoordinate2D
    public var name: String?
    public var description: String?
    public var icon: UIImage?
    public var data: Any?

    init(_ index: Int, location: CLLocationCoordinate2D, name: String? = nil, description: String? = nil, icon: UIImage? = nil, data: Any? = nil) {
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
