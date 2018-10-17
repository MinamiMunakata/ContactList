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
    
    navigationItem.rightBarButtonItem = editButtonItem
    navigationController?.isToolbarHidden = true
  }
  @IBAction func deleteItems(_ sender: Any) {
    // update model
    if let indexPaths = collectionView.indexPathsForSelectedItems {
      let indices = indexPaths.map { $0.item }.sorted().reversed()
//      indexPaths.sort{ $0.item > $1.item }
      for index in indices {
        ViewController.contacts.remove(at: index)
      }
      // update collectionView
      collectionView.deleteItems(at: indexPaths)
    }
    // update collectionView
    navigationController?.isToolbarHidden = true
  }
  
  override func setEditing(_ editing: Bool, animated: Bool) {
    super.setEditing(editing, animated: animated)
    collectionView.allowsMultipleSelection = true
    let indexPaths = collectionView.indexPathsForVisibleItems
    for indexPath in indexPaths {
      let cell = collectionView.cellForItem(at: indexPath) as! StudentsCollectionViewCell
      cell.isEditing = editing
    }
    if !editing {
      navigationController?.isToolbarHidden = true
      for indexPath in indexPaths {
        let cell = collectionView.cellForItem(at: indexPath) as! StudentsCollectionViewCell
        cell.selectImage.image = UIImage(named: "Unchecked")
      }
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
    cell.isEditing = isEditing
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if isEditing {
      navigationController?.isToolbarHidden = false
    } else {
      performSegue(withIdentifier: "DetailFromeCollection", sender: indexPath)
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "DetailFromeCollection" {
      if let dest = segue.destination as? DetailViewController, let index = sender as? IndexPath {
        dest.name = ViewController.contacts[index.item][0]
        dest.country = ViewController.contacts[index.item][1]
        
      }
    }
  }
  
  override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    if isEditing {
      if let indexPaths = collectionView.indexPathsForSelectedItems, indexPaths.count == 0 {
        navigationController?.isToolbarHidden = true
      }
    }

  }
}
