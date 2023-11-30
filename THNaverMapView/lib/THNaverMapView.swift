// The Swift Programming Language
// https://docs.swift.org/swift-book
import UIKit
import NMapsMap
import CoreLocation

open class THNMapView: UIView {
    
    private lazy var mapView: NMFMapView = {
        var mapView = NMFMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    private let mng = NMFAuthManager()
    private var delegate: THNMapViewDelegate?
    private var iconImage: UIImage = UIImage()
    private var isZoom: CGFloat = 15
        
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    private func setupLayout() {
        self.addSubview(mapView)
        
        self.mng.delegate = self
        self.mapView.touchDelegate = self
        self.mapView.addCameraDelegate(delegate: self)
        
        self.mapView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.mapView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        self.mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        self.mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
    public func setup(_ delegate: THNMapViewDelegate,
               location: CLLocationCoordinate2D,
               icon: UIImage,
               isZoom: CGFloat = 15) {
        self.moveCamera(location)
        self.iconImage = icon
        self.isZoom = isZoom
        self.delegate = delegate
    }
    
    public func reload(_ dto: [THNMapDto]) {
        dto.forEach { data in
            self.setCamera(data)
        }
    }
    
    private func setCamera(_ dto: THNMapDto) {
        let marker = NMFMarker()
        marker.iconImage = NMFOverlayImage(image: dto.icon ?? self.iconImage)
        marker.width = CGFloat(NMF_MARKER_SIZE_AUTO)
        marker.height = CGFloat(NMF_MARKER_SIZE_AUTO)
        if let name = dto.name { marker.captionText = name }
        marker.position = dto.nmgLatLng
        
        marker.touchHandler = { (overlay: NMFOverlay) -> Bool in
            self.delegate?.thNMapViewDidTap(dto)
            return true
        }
        marker.mapView = self.mapView
    }
    
    public func moveCamera(_ location: CLLocationCoordinate2D, icon: UIImage? = nil) {
        let nmgLatLng = NMGLatLng(lat: location.latitude, lng: location.longitude)
        let position = NMFCameraPosition(nmgLatLng, zoom: self.isZoom, tilt: 0, heading: 0)
        let updated = NMFCameraUpdate(position: position)
        
        self.mapView.moveCamera(updated)
        self.mapView.mapType = .basic
        self.mapView.symbolScale = 1.0
    }
}

extension THNMapView: NMFAuthManagerDelegate {
    public func authorized(_ state: NMFAuthState, error: Error?) {
        guard let error = error else { return }
        delegate?.thNMapViewErrorState(error)
    }
}

extension THNMapView: NMFMapViewTouchDelegate {}

extension THNMapView: NMFMapViewCameraDelegate {}
