//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 福田素士 on 2021/03/13.
//

import UIKit

class ViewController: UIViewController {

    // 配列に画像３枚格納
    let PicSelect = ["image_MB01.jpg" , "image_MB02.jpg" , "image_MB03.jpg"]
    // 画像選択用変数
    var PicNumber :Int = 0
    // 配列カウント用
    var PicCount :Int = 0
    // ホームボタン初期タイトル
    var HomeBtnName = "PLAY"
    // タイマー
    var timer:Timer!
    // タイマー時間用
    var timer_sec: Float = 0
    // 画像情報表示用
    var Info: String = ""
    
    // オブジェクト配置
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var btn_next: UIButton!
    @IBOutlet weak var btn_back: UIButton!
    @IBOutlet weak var btn_play: UIButton!
    @IBOutlet weak var ImageInfo: UILabel!
    
    // 送りボタンが押された
    @IBAction func btn_next(_ sender: UIButton) {
        PicNext()
    }
        
    // 戻りボタンが押された
    @IBAction func btn_baxk(_ sender: UIButton) {
        PicBack()
    }
    
    // プレイボタンが押された
    @IBAction func btn_play(_ sender: Any) {
        // スライドショー停止中
        if (timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changePic), userInfo: nil, repeats: true)
            btn_next.isHidden = true
            btn_back.isHidden = true
            btn_play.setImage(UIImage(named: "btn_stop"), for: UIControl.State.normal) // ボタン画像の変更
        // スライドショー実行中
        } else {
            btn_next.isHidden = false
            btn_back.isHidden = false
            btn_play.setImage(UIImage(named: "btn_play"), for: UIControl.State.normal) // ボタン画像の変更
            timer.invalidate()
            timer = nil
        }
    }
       
    // 遷移先にデータを渡す
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    // 画像送りボタン処理
    func PicNext() {
        PicNumber += 1
        if (PicNumber == PicSelect.count) {
            PicNumber = 0
        }
        ImageView.image = UIImage(named: PicSelect[PicNumber])
        showInfo() // 画像情報表示
    }
    
    // 画像戻しボタン処理
    func PicBack() {
        PicNumber -= 1
        if (PicNumber == -1) {
            PicNumber = 2
        }
        ImageView.image = UIImage(named: PicSelect[PicNumber])
        showInfo() // 画像情報表示
    }
    
    // 画像情報表示
    func showInfo() {
        Info = "NO.\(PicNumber + 1)   " + PicSelect[PicNumber]
        ImageInfo.text = Info
    }
          
    // スライドショー開始
    @objc func changePic(_ timer: Timer) {
        PicNumber += 1
        if (PicNumber == PicSelect.count) {
            PicNumber = 0
        }
        ImageView.image = UIImage(named: PicSelect[PicNumber])
        showInfo() // 画像情報表示
    }
    
    // 遷移処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // もしスライド中ならばスライドを止めてボタンも戻す
        if (timer != nil) {
            btn_next.isHidden = false
            btn_back.isHidden = false
            btn_play.setImage(UIImage(named: "btn_play"), for: UIControl.State.normal) // ボタン画像の変更
            timer.invalidate()
            timer = nil
        }
        // 遷移先のViewControllerを取得
        let nextView = segue.destination as! ViewController2
        // 次画面に渡すデータ処理
        nextView.PicSelect2 = PicSelect[PicNumber]

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        // 画像表示
        ImageView.image = UIImage(named: PicSelect[PicNumber])
        
        showInfo() // 画像情報表示
    }
}

