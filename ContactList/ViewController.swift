//
//  ViewController.swift
//  ContactList
//
//  Created by minami on 2018-10-09.
//  Copyright © 2018 宗像三奈美. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  static var contacts = [["Kenta","Japan"], ["Minami","Japan"], ["Marcelo","Brasil"], ["Giada","Italy"],
                         ["Nagisa","Japan"], ["Bianca","Brasil"], ["Yukako","Japan"], ["Rei","Japan"],
                         ["Alex","South Korea"], ["Javier","Maexico"], ["Juan","Mexico"], ["Natsumi","Japan"],
                         ["Suelen","Brasil"], ["Marla","Brasil"], ["Emre E","Turkey"], ["Gustavo","Brasil"],
                         ["Chin","Thailand"], ["Charles","China"], ["Emre A","Turkey"]]
  
  @IBOutlet weak var myTableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    myTableView.dataSource = self
    myTableView.rowHeight = 90
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "Details", let detailVC = segue.destination as? DetailViewController {
      if let cell = sender as? ContactTableViewCell, let indexPath = myTableView.indexPath(for: cell) {
        let name = ViewController.contacts[indexPath.row][0]
        let country = ViewController.contacts[indexPath.row][1]
        detailVC.name = name
        detailVC.country = country
      }
    }
  }
  
  
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return ViewController.contacts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ContactTableViewCell
    let name = ViewController.contacts[indexPath.row][0]
    let country = ViewController.contacts[indexPath.row][1]
    cell.nameLabel.text = name
    cell.countryLabel.text = country
    return cell
  }
  
  
}

extension ViewController: UITableViewDelegate {
  
}

