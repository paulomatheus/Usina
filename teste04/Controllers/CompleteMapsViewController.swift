//
//  CompleteMapsViewController.swift
//  teste04
//
//  Created by Paulo Matheus on 13/09/2018.
//  Copyright © 2018 Paulo Matheus. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class CompleteMapsViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mvCompleteMap: MKMapView!
	@IBOutlet weak var btApp: UIBarButtonItem!
	//Apple Maps
    let initialLocation = CLLocation(latitude: -22.2562, longitude: -45.6955)
    let regionRadius: CLLocationDistance = 200
	let locationManager: CLLocationManager = CLLocationManager()
	
	
	
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mvCompleteMap.setRegion(coordinateRegion, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerMapOnLocation(location: initialLocation)
		locationManager.delegate = self
		locationManager.requestWhenInUseAuthorization()
		locationManager.startUpdatingLocation()

        //Comando para deixar a fonte em negrito
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.heavy)
        ]
        // Do any additional setup after loading the view.
    }
	
	@IBAction func openApp(_ sender: UIBarButtonItem) {
        openMapForPlace()
	}
	
	
	//openMapForPlace()
	//Funcão para abrir o app Maps
	func openMapForPlace() {
		
		let latitude: CLLocationDegrees = -22.2562
		let longitude: CLLocationDegrees = -45.6955
		
		let regionDistance:CLLocationDistance = 16
		let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
		let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
		let options = [
			MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
			MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
		]
		let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
		let mapItem = MKMapItem(placemark: placemark)
		mapItem.name = "Inatel"
		mapItem.openInMaps(launchOptions: options)
	}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
