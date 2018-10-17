//
//  StudentsCollectionViewController.swift
//  ContactList
//
//  Created by minami on 2018-10-17.
//  Copyright © 2018 宗像三奈美. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CollectionCell"

class StudentsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

  // DataSource - how we display cells ...
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return ViewController.contacts.count
  }
  
  // Delegate - what to do ...
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    // configure cell
    return cell
  }
}
