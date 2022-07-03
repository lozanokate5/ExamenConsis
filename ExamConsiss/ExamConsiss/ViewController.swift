//
//  ViewController.swift
//  ExamConsiss
//
//  Created by catalina lozano on 02/07/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var myData: UITextField!
    @IBOutlet weak var myTable: UITableView!
    
    var productos:[String] = [("azucar"),("amarillo"),("jamon"),("leche"),("pan"),("papel"),("servilletas")]
    var desF:[String] = [("$15"),("$20"),("$38"),("$44"),("$65"),("$36"),("$12")]
    
    var imageF = [UIImage(named: "azucar"),UIImage(named: "amarillo"),UIImage(named: "jamon"),UIImage(named: "leche"),UIImage(named: "pan"),UIImage(named: "papel"),UIImage(named: "nuevo")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTable.dataSource = self
        myTable.delegate = self
        
        myData.delegate = self
        myData.resignFirstResponder()
    }
    
    @IBAction func AddNewData(_ sender: Any) {
        if myData.text.elementsEqual(1){
            print("ok")
        }
        
        guard let data = myData.text else {return}
        productos.append(data)
        desF.append("$35")
        let images = UIImage(named: "nuevo")
        imageF.insert(images, at: 0)
        let alertTitle = "Save Data"
        let alertMessage = "Data has been added in tableview successfully"
        let alertBox = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertBox.addAction(alertAction)
        present(alertBox, animated: true, completion: nil)
        myTable.reloadData()
        myData.text = ""
    }
    
}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
        cell.textLabel?.text = productos[indexPath.row]
        cell.detailTextLabel?.text = desF[indexPath.row]
        cell.imageView?.image = self.imageF[indexPath.row]
        
        return cell
    }
}
extension ViewController: UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField)->Bool{
        textField.resignFirstResponder()
        return true
    }
}
