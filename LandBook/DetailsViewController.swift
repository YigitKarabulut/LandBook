//
//  DetailsViewController.swift
//  LandBook
//
//  Created by Yigit on 28.08.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var lblLandName: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedLandName = ""
    var selectedLandImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblLandName.text = selectedLandName
        imageView.image = selectedLandImage 
    }
    

   

}
