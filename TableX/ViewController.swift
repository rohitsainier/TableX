//
//  ViewController.swift
//  TableX
//
//  Created by Rohit Saini on 10/02/21.
//

import UIKit

class ViewController: UIViewController {

    //OUTLETS
    @IBOutlet weak var tableViewRight: UITableView!
    @IBOutlet weak var tableViewLeft: UITableView!
    
    private var moveVM = MoveViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configUI()
    }
    
    private func configUI(){
        tableViewLeft.register(UINib(nibName: "MoveCell", bundle: nil), forCellReuseIdentifier: "MoveCell")
        tableViewRight.register(UINib(nibName: "MoveCell", bundle: nil), forCellReuseIdentifier: "MoveCell")
    }
    

    //MARK:- Actions
    @IBAction func clickMoveRightBtn(_ sender: UIButton) {
        moveVM.moveRight()
        DispatchQueue.main.async {
            self.tableViewLeft.reloadData()
            self.tableViewRight.reloadData()
        }
        
    }
    

    @IBAction func clickMoveLeftBtn(_ sender: UIButton) {
        moveVM.moveLeft()
        DispatchQueue.main.async {
            self.tableViewLeft.reloadData()
            self.tableViewRight.reloadData()
        }
    }
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewLeft{
            return moveVM.leftScoreArr.count
        }
        else{
            return moveVM.rightScoreArr.count
        }
        
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableViewLeft{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoveCell", for: indexPath) as? MoveCell else{return UITableViewCell()
            }
            if moveVM.leftScoreArr[indexPath.row].isSelected{
                cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            }
            else{
                cell.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            cell.nameLbl.text = moveVM.leftScoreArr[indexPath.row].name
            cell.scoreLbl.text = "\(moveVM.leftScoreArr[indexPath.row].score)"
            
            cell.addBtn.tag = indexPath.row
            cell.removeBtn.tag = indexPath.row
            cell.addBtn.addTarget(self, action: #selector(leftIncrease), for: .touchUpInside)
            cell.removeBtn.addTarget(self, action: #selector(leftDecrease), for: .touchUpInside)
            return cell
        }
        else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoveCell", for: indexPath) as? MoveCell else{return UITableViewCell()
            }
            if moveVM.rightScoreArr[indexPath.row].isSelected{
                cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            }
            else{
                cell.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            cell.nameLbl.text = moveVM.rightScoreArr[indexPath.row].name
            cell.scoreLbl.text = "\(moveVM.rightScoreArr[indexPath.row].score)"
            cell.addBtn.tag = indexPath.row
            cell.removeBtn.tag = indexPath.row
            cell.addBtn.addTarget(self, action: #selector(rightIncrease), for: .touchUpInside)
            cell.removeBtn.addTarget(self, action: #selector(rightDecrease), for: .touchUpInside)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableViewLeft{
            moveVM.selectLeftCell(index: indexPath.row)
            DispatchQueue.main.async {
                self.tableViewLeft.reloadData()
            }
        }
        else{
            moveVM.selectRightCell(index: indexPath.row)
            DispatchQueue.main.async {
                self.tableViewRight.reloadData()
            }
        }
    }
    
    @objc func leftIncrease(sender: UIButton){
        
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else{return}
            self.moveVM.leftIncrease(index: sender.tag)
            self.tableViewLeft.reloadData()
        }
    }
    @objc func leftDecrease(sender: UIButton){
       
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else{return}
            self.moveVM.leftDecrease(index: sender.tag)
            self.tableViewLeft.reloadData()
        }
    }
    
    
    @objc func rightIncrease(sender: UIButton){
        
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else{return}
            self.moveVM.rightIncrease(index: sender.tag)
            self.tableViewRight.reloadData()
        }
        
    }
    @objc func rightDecrease(sender: UIButton){
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else{return}
            self.moveVM.rightDecrease(index: sender.tag)
            self.tableViewRight.reloadData()
        }
    }

    
}

