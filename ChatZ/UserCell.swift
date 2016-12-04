//
//  UserCell.swift
//  ChatZ
//
//  Created by IOS Course Project on 12/3/16.
//  Copyright © 2016 IOS Course Projectvb. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var firstNameLBL: UILabel!
    
    @IBOutlet weak var contactImage: UIImageView!
    
        override func awakeFromNib() {
            super.awakeFromNib()
        }
    
//    func updateUI(user:User) {
//        firstNameLBL.text = user.firstName
//        //contactImage.image =
//    }
    
    
    func updateUI(user: User)
    {
        self.contactImage.layer.cornerRadius = self.contactImage.frame.size.height/2
        self.contactImage.clipsToBounds = true
        
        firstNameLBL.text = user.firstName
        
        let url = URL(string: user.profilePicURL)!
        
        
        DispatchQueue.global().async {
            do
            {
                let datax = try Data(contentsOf: url)
              
                DispatchQueue.global().sync {
                    self.contactImage.image = UIImage(data:datax)
                }
            }
            catch let error as NSError{
                print(error.debugDescription)
            }
        }
        
    }
}