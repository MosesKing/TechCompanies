//
//  TechCompaniesViewController.swift
//  Mkc42TechCompanies
//
//  Created by Moesaeah King on 10/10/16.
//  Copyright © 2016 Moesaeah King. All rights reserved.
//
import MapKit
import UIKit

class TechCompaniesViewController: UIViewController {

     var company : Company?
     @IBOutlet weak var MapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     MapView.mapType = MKMapType.hybrid
     if let company = company{
          let annotatation = MKPointAnnotation()
          annotatation.coordinate = CLLocationCoordinate2DMake(company.latitude, company.longitude)
          annotatation.title = company.name
          let latitude = String(company.latitude)
          let longitude = String(company.longitude)
          
          let location = latitude + "," + longitude
          
          annotatation.subtitle = location
          
          MapView.addAnnotation(annotatation)
     
    }

    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
}
