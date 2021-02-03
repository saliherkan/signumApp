//
//  DetayAramaVC.swift
//  SignumApp
//
//  Created by Salih Erkan Sandal on 3.02.2021.
//

import UIKit
import Foundation

class DetayAramaVC: UIViewController{
    
    var viewModel: DetayAramaVM!
    
    @IBOutlet weak var ikinciLbl: UILabel!
    @IBOutlet weak var denemLbl: UILabel!
    @IBOutlet weak var ucuncuLbl: UILabel!
    @IBOutlet weak var dorduncuLbl: UILabel!
    @IBOutlet weak var besLbl: UILabel!
    @IBOutlet weak var altiLbl: UILabel!
    
    @IBOutlet weak var yediLbl: UILabel!
    @IBOutlet weak var sekizLbl: UILabel!
    @IBOutlet weak var dokuzLbl: UILabel!
    @IBOutlet weak var onLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.verileriYenile = { [weak self] in
            self?.verileriGoster()
        }
        viewModel.veriCek()
    }
    
    private func verileriGoster(){
        DispatchQueue.main.async {
            self.ikinciLbl.text = self.viewModel.detaylar?.year
            self.ucuncuLbl.text = self.viewModel.detaylar?.actors
            self.dorduncuLbl.text = self.viewModel.detaylar?.boxOffice
            self.besLbl.text = self.viewModel.detaylar?.country
            self.altiLbl.text = self.viewModel.detaylar?.dvd
            self.yediLbl.text = self.viewModel.detaylar?.imdbRating
            self.sekizLbl.text = self.viewModel.detaylar?.language
            self.dokuzLbl.text = self.viewModel.detaylar?.production
            self.onLbl.text = self.viewModel.detaylar?.rated
            self.title = self.viewModel.detaylar?.title
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Detaylar"
        
    }
    
}
extension DetayAramaVC: StoryboardInstantiate {
    static var storyboardType: StoryboardType { return .detayarama }
}
