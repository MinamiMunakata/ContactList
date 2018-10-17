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
      let width = ( view.frame.size.width - 20 ) / 3
      let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
      layout.itemSize = CGSize(width: width, height: width)
      
      let refrech = UIRefreshControl()
      refrech.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
      collectionView.refreshControl = refrech
      
      navigationItem.leftBarButtonItem = editButtonItem
    }
  
  override func setEditing(_ editing: Bool, animated: Bool) {
    super.setEditing(editing, animated: animated)
    collectionView.allowsMultipleSelection = true
    let indexPaths = collectionView.indexPathsForVisibleItems
    for indexPath in indexPaths {
      let cell = collectionView.cellForItem(at: indexPath) as! StudentsCollectionViewCell
      cell.isEditing = editing
    }
    
    
    
  }
  
  func addStudent() {
    // update our model
    ViewController.contacts.append(["Yoshi", "Japan"])
    // update collectionView
    let indexPath = IndexPath(item: ViewController.contacts.count - 1, section: 0)
    collectionView.insertItems(at: [indexPath])
  }
  @objc
  func refresh() {
    // add 1 more extra student
    addStudent()
    collectionView.refreshControl?.endRefreshing() // end
  }

  // DataSource - how we display cells ...
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return ViewController.contacts.count
  }
  
  // Delegate - what to do ...
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! StudentsCollectionViewCell
    // configure cell
    cell.nameLabel.text = ViewController.contacts[indexPath.item][0]
    cell.profileImage.image = UIImage(named: "placeholder")
    return cell
  }
}
