//
//  ViewController.swift
//  DropDownListDemo
//
//  Created by Smita Kankayya on 01/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var btnDropDown: UIButton!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var btnShow: UIButton!
    @IBOutlet var label: UILabel!
    
    var fruitList = ["Orange", "Banana", "Apple", "Blueberry", "Cherry", "Grape", "Strawberry"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.isHidden = true
        label.isHidden = true
        label.text = " This is simple Drop Down in which you can change according to your requirement."
    }
    
    @IBAction func onClickDropButton(_ sender: Any) {
        if tableView.isHidden{
            animate(toggle: true,type: btnDropDown)
        } else {
            animate(toggle: false,type: btnDropDown)
        }
        
    }
    @IBAction func onClickShowButton(_ sender: Any) {
        if label.isHidden{
            animate(toggle: true,type: btnShow)
        } else {
            animate(toggle: false,type: btnShow)
        }
    }
    
    func animate(toggle: Bool, type: UIButton){
        if type == btnDropDown{
            if toggle {
                UIView.animate(withDuration: 0.3){
                    self.tableView.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.3){
                    self.tableView.isHidden = true
                }
            }
        } else {
            if toggle {
                UIView.animate(withDuration: 0.3){
                    self.label.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.3){
                    self.label.isHidden = true
                }
            }
        }
    }
}

//MARK : UITableViewDataSource
extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = fruitList[indexPath.row]
        return cell
    }
}

//MARK : UITableViewDelegate
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        btnDropDown.setTitle("\(fruitList[indexPath.row])", for: .normal)
        animate(toggle: false,type: btnDropDown)
    }
}

