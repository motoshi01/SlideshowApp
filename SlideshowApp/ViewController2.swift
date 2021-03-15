//
//  ViewController2.swift
//  SlideshowApp
//
//  Created by 福田素士 on 2021/03/14.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var BigImageView: UIImageView!
    
    var PicSelect2:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        BigImageView.image = UIImage(named: PicSelect2)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
