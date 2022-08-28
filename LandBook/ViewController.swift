//
//  ViewController.swift
//  LandBook
//
//  Created by Yigit on 28.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var landImages = [UIImage]()
    
    var landNames = [String] ()
    
    var chosenLandName = ""
    var chosenLandImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        landNames.append("Colosseum")
        landNames.append("Great Wall")
        landNames.append("Ayasofia")
        landNames.append("Kremlin")
        landNames.append("London Bridge")
        landNames.append("Taj Mahal")
        
        
        landImages.append(UIImage(named: "colosseum.jpeg")!)
        landImages.append(UIImage(named: "greatwall.jpeg")!)
        landImages.append(UIImage(named: "ayasofia.jpeg")!)
        landImages.append(UIImage(named: "kremlin.jpeg")!)
        landImages.append(UIImage(named: "londonbridge.jpeg")!)
        landImages.append(UIImage(named: "tajmahal.jpeg")!)
        
        
         
        
        
        
    }
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenLandName = landNames[indexPath.row]
        chosenLandImage = landImages[indexPath.row]
        
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedLandName = chosenLandName
            destinationVC.selectedLandImage = chosenLandImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landNames.remove(at: indexPath.row)
            self.landImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}

