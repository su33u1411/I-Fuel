//
//  ViewController.swift
//  Prices
//
//  Created by Subramanyam Mogili on 7/22/17.
//  Copyright © 2017 Subramanyam Mogili. All rights reserved.
//

import UIKit
import SVProgressHUD

class Index: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var PricesTableView: UITableView!
    
    var Cities:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        SVProgressHUD.show(withStatus: "Loading")
        SVProgressHUD.dismiss(withDelay: 2.0) { 
            PriceRequest.getListOfCities { (_ CitiesList:[String],_ HTTPResponse:Int) in
                self.Cities = CitiesList
                self.PricesTableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.Cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PricesCell = tableView.dequeueReusableCell(withIdentifier: "PricesTableView", for: indexPath) as! PricesCell
        cell.Cityname.text = self.Cities[indexPath.row]
        PriceRequest.getFuelRate(CityName: self.Cities[indexPath.row], FuelType: "petrol") { (_ price:Double, _ HTTPResponse:Int) in
            cell.PetrolPrice.text = "Petrol Price: \(price)₹"
        }
        PriceRequest.getFuelRate(CityName: self.Cities[indexPath.row], FuelType: "diesel") { (_ price:Double, _ HTTPResponse:Int) in            cell.DieselPrice.text = "Diesel Price: \(price)₹"
        }
        return cell
    }
}

