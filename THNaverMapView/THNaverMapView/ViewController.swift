//
//  ViewController.swift
//  THNaverMapView
//
//  Created by 유태훈 on 11/29/23.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var mapView: THNMapView!

    @IBAction func moveTapped(_ sender: UIButton) {
        mapView.moveCamera(CLLocationCoordinate2D(latitude: 37.29477, longitude: 127.1213))
    }
    
    let dto: [THNMapDto] = [THNMapDto(0,
                                      location: CLLocationCoordinate2D(latitude: 37.51012, longitude: 127.0631),
                                      name: "신라스테이(삼성역)",
                                      icon: UIImage(named: "specialIcon")),
                           THNMapDto(1,
                                     location: CLLocationCoordinate2D(latitude: 37.50901, longitude: 127.0608),
                                     name: "인터컨티넨탈호텔"),
                           THNMapDto(2,
                                     location: CLLocationCoordinate2D(latitude: 37.51114, longitude: 127.0583),
                                     name: "오크우드호텔(코엑스)"),
                           THNMapDto(3,
                                     location: CLLocationCoordinate2D(latitude: 37.51435, longitude: 127.0616),
                                     name: "꽂지고기집"),
                           THNMapDto(4,
                                     location: CLLocationCoordinate2D(latitude: 37.5143492, longitude: 127.0616172),
                                     name: "대웅제약본사"),
                           THNMapDto(5,
                                     location: CLLocationCoordinate2D(latitude: 37.51049, longitude: 127.0669),
                                     name: "강남소방서"),
                           THNMapDto(6,
                                     location: CLLocationCoordinate2D(latitude: 37.5104855, longitude: 127.0669173),
                                     name: "잠실야구장"),
                           THNMapDto(7,
                                     location: CLLocationCoordinate2D(latitude: 37.51563, longitude: 127.0682),
                                     name: "봉은교(다리)"),
                           THNMapDto(8,
                                     location: CLLocationCoordinate2D(latitude: 37.5156257, longitude: 127.0682047),
                                     name: "경기고등학교"),
                           THNMapDto(9,
                                     location: CLLocationCoordinate2D(latitude: 37.50517, longitude: 127.0626),
                                     name: "휘문고등학교")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.setup(self,
                      location: CLLocationCoordinate2D(latitude: 37.5051654, longitude: 127.0625883),
                      icon: UIImage(named: "mapIcon")!)
        mapView.reload(dto)
    }
}

extension ViewController: THNMapViewDelegate {
    func thNMapViewErrorState(_ error: Error) {
        print("error:::::", error)
    }
    
    func thNMapViewDidTap(_ data: THNMapDto) {
        infoLabel.text = "\(data.index), \(data.name ?? "-")\nlatitude:\(data.location.latitude), longitude:\(data.location.longitude)"
    }
}
