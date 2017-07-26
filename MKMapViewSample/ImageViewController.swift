//
//  ImageViewController.swift
//  MKMapViewSample
//
//  Created by koogawa on 2015/10/12.
//  Copyright © 2015 koogawa. All rights reserved.
//

import UIKit
import MapKit

class ImageViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        let coordinate = CLLocationCoordinate2DMake(37.331652997806785, -122.03072304117417)
        let span = MKCoordinateSpanMake(0.003, 0.003)
        let region = MKCoordinateRegionMake(coordinate, span)
        mapView.setRegion(region, animated:true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "title"
        annotation.subtitle = "subtitle"
        self.mapView.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - MKMapView delegate

    // Called when the region displayed by the map view is about to change
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        print(#function)
    }

    // Called when the annotation was added
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }

        let reuseId = "image"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        if pinView == nil {
            pinView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            pinView?.image = UIImage(named: "Laugh")

            let rightButton: AnyObject! = UIButton(type: UIButtonType.detailDisclosure)
            pinView?.rightCalloutAccessoryView = rightButton as? UIView
        }
        else {
            pinView?.annotation = annotation
        }

        return pinView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print(#function)
        if control == view.rightCalloutAccessoryView {
            performSegue(withIdentifier: "toTheMoon", sender: self)
        }
    }

    // MARK: - Navigation

    @IBAction func didReturnToMapViewController(_ segue: UIStoryboardSegue) {
        print(#function)
    }
}
