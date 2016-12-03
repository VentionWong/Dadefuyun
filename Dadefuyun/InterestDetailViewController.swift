//
//  InterestDetailViewController.swift
//  Dadefuyun
//
//  Created by 王灵峰 on 2016/11/28.
//  Copyright © 2016年 nathan. All rights reserved.
//

import UIKit
import AVFoundation

class InterestDetailViewController: UIViewController {

    @IBOutlet weak var openAmiView: OpenAmi!
    var lingfu: LingfuModel?
    let showImageWidth = UIScreen.main.bounds.size.width
    let showImageHeight = UIScreen.main.bounds.size.height
    @IBOutlet weak var lingfuImage3: UIImageView!
    
    // MARK: - 背景音乐控件
    @IBOutlet weak var ss: UIButton!
    var wheatherPlayorPause: Bool = false
    var aPlayer: AVAudioPlayer = AVAudioPlayer()
    @IBAction func playOrPause(_ sender: UIButton) {
        if wheatherPlayorPause {
            aPlayer.play()
            wheatherPlayorPause = false
            rotateMusicButton()
            
        }else {
            aPlayer.pause()
            wheatherPlayorPause = true
            stopRotateMusicButton()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.title = lingfu?.name
        
        
        //lingfuImage3.image = UIImage(named: (lingfu?.image)!)
        let getImage = UIImage(named: (lingfu?.image)!)
        lingfuImage3.image = cropToBounds(image: getImage!, width: Double(showImageWidth), height: Double(showImageHeight))
        
        if lingfu?.id != "0" { //已经开通的客户直接显示灵符，这里暂时用灵符id代替一下
            
        
        //}else { //没开通的客户显示动画
            
            // MARK: - QuartzCode做的动画，需要先添加一个UIView，然后绑定类
            openAmiView.addOldAnimation()
            //openAmiView.removeFromSuperview()
            
            // MARK: - 长按手势打开
            let longPress = UILongPressGestureRecognizer.init(target: self, action: #selector(QRLongPress(gesture:)))
            longPress.minimumPressDuration = 1
            self.view.addGestureRecognizer(longPress)

            
            
            
            
            
            
        }
        
        // MARK: - 播放背景音乐
//        let path = Bundle.main.url(forResource: "bgm", withExtension: "mp3")
//        aPlayer = try! AVAudioPlayer(contentsOf: path!, fileTypeHint: "AVFileTypeMPEGLayer3")
//        aPlayer.numberOfLoops = -1
//        aPlayer.prepareToPlay()
//        aPlayer.play()
//        rotateMusicButton()
        
        
        
        
        

        
        
        
        
//        //将导航栏设置成透明   子页目前没成功
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        self.navigationController!.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
//        
        //self.navigationController?.navigationBar.isHidden = true
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //判断用户是否已经开启灵符
        
        
        
        
        
    }
    
    
    
    
    //MARK: - 长按二维码识别
    func QRLongPress(gesture: UILongPressGestureRecognizer) {
        
        if (gesture.state == UIGestureRecognizerState.began) {
            
            UIView.animate(withDuration: 2.0, delay: 1, options: [.curveEaseInOut], animations: {
                
                self.openAmiView.layer.position.y -= self.showImageHeight
                //self.openAmiView.layer.opacity = 0
                
                
            }, completion: {
                (finished:Bool) -> Void in
                UIView.animate(withDuration: 1, animations:{
                ()-> Void in
                    //完成动画时，数字块复原
                    self.openAmiView.removeFromSuperview()
//                    let getImage = UIImage(named: (self.lingfu?.image)!)
//                    self.lingfuImage3.image = self.cropToBounds(image: getImage!, width: Double(self.showImageWidth), height: Double(self.showImageHeight))
                })
            })
            
                
            
            
        } else if (gesture.state == UIGestureRecognizerState.ended) {
            //openAmiView.removeFromSuperview()
            
        }
    }
    
    
    // MARK: - 背景音乐按钮旋转动画
    func rotateMusicButton() {
        // 创建动画
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        // 设置动画属性
        anim.toValue = 2 * M_PI
        anim.repeatCount = MAXFLOAT
        anim.duration = 10
        anim.isRemovedOnCompletion = false
        // 将动画添加到图层上
        ss.layer.add(anim, forKey: nil)
    }
    func stopRotateMusicButton() {
        ss.layer.removeAllAnimations()
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    // MARK: - 判断长宽比，修改图片尺寸
    func cropToBounds(image: UIImage, width: Double, height: Double) -> UIImage {
        
        var contextImage: UIImage = UIImage(cgImage: image.cgImage!)
        var contextSize: CGSize = contextImage.size
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = CGFloat(width)
        var cgheight: CGFloat = CGFloat(height)
        
        // See what size is longer and create the center off of that
        if contextSize.width > contextSize.height {
            
            let scaleSize = cgheight / contextSize.height
            let reSize = CGSize(width: contextSize.width * scaleSize, height: cgheight)
            UIGraphicsBeginImageContextWithOptions(reSize,false,contextImage.scale);
            contextImage.draw(in: CGRect(x: 0, y: 0, width: (reSize.width), height: reSize.height));
            contextImage = UIGraphicsGetImageFromCurrentImageContext()!;
            UIGraphicsEndImageContext();
            
            posX = ((reSize.width - cgwidth) / 2)
            posY = 0
            
        } else {
            
            let scaleSize = cgwidth / contextSize.width
            let reSize = CGSize(width: cgwidth, height: contextSize.height * scaleSize)
            UIGraphicsBeginImageContextWithOptions(reSize,false,contextImage.scale);
            contextImage.draw(in: CGRect(x: 0, y: 0, width: (reSize.width), height: reSize.height));
            contextImage = UIGraphicsGetImageFromCurrentImageContext()!;
            UIGraphicsEndImageContext();
            
            posX = 0
            posY = ((reSize.height - cgheight) / 2)
        }
        
        let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
        print(rect)
        // Create bitmap image from context using the rect
        let imageRef: CGImage = contextImage.cgImage!.cropping(to: rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        
        return image
    }
    
    
    
    
    
    
    
    @IBAction func saveLingfuImage(_ sender: UIBarButtonItem) {
        let customImage = UIImage(named: (lingfu?.image)!)
        UIImageWriteToSavedPhotosAlbum(customImage!, self, #selector(savedOK(image:didFinishSavingWithError:contextInfo:)), nil)

        //UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        
        
    }
//    func savedOK(
//        image:UIImage!,
//        didFinishSavingWithError error:NSError!,
//        contextInfo:UnsafeRawPointer)
//    {
//        print("Wrote photo ok")
//    }
//    func image(image: UIImage, didFinishSavingWithError error: NSError!, contextInfo:UnsafePointer<Void>)       {
//    
//        if case let error == error {
//            UIAlertView(title: "错误", message: err.localizedDescription, delegate: nil, cancelButtonTitle: "确定").show()
//        } else {
//            UIAlertView(title: "提示", message: "保存成功", delegate: nil, cancelButtonTitle: "确定").show()
//        }
//    }
    
    
    // 提示：参数 空格 参数别名: 类型
    func savedOK(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: AnyObject) {
        
        var alertController = UIAlertController(title: "保存成功!",
                                                message: nil, preferredStyle: .alert)
        
        // if didFinishSavingWithError != nil {
        if error != nil {
            alertController = UIAlertController(title: "保存失败!",
                                                    message: nil, preferredStyle: .alert)
        }
        //显示提示框
        self.present(alertController, animated: true, completion: nil)
        //1秒钟后自动消失
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.presentedViewController?.dismiss(animated: false, completion: nil)
        }
        
        
        
//        
//        let alertController = UIAlertController(title: "通知", message: "确定还是取消", preferredStyle: .alert) // 这里因为控件都不存在改变的可能，所以一律使用let类型.UIAlertControllerStyle可以选择.actionSheet或.alert
//        
//        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
//        let okAction = UIAlertAction(title: "确定", style: .default, handler:{
//            (UIAlertAction) -> Void in
//            print("点击确定事件")
//        })
//        alertView.addAction(cancelAction)
//        alertView.addAction(okAction)// 当添加的UIAlertAction超过两个的时候，会自动变成纵向分布
//        self.present(alertView, animated: true, completion: nil)
//        
//        
        
        
        
    }
    
    
    

}



