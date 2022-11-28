//
//  MapViewController.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/10.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import UIKit
import MapKit
import RxSwift
import RxCocoa

class MapViewController: BaseVC<MapViewModel>, findAllItemsPresentable, MKMapViewDelegate, CLLocationManagerDelegate{
    var findAllItemsData = PublishSubject<[HomeModel]>()
    
    let mapView = MKMapView()
    var locationManager = CLLocationManager()
    
    let disposeBag = DisposeBag()
    
    func goSetting() {
        
        let alert = UIAlertController(title: "위치권한 요청", message: "러닝 거리 기록을 위해 항상 위치 권한이 필요합니다.", preferredStyle: .alert)
        let settingAction = UIAlertAction(title: "설정", style: .default) { action in
            guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
            // 열 수 있는 url 이라면, 이동
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { UIAlertAction in
            
        }
        
        alert.addAction(settingAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func checkCurrentLocationAuthorization(authorizationStatus: CLAuthorizationStatus) {
        switch authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        case .restricted:
            print("restricted")
            goSetting()
        case .denied:
            print("denided")
            goSetting()
        case .authorizedAlways:
            print("always")
        case .authorizedWhenInUse:
            print("wheninuse")
            locationManager.startUpdatingLocation()
        @unknown default:
            print("unknown")
        }
        if #available(iOS 14.0, *) {
            let accuracyState = locationManager.accuracyAuthorization
            switch accuracyState {
            case .fullAccuracy:
                print("full")
            case .reducedAccuracy:
                print("reduced")
            @unknown default:
                print("Unknown")
            }
        }
    }
    
    func checkUserLocationServicesAuthorization() {
        let authorizationStatus: CLAuthorizationStatus
        if #available(iOS 14, *) {
            authorizationStatus = locationManager.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.checkCurrentLocationAuthorization(authorizationStatus: authorizationStatus)
            }
        }
    }
    
    func goLocation(latitudeValue: CLLocationDegrees,
                    longtudeValue: CLLocationDegrees,
                    delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        mapView.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    // 특정 위도와 경도에 핀 설치하고 핀에 타이틀과 서브 타이틀의 문자열 표시
    func setAnnotation(latitudeValue: CLLocationDegrees,
                       longitudeValue: CLLocationDegrees,
                       delta span :Double,
                       title strTitle: String,
                       subtitle strSubTitle:String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longtudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubTitle
        mapView.addAnnotation(annotation)
    }
    
    override func configureVC() {
        locationManager.requestAlwaysAuthorization()
        checkUserLocationServicesAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        
        viewModel.findAllItems()
        findAllItemsData.subscribe(onNext: { ee in
            print("ee = \(ee)")
        }).disposed(by: disposeBag)
    }
    
    override func addView() {
        view.addSubViews(mapView)
    }
    
    override func setLayout() {
        mapView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
