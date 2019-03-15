//
//  ConcentrationThemeChooserViewController.swift
//  cs193p-Concentration
//
//  Created by Grigoriy Romanyuk on 3/14/19.
//  Copyright © 2019 Grigoriy Romanyuk. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {
    
    
    let themes = ["Sports":"⚽️🏹🥊🛹🥊🏈🎾🏐🏉🏓🏸🏑🥍🏏",
                  "Animals":"🐭🐹🐰🐮🦆🦇🐺🦊🐻🦁🐴🦄",
                  "Faces":"😁🤩😒🤒😷🤮😡😭😠🤢😘😩☹️😓"]
    // MARK: - Navigation


    
    private var splitViewDetailConcentrationViewController: ConcentrationViewController? {
        
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    @IBAction func changeTheme(_ sender: Any) {
        if let cvc = splitViewDetailConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
            }
        } else {
            performSegue(withIdentifier: "Choose theme", sender: sender)
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Choose theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                print(themeName)
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                }
            }
        }
    }


}
