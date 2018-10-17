//
//  StudentsCollectionViewCell.swift
//  ContactList
//
//  Created by minami on 2018-10-17.
//  Copyright © 2018 宗像三奈美. All rights reserved.
//

import UIKit

class StudentsCollectionViewCell: UICollectionViewCell {
    
  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var selectImage: UIImageView!
  
  var isEditing: Bool = false {
    didSet {
      selectImage.isHidden = !isEditing
    }
  }
  
  override var isSelected: Bool {
    didSet {
      if isEditing {
        selectImage.image = isSelected ? UIImage(named: "Checked") : UIImage(named: "Unchecked")
      }
    }
  }
}
