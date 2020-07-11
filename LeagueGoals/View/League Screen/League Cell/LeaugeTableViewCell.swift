//
//  LeaugeTableViewCell.swift
//  LeagueGoals
//
//  Created by Abdelrahman Sobhy on 7/2/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit
protocol LeaugeCellView {
    func display(leagueName : String?)
    func display(leagueShortName : String?)
    func display(leagueSport : String?)
    
}
class LeaugeTableViewCell: UITableViewCell {
    @IBOutlet weak private var leagueName: UILabel!
    @IBOutlet weak private var leagueShortName: UILabel!
    @IBOutlet weak private var leagueSport: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
extension LeaugeTableViewCell : LeaugeCellView {
    
    func display(leagueName: String?) {
        if leagueName != "" {
            self.leagueName.isHidden = false
            self.leagueName.text = leagueName
        }
    }
    
    func display(leagueShortName: String?) {
        if leagueShortName != "" {
            self.leagueShortName.isHidden = false
            self.leagueShortName.text = leagueShortName
        }
    }
    
    func display(leagueSport: String?) {
        if leagueSport != "" {
            self.leagueSport.isHidden = false
            self.leagueSport.text = leagueSport
        }
    }
    
}
