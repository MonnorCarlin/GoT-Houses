//
//  ViewController.swift
//  GoT-Houses
//
//  Created by Laird Connor Stephen Marlin I, Exquire on 6/19.
//  Copyright © 2019 Laird Connor Stephen Marlin I, Exquire. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
//    var houses = ["House 1", "House 2", "House 4"] test to initially make sure tableView works, will require replacing variables below once discarded
    
    var houses = Houses() //new, more compressed array of all house info needed
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // crucial to getting items to load
        tableView.dataSource = self
        tableView.delegate = self
        
        houses.getHouses {
            self.tableView.reloadData() //PUTS DATA IN TABLE
        }
        
        
    }


}

//MARK:- setup for tableView, make sure it appears as extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.houseArray.count //sneak housearray here to make it work...
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1). \(houses.houseArray[indexPath.row].name)" //...same here, .name makes it a string (data won't show at this point; don't fret, + 1 area shows which number ur on
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! HouseDetailViewController
        if segue.identifier == "ShowDetail" { // if statement not really necessary (code inside IS) bc only 1 segue
         let selectedIndex = tableView.indexPathForSelectedRow! //these two lines put code into detail
            destination.houseInfo = houses.houseArray[selectedIndex.row]
        } 
    }
}
