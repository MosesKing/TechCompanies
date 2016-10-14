//
//  TechCompaniesTableViewController.swift
//  Mkc42TechCompanies
//
//  Created by Moesaeah King on 10/10/16.
//  Copyright © 2016 Moesaeah King. All rights reserved.
//

import UIKit

class TechCompaniesTableViewController: UITableViewController {
     var techCompanies = TechCompanies()
     
    override func viewDidLoad() {
     super.viewDidLoad()
     
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
     techCompanies.loadFromJSONFileInBundle(fileName: "techcompanies (1)")

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return techCompanies.regions.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
     return techCompanies.regions[section].companies.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "techcompanies", for: indexPath)

        // Configure the cell...
          cell.textLabel?.text = techCompanies.regions[indexPath.section].companies[indexPath.row].name
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
     override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
          return techCompanies.regions[section].name
     }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if let destination = segue.destination as? TechCompaniesViewController{
          if let indexPath = tableView.indexPathForSelectedRow{
               destination.company = techCompanies.regions[indexPath.section].companies[indexPath.row]
          }
     }

}
}
