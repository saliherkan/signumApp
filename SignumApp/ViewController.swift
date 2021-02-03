//
//  ViewController.swift
//  SignumApp
//
//  Created by Salih Erkan Sandal on 3.02.2021.
//

import UIKit
import Foundation

class AnaSayfaVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var aramaText: UITextField!
    
    var viewModel = AnaSayfaVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        closureler()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Filmler"
    }
    
    func closureler() {
        viewModel.tableViewYenile = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                
            }
        }
    }
    
    @IBAction func aramaBtnClick(_ sender: Any) {
        if aramaText.text != "" && aramaText.text != nil {
            viewModel.veriCek(arama: aramaText.text!)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.veriler?.search.count ?? 0
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.veriler?.search[indexPath.row].title ?? ""
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = viewModel.veriler?.search[indexPath.row].imdbid
        let vc = DetayAramaVC.instantiate()
        let vm = DetayAramaVM()
        vm.idCekk = id
        vc.viewModel = vm
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}
extension AnaSayfaVC: StoryboardInstantiate {
    static var storyboardType: StoryboardType { return .main }
}

