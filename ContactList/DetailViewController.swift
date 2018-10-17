//
//  DetailViewController.swift
//  ContactList
//
//  Created by minami on 2018-10-09.
//  Copyright © 2018 宗像三奈美. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var nameLabel: UILabel! {
    didSet {
      nameLabel.text = name
    }
  }
  @IBOutlet weak var countryLabel: UILabel! {
    didSet {
      countryLabel.text = country
    }
  }
  @IBOutlet weak var biography: UITextView!
  
  var name: String!
  var country: String!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  
}
