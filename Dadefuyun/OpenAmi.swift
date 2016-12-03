//
//  OpenAmi.swift
//
//  Code generated using QuartzCode 1.52.0 on 2016/12/3.
//  www.quartzcodeapp.com
//

import UIKit


class OpenAmi: UIView, CAAnimationDelegate {
	
	var layers : Dictionary<String, AnyObject> = [:]
	var completionBlocks : Dictionary<CAAnimation, (Bool) -> Void> = [:]
	var updateLayerValueForCompletedAnimation : Bool = true
	
	var textColor : UIColor!
	
	//MARK: - Life Cycle
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupProperties()
		setupLayers()
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
		setupProperties()
		setupLayers()
	}
	
	override var frame: CGRect{
		didSet{
			setupLayerFrames()
		}
	}
	
	override var bounds: CGRect{
		didSet{
			setupLayerFrames()
		}
	}
	
	func setupProperties(){
		self.textColor = UIColor.orange
	}
	
	func setupLayers(){
		let effect = CALayer()
		self.layer.addSublayer(effect)
		layers["effect"] = effect
		let text3 = CAShapeLayer()
		effect.addSublayer(text3)
		text3.fillColor   = UIColor.white.cgColor
		text3.strokeColor = self.textColor.cgColor
		text3.strokeEnd   = 0
		layers["text3"] = text3
		let text4 = CAShapeLayer()
		effect.addSublayer(text4)
		text4.fillColor   = UIColor.white.cgColor
		text4.strokeColor = self.textColor.cgColor
		text4.strokeEnd   = 0
		layers["text4"] = text4
		let text5 = CAShapeLayer()
		effect.addSublayer(text5)
		text5.fillColor   = UIColor.white.cgColor
		text5.strokeColor = self.textColor.cgColor
		text5.strokeEnd   = 0
		layers["text5"] = text5
		let text6 = CAShapeLayer()
		effect.addSublayer(text6)
		text6.fillColor   = UIColor.white.cgColor
		text6.strokeColor = self.textColor.cgColor
		text6.strokeEnd   = 0
		layers["text6"] = text6
		setupLayerFrames()
	}
	
	func setupLayerFrames(){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if let effect : CALayer = layers["effect"] as? CALayer{
			effect.frame = CGRect(x: 0.4495 * effect.superlayer!.bounds.width, y: 0.21922 * effect.superlayer!.bounds.height, width: 0.10418 * effect.superlayer!.bounds.width, height: 0.33476 * effect.superlayer!.bounds.height)
		}
		
		if let text3 : CAShapeLayer = layers["text3"] as? CAShapeLayer{
			text3.frame = CGRect(x: 0.05292 * text3.superlayer!.bounds.width, y: 0, width: 0.88877 * text3.superlayer!.bounds.width, height: 0.19693 * text3.superlayer!.bounds.height)
			text3.path  = text3Path(bounds: (layers["text3"] as! CAShapeLayer).bounds).cgPath
		}
		
		if let text4 : CAShapeLayer = layers["text4"] as? CAShapeLayer{
			text4.frame = CGRect(x: 0, y: 0.26082 * text4.superlayer!.bounds.height, width:  text4.superlayer!.bounds.width, height: 0.2059 * text4.superlayer!.bounds.height)
			text4.path  = text4Path(bounds: (layers["text4"] as! CAShapeLayer).bounds).cgPath
		}
		
		if let text5 : CAShapeLayer = layers["text5"] as? CAShapeLayer{
			text5.frame = CGRect(x: 0.0216 * text5.superlayer!.bounds.width, y: 0.53395 * text5.superlayer!.bounds.height, width: 0.95464 * text5.superlayer!.bounds.width, height: 0.19469 * text5.superlayer!.bounds.height)
			text5.path  = text5Path(bounds: (layers["text5"] as! CAShapeLayer).bounds).cgPath
		}
		
		if let text6 : CAShapeLayer = layers["text6"] as? CAShapeLayer{
			text6.frame = CGRect(x: 0.0054 * text6.superlayer!.bounds.width, y: 0.79366 * text6.superlayer!.bounds.height, width: 0.97192 * text6.superlayer!.bounds.width, height: 0.20634 * text6.superlayer!.bounds.height)
			text6.path  = text6Path(bounds: (layers["text6"] as! CAShapeLayer).bounds).cgPath
		}
		
		CATransaction.commit()
	}
	
	//MARK: - Animation Setup
	
	func addOldAnimation(reverseAnimation: Bool = false, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = 2.897
			completionAnim.delegate = self
			completionAnim.setValue("old", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"old")
			if let anim = layer.animation(forKey: "old"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
		
		let totalDuration : CFTimeInterval = 2.897
		
		////Effect animation
		let effectStrokeEndAnim            = CABasicAnimation(keyPath:"strokeEnd")
		effectStrokeEndAnim.fromValue      = 0;
		effectStrokeEndAnim.toValue        = 1;
		effectStrokeEndAnim.duration       = 1.08
		effectStrokeEndAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		effectStrokeEndAnim.setValue(0.1, forKeyPath:"instanceDelay")
		effectStrokeEndAnim.setValue(0, forKeyPath:"instanceOrder")
		
		let effectFillColorAnim       = CABasicAnimation(keyPath:"fillColor")
		effectFillColorAnim.fromValue = UIColor.white.cgColor;
		effectFillColorAnim.toValue   = UIColor.orange.cgColor;
		effectFillColorAnim.duration  = 1.51
		effectFillColorAnim.beginTime = 1.08
		effectFillColorAnim.setValue(0.1, forKeyPath:"instanceDelay")
		effectFillColorAnim.setValue(2, forKeyPath:"instanceOrder")
		
		var effectOldAnim : CAAnimationGroup = QCMethod.group(animations: [effectStrokeEndAnim, effectFillColorAnim], fillMode:kCAFillModeBoth, forEffectLayer:true, sublayersCount:4)
		QCMethod.addSublayersAnimationNeedReverse(anim: effectOldAnim, key:"effectOldAnim", layer:layers["effect"] as! CALayer, reverseAnimation:reverseAnimation, totalDuration:totalDuration)
	}
	
	//MARK: - Animation Cleanup
	
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
		if let completionBlock = completionBlocks[anim]{
			completionBlocks.removeValue(forKey: anim)
			if (flag && updateLayerValueForCompletedAnimation) || anim.value(forKey: "needEndAnim") as! Bool{
				updateLayerValues(forAnimationId: anim.value(forKey: "animId") as! String)
				removeAnimations(forAnimationId: anim.value(forKey: "animId") as! String)
			}
			completionBlock(flag)
		}
	}
	
	func updateLayerValues(forAnimationId identifier: String){
		if identifier == "old"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["effect"] as! CALayer).animation(forKey: "effectOldAnim"), theLayer:(layers["effect"] as! CALayer))
		}
	}
	
	func removeAnimations(forAnimationId identifier: String){
		if identifier == "old"{
			(layers["effect"] as! CALayer).removeAnimation(forKey: "effectOldAnim")
		}
	}
	
	func removeAllAnimations(){
		for layer in layers.values{
			(layer as! CALayer).removeAllAnimations()
		}
	}
	
	//MARK: - Bezier Path
	
	func text3Path(bounds: CGRect) -> UIBezierPath{
		let text3Path = UIBezierPath()
		let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
		
		text3Path.move(to: CGPoint(x:minX + 0.16768 * w, y: minY + 0.64391 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.16768 * w, y: minY + 0.71672 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.32321 * w, y: minY + 0.71672 * h))
		text3Path.addCurve(to: CGPoint(x:minX + 0.29405 * w, y: minY + 0.82025 * h), controlPoint1:CGPoint(x:minX + 0.31713 * w, y: minY + 0.7554 * h), controlPoint2:CGPoint(x:minX + 0.30741 * w, y: minY + 0.79067 * h))
		text3Path.addCurve(to: CGPoint(x:minX + 0.16768 * w, y: minY + 0.92947 * h), controlPoint1:CGPoint(x:minX + 0.26974 * w, y: minY + 0.86576 * h), controlPoint2:CGPoint(x:minX + 0.22722 * w, y: minY + 0.90216 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.21142 * w, y: minY + 0.99431 * h))
		text3Path.addCurve(to: CGPoint(x:minX + 0.35844 * w, y: minY + 0.86917 * h), controlPoint1:CGPoint(x:minX + 0.27947 * w, y: minY + 0.96473 * h), controlPoint2:CGPoint(x:minX + 0.32928 * w, y: minY + 0.92264 * h))
		text3Path.addCurve(to: CGPoint(x:minX + 0.40219 * w, y: minY + 0.71672 * h), controlPoint1:CGPoint(x:minX + 0.38032 * w, y: minY + 0.82821 * h), controlPoint2:CGPoint(x:minX + 0.3949 * w, y: minY + 0.77702 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.59174 * w, y: minY + 0.71672 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.59174 * w, y: minY + 0.97838 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.67193 * w, y: minY + 0.97838 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.67193 * w, y: minY + 0.71672 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.82868 * w, y: minY + 0.71672 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.82868 * w, y: minY + 0.64391 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.67193 * w, y: minY + 0.64391 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.67193 * w, y: minY + 0.51308 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.78979 * w, y: minY + 0.51308 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.78979 * w, y: minY + 0.44255 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.20049 * w, y: minY + 0.44255 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.20049 * w, y: minY + 0.51308 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.32928 * w, y: minY + 0.51308 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.32928 * w, y: minY + 0.64391 * h))
		text3Path.close()
		text3Path.move(to: CGPoint(x:minX + 0.59174 * w, y: minY + 0.64391 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.40826 * w, y: minY + 0.64391 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.40826 * w, y: minY + 0.51308 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.59174 * w, y: minY + 0.51308 * h))
		text3Path.close()
		text3Path.move(to: CGPoint(x:minX + 0.08748 * w, y: minY + 0.21047 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.36087 * w, y: minY + 0.21047 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.36087 * w, y: minY + 0.29352 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.08748 * w, y: minY + 0.29352 * h))
		text3Path.close()
		text3Path.move(to: CGPoint(x:minX + 0.36087 * w, y: minY + 0.15245 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.08748 * w, y: minY + 0.15245 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.08748 * w, y: minY + 0.06485 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.36087 * w, y: minY + 0.06485 * h))
		text3Path.close()
		text3Path.move(to: CGPoint(x:minX + 0.63305 * w, y: minY + 0.21047 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.91373 * w, y: minY + 0.21047 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.91373 * w, y: minY + 0.29124 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.63305 * w, y: minY + 0.29124 * h))
		text3Path.close()
		text3Path.move(to: CGPoint(x:minX + 0.91373 * w, y: minY + 0.15245 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.63305 * w, y: minY + 0.15245 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.63305 * w, y: minY + 0.06712 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.91373 * w, y: minY + 0.06712 * h))
		text3Path.close()
		text3Path.move(to: CGPoint(x:minX + 0.44593 * w, y: minY))
		text3Path.addLine(to: CGPoint(x:minX, y: minY))
		text3Path.addLine(to: CGPoint(x:minX, y: minY + h))
		text3Path.addLine(to: CGPoint(x:minX + 0.08748 * w, y: minY + h))
		text3Path.addLine(to: CGPoint(x:minX + 0.08748 * w, y: minY + 0.3595 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.44593 * w, y: minY + 0.3595 * h))
		text3Path.close()
		text3Path.move(to: CGPoint(x:minX + 0.91373 * w, y: minY + 0.35609 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.91373 * w, y: minY + 0.85779 * h))
		text3Path.addCurve(to: CGPoint(x:minX + 0.85905 * w, y: minY + 0.92378 * h), controlPoint1:CGPoint(x:minX + 0.91373 * w, y: minY + 0.90102 * h), controlPoint2:CGPoint(x:minX + 0.8955 * w, y: minY + 0.92378 * h))
		text3Path.addCurve(to: CGPoint(x:minX + 0.73876 * w, y: minY + 0.91923 * h), controlPoint1:CGPoint(x:minX + 0.8226 * w, y: minY + 0.92378 * h), controlPoint2:CGPoint(x:minX + 0.7825 * w, y: minY + 0.9215 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.75942 * w, y: minY + 0.99204 * h))
		text3Path.addCurve(to: CGPoint(x:minX + 0.89064 * w, y: minY + 0.99545 * h), controlPoint1:CGPoint(x:minX + 0.80316 * w, y: minY + 0.99431 * h), controlPoint2:CGPoint(x:minX + 0.8469 * w, y: minY + 0.99545 * h))
		text3Path.addCurve(to: CGPoint(x:minX + w, y: minY + 0.88282 * h), controlPoint1:CGPoint(x:minX + 0.96355 * w, y: minY + 0.99545 * h), controlPoint2:CGPoint(x:minX + w, y: minY + 0.95791 * h))
		text3Path.addLine(to: CGPoint(x:minX + w, y: minY + 0.00114 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.548 * w, y: minY + 0.00114 * h))
		text3Path.addLine(to: CGPoint(x:minX + 0.548 * w, y: minY + 0.35609 * h))
		text3Path.close()
		text3Path.move(to: CGPoint(x:minX + 0.91373 * w, y: minY + 0.35609 * h))
		
		return text3Path
	}
	
	func text4Path(bounds: CGRect) -> UIBezierPath{
		let text4Path = UIBezierPath()
		let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
		
		text4Path.move(to: CGPoint(x:minX + 0.49028 * w, y: minY + 0.5778 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.17387 * w, y: minY + 0.5778 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.17387 * w, y: minY + 0.97715 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.24406 * w, y: minY + 0.97715 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.24406 * w, y: minY + 0.91948 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.49028 * w, y: minY + 0.91948 * h))
		text4Path.close()
		text4Path.move(to: CGPoint(x:minX + 0.24406 * w, y: minY + 0.84984 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.24406 * w, y: minY + 0.64635 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.41793 * w, y: minY + 0.64635 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.41793 * w, y: minY + 0.84984 * h))
		text4Path.close()
		text4Path.move(to: CGPoint(x:minX + 0.41253 * w, y: minY + 0.20457 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.41253 * w, y: minY + 0.37867 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.15659 * w, y: minY + 0.37867 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.15659 * w, y: minY + 0.20457 * h))
		text4Path.close()
		text4Path.move(to: CGPoint(x:minX + 0.15659 * w, y: minY + 0.45049 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.48704 * w, y: minY + 0.45049 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.48704 * w, y: minY + 0.13058 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.32613 * w, y: minY + 0.13058 * h))
		text4Path.addCurve(to: CGPoint(x:minX + 0.2905 * w, y: minY), controlPoint1:CGPoint(x:minX + 0.31533 * w, y: minY + 0.08161 * h), controlPoint2:CGPoint(x:minX + 0.30346 * w, y: minY + 0.03808 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.21058 * w, y: minY + 0.01306 * h))
		text4Path.addCurve(to: CGPoint(x:minX + 0.24838 * w, y: minY + 0.13058 * h), controlPoint1:CGPoint(x:minX + 0.22354 * w, y: minY + 0.04788 * h), controlPoint2:CGPoint(x:minX + 0.2365 * w, y: minY + 0.08705 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.08315 * w, y: minY + 0.13058 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.08315 * w, y: minY + 0.50925 * h))
		text4Path.addCurve(to: CGPoint(x:minX, y: minY + 0.94886 * h), controlPoint1:CGPoint(x:minX + 0.08207 * w, y: minY + 0.68879 * h), controlPoint2:CGPoint(x:minX + 0.054 * w, y: minY + 0.83569 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.05508 * w, y: minY + h))
		text4Path.addCurve(to: CGPoint(x:minX + 0.15659 * w, y: minY + 0.50925 * h), controlPoint1:CGPoint(x:minX + 0.12203 * w, y: minY + 0.86289 * h), controlPoint2:CGPoint(x:minX + 0.15551 * w, y: minY + 0.69859 * h))
		text4Path.close()
		text4Path.move(to: CGPoint(x:minX + 0.83477 * w, y: minY + 0.24048 * h))
		text4Path.addCurve(to: CGPoint(x:minX + 0.74946 * w, y: minY + 0.64309 * h), controlPoint1:CGPoint(x:minX + 0.83045 * w, y: minY + 0.39499 * h), controlPoint2:CGPoint(x:minX + 0.8013 * w, y: minY + 0.52992 * h))
		text4Path.addCurve(to: CGPoint(x:minX + 0.64039 * w, y: minY + 0.32862 * h), controlPoint1:CGPoint(x:minX + 0.7041 * w, y: minY + 0.55386 * h), controlPoint2:CGPoint(x:minX + 0.66739 * w, y: minY + 0.4494 * h))
		text4Path.addCurve(to: CGPoint(x:minX + 0.66415 * w, y: minY + 0.24048 * h), controlPoint1:CGPoint(x:minX + 0.64903 * w, y: minY + 0.30033 * h), controlPoint2:CGPoint(x:minX + 0.65659 * w, y: minY + 0.27095 * h))
		text4Path.close()
		text4Path.move(to: CGPoint(x:minX + 0.68035 * w, y: minY + 0.1654 * h))
		text4Path.addCurve(to: CGPoint(x:minX + 0.70518 * w, y: minY + 0.01415 * h), controlPoint1:CGPoint(x:minX + 0.68898 * w, y: minY + 0.11752 * h), controlPoint2:CGPoint(x:minX + 0.69762 * w, y: minY + 0.06746 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.63283 * w, y: minY + 0.00109 * h))
		text4Path.addCurve(to: CGPoint(x:minX + 0.48812 * w, y: minY + 0.5049 * h), controlPoint1:CGPoint(x:minX + 0.60799 * w, y: minY + 0.21219 * h), controlPoint2:CGPoint(x:minX + 0.5594 * w, y: minY + 0.38085 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.53564 * w, y: minY + 0.56366 * h))
		text4Path.addCurve(to: CGPoint(x:minX + 0.60043 * w, y: minY + 0.43743 * h), controlPoint1:CGPoint(x:minX + 0.5594 * w, y: minY + 0.52666 * h), controlPoint2:CGPoint(x:minX + 0.58099 * w, y: minY + 0.48422 * h))
		text4Path.addCurve(to: CGPoint(x:minX + 0.71058 * w, y: minY + 0.716 * h), controlPoint1:CGPoint(x:minX + 0.63067 * w, y: minY + 0.54189 * h), controlPoint2:CGPoint(x:minX + 0.66739 * w, y: minY + 0.63439 * h))
		text4Path.addCurve(to: CGPoint(x:minX + 0.4946 * w, y: minY + 0.93145 * h), controlPoint1:CGPoint(x:minX + 0.65659 * w, y: minY + 0.80305 * h), controlPoint2:CGPoint(x:minX + 0.58531 * w, y: minY + 0.87486 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.53672 * w, y: minY + 0.99782 * h))
		text4Path.addCurve(to: CGPoint(x:minX + 0.75162 * w, y: minY + 0.78672 * h), controlPoint1:CGPoint(x:minX + 0.62311 * w, y: minY + 0.94015 * h), controlPoint2:CGPoint(x:minX + 0.69546 * w, y: minY + 0.86942 * h))
		text4Path.addCurve(to: CGPoint(x:minX + 0.95572 * w, y: minY + 0.99891 * h), controlPoint1:CGPoint(x:minX + 0.80886 * w, y: minY + 0.87595 * h), controlPoint2:CGPoint(x:minX + 0.87689 * w, y: minY + 0.94668 * h))
		text4Path.addLine(to: CGPoint(x:minX + w, y: minY + 0.93362 * h))
		text4Path.addCurve(to: CGPoint(x:minX + 0.79266 * w, y: minY + 0.71926 * h), controlPoint1:CGPoint(x:minX + 0.91901 * w, y: minY + 0.88357 * h), controlPoint2:CGPoint(x:minX + 0.84989 * w, y: minY + 0.81175 * h))
		text4Path.addCurve(to: CGPoint(x:minX + 0.90605 * w, y: minY + 0.24048 * h), controlPoint1:CGPoint(x:minX + 0.86285 * w, y: minY + 0.58868 * h), controlPoint2:CGPoint(x:minX + 0.90065 * w, y: minY + 0.42873 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.97192 * w, y: minY + 0.24048 * h))
		text4Path.addLine(to: CGPoint(x:minX + 0.97192 * w, y: minY + 0.1654 * h))
		text4Path.close()
		text4Path.move(to: CGPoint(x:minX + 0.68035 * w, y: minY + 0.1654 * h))
		
		return text4Path
	}
	
	func text5Path(bounds: CGRect) -> UIBezierPath{
		let text5Path = UIBezierPath()
		let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
		
		text5Path.move(to: CGPoint(x:minX + 0.05882 * w, y: minY))
		text5Path.addLine(to: CGPoint(x:minX + 0.05882 * w, y: minY + 0.06444 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.46154 * w, y: minY + 0.06444 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.46154 * w, y: minY + 0.12313 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.02149 * w, y: minY + 0.12313 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.02149 * w, y: minY + 0.3153 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.09729 * w, y: minY + 0.3153 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.09729 * w, y: minY + 0.18527 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.46154 * w, y: minY + 0.18527 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.46154 * w, y: minY + 0.39125 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.53846 * w, y: minY + 0.39125 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.53846 * w, y: minY + 0.18527 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.90271 * w, y: minY + 0.18527 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.90271 * w, y: minY + 0.3153 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.97851 * w, y: minY + 0.3153 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.97851 * w, y: minY + 0.12313 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.53846 * w, y: minY + 0.12313 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.53846 * w, y: minY + 0.06444 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.94005 * w, y: minY + 0.06444 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.94005 * w, y: minY))
		text5Path.close()
		text5Path.move(to: CGPoint(x:minX + 0.1595 * w, y: minY + 0.23705 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.1595 * w, y: minY + 0.28539 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.39932 * w, y: minY + 0.28539 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.39932 * w, y: minY + 0.23705 * h))
		text5Path.close()
		text5Path.move(to: CGPoint(x:minX + 0.1595 * w, y: minY + 0.33257 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.1595 * w, y: minY + 0.3809 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.39932 * w, y: minY + 0.3809 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.39932 * w, y: minY + 0.33257 * h))
		text5Path.close()
		text5Path.move(to: CGPoint(x:minX + 0.59955 * w, y: minY + 0.23705 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.59955 * w, y: minY + 0.28539 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.83937 * w, y: minY + 0.28539 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.83937 * w, y: minY + 0.23705 * h))
		text5Path.close()
		text5Path.move(to: CGPoint(x:minX + 0.59955 * w, y: minY + 0.33257 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.59955 * w, y: minY + 0.3809 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.83937 * w, y: minY + 0.3809 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.83937 * w, y: minY + 0.33257 * h))
		text5Path.close()
		text5Path.move(to: CGPoint(x:minX + 0.36991 * w, y: minY + 0.42923 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.36991 * w, y: minY + 0.61335 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.63235 * w, y: minY + 0.61335 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.63235 * w, y: minY + 0.42923 * h))
		text5Path.close()
		text5Path.move(to: CGPoint(x:minX + 0.56787 * w, y: minY + 0.56272 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.43552 * w, y: minY + 0.56272 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.43552 * w, y: minY + 0.47986 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.56787 * w, y: minY + 0.47986 * h))
		text5Path.close()
		text5Path.move(to: CGPoint(x:minX + 0.0509 * w, y: minY + 0.42923 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.0509 * w, y: minY + 0.61335 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.31335 * w, y: minY + 0.61335 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.31335 * w, y: minY + 0.42923 * h))
		text5Path.close()
		text5Path.move(to: CGPoint(x:minX + 0.24887 * w, y: minY + 0.56272 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.11652 * w, y: minY + 0.56272 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.11652 * w, y: minY + 0.47986 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.24887 * w, y: minY + 0.47986 * h))
		text5Path.close()
		text5Path.move(to: CGPoint(x:minX + 0.69005 * w, y: minY + 0.42923 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.69005 * w, y: minY + 0.61335 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.95136 * w, y: minY + 0.61335 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.95136 * w, y: minY + 0.42923 * h))
		text5Path.close()
		text5Path.move(to: CGPoint(x:minX + 0.88575 * w, y: minY + 0.56272 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.75452 * w, y: minY + 0.56272 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.75452 * w, y: minY + 0.47986 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.88575 * w, y: minY + 0.47986 * h))
		text5Path.close()
		text5Path.move(to: CGPoint(x:minX + 0.05317 * w, y: minY + 0.66743 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.05317 * w, y: minY + 0.73188 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.20475 * w, y: minY + 0.73188 * h))
		text5Path.addCurve(to: CGPoint(x:minX + 0.06561 * w, y: minY + 0.87917 * h), controlPoint1:CGPoint(x:minX + 0.18439 * w, y: minY + 0.78481 * h), controlPoint2:CGPoint(x:minX + 0.13801 * w, y: minY + 0.83314 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.11652 * w, y: minY + 0.9252 * h))
		text5Path.addCurve(to: CGPoint(x:minX + 0.22059 * w, y: minY + 0.83314 * h), controlPoint1:CGPoint(x:minX + 0.1595 * w, y: minY + 0.89643 * h), controlPoint2:CGPoint(x:minX + 0.19344 * w, y: minY + 0.86536 * h))
		text5Path.addCurve(to: CGPoint(x:minX + 0.34842 * w, y: minY + 0.91715 * h), controlPoint1:CGPoint(x:minX + 0.25452 * w, y: minY + 0.85155 * h), controlPoint2:CGPoint(x:minX + 0.29638 * w, y: minY + 0.88032 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.38575 * w, y: minY + 0.86191 * h))
		text5Path.addCurve(to: CGPoint(x:minX + 0.25226 * w, y: minY + 0.78481 * h), controlPoint1:CGPoint(x:minX + 0.3405 * w, y: minY + 0.83314 * h), controlPoint2:CGPoint(x:minX + 0.29638 * w, y: minY + 0.80783 * h))
		text5Path.addCurve(to: CGPoint(x:minX + 0.27262 * w, y: minY + 0.73188 * h), controlPoint1:CGPoint(x:minX + 0.26131 * w, y: minY + 0.7687 * h), controlPoint2:CGPoint(x:minX + 0.2681 * w, y: minY + 0.75029 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.4638 * w, y: minY + 0.73188 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.4638 * w, y: minY + 0.93326 * h))
		text5Path.addLine(to: CGPoint(x:minX, y: minY + 0.93326 * h))
		text5Path.addLine(to: CGPoint(x:minX, y: minY + h))
		text5Path.addLine(to: CGPoint(x:minX + w, y: minY + h))
		text5Path.addLine(to: CGPoint(x:minX + w, y: minY + 0.93326 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.53846 * w, y: minY + 0.93326 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.53846 * w, y: minY + 0.73188 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.75113 * w, y: minY + 0.73188 * h))
		text5Path.addCurve(to: CGPoint(x:minX + 0.62217 * w, y: minY + 0.88262 * h), controlPoint1:CGPoint(x:minX + 0.73416 * w, y: minY + 0.78596 * h), controlPoint2:CGPoint(x:minX + 0.69118 * w, y: minY + 0.83659 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.67308 * w, y: minY + 0.9298 * h))
		text5Path.addCurve(to: CGPoint(x:minX + 0.77262 * w, y: minY + 0.83544 * h), controlPoint1:CGPoint(x:minX + 0.7138 * w, y: minY + 0.90104 * h), controlPoint2:CGPoint(x:minX + 0.74774 * w, y: minY + 0.86997 * h))
		text5Path.addCurve(to: CGPoint(x:minX + 0.90611 * w, y: minY + 0.93096 * h), controlPoint1:CGPoint(x:minX + 0.80769 * w, y: minY + 0.85731 * h), controlPoint2:CGPoint(x:minX + 0.85181 * w, y: minY + 0.88953 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.94344 * w, y: minY + 0.87457 * h))
		text5Path.addCurve(to: CGPoint(x:minX + 0.80204 * w, y: minY + 0.78711 * h), controlPoint1:CGPoint(x:minX + 0.89593 * w, y: minY + 0.84235 * h), controlPoint2:CGPoint(x:minX + 0.84842 * w, y: minY + 0.81243 * h))
		text5Path.addCurve(to: CGPoint(x:minX + 0.82014 * w, y: minY + 0.73188 * h), controlPoint1:CGPoint(x:minX + 0.80995 * w, y: minY + 0.76985 * h), controlPoint2:CGPoint(x:minX + 0.81561 * w, y: minY + 0.75144 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.94796 * w, y: minY + 0.73188 * h))
		text5Path.addLine(to: CGPoint(x:minX + 0.94796 * w, y: minY + 0.66743 * h))
		text5Path.close()
		text5Path.move(to: CGPoint(x:minX + 0.05317 * w, y: minY + 0.66743 * h))
		
		return text5Path
	}
	
	func text6Path(bounds: CGRect) -> UIBezierPath{
		let text6Path = UIBezierPath()
		let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
		
		text6Path.move(to: CGPoint(x:minX + 0.17444 * w, y: minY + 0.18567 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.25444 * w, y: minY + 0.18567 * h))
		text6Path.addCurve(to: CGPoint(x:minX + 0.32889 * w, y: minY + 0.31596 * h), controlPoint1:CGPoint(x:minX + 0.28333 * w, y: minY + 0.22693 * h), controlPoint2:CGPoint(x:minX + 0.30778 * w, y: minY + 0.27036 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.40333 * w, y: minY + 0.28882 * h))
		text6Path.addCurve(to: CGPoint(x:minX + 0.34 * w, y: minY + 0.18567 * h), controlPoint1:CGPoint(x:minX + 0.38667 * w, y: minY + 0.25624 * h), controlPoint2:CGPoint(x:minX + 0.36556 * w, y: minY + 0.22258 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.49556 * w, y: minY + 0.18567 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.49556 * w, y: minY + 0.11401 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.21 * w, y: minY + 0.11401 * h))
		text6Path.addCurve(to: CGPoint(x:minX + 0.24778 * w, y: minY + 0.01846 * h), controlPoint1:CGPoint(x:minX + 0.22333 * w, y: minY + 0.0836 * h), controlPoint2:CGPoint(x:minX + 0.23667 * w, y: minY + 0.05212 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.17111 * w, y: minY + 0.00217 * h))
		text6Path.addCurve(to: CGPoint(x:minX, y: minY + 0.29533 * h), controlPoint1:CGPoint(x:minX + 0.13556 * w, y: minY + 0.10858 * h), controlPoint2:CGPoint(x:minX + 0.07778 * w, y: minY + 0.2063 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.06889 * w, y: minY + 0.33768 * h))
		text6Path.addCurve(to: CGPoint(x:minX + 0.17444 * w, y: minY + 0.18567 * h), controlPoint1:CGPoint(x:minX + 0.10889 * w, y: minY + 0.29207 * h), controlPoint2:CGPoint(x:minX + 0.14333 * w, y: minY + 0.24104 * h))
		text6Path.close()
		text6Path.move(to: CGPoint(x:minX + 0.63667 * w, y: minY + 0.18567 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.73556 * w, y: minY + 0.18567 * h))
		text6Path.addCurve(to: CGPoint(x:minX + 0.80889 * w, y: minY + 0.31705 * h), controlPoint1:CGPoint(x:minX + 0.76333 * w, y: minY + 0.22801 * h), controlPoint2:CGPoint(x:minX + 0.78778 * w, y: minY + 0.27144 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.88222 * w, y: minY + 0.2899 * h))
		text6Path.addCurve(to: CGPoint(x:minX + 0.82111 * w, y: minY + 0.18567 * h), controlPoint1:CGPoint(x:minX + 0.86667 * w, y: minY + 0.25733 * h), controlPoint2:CGPoint(x:minX + 0.84556 * w, y: minY + 0.22258 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.99111 * w, y: minY + 0.18567 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.99111 * w, y: minY + 0.11401 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.66667 * w, y: minY + 0.11401 * h))
		text6Path.addCurve(to: CGPoint(x:minX + 0.7 * w, y: minY + 0.01629 * h), controlPoint1:CGPoint(x:minX + 0.67889 * w, y: minY + 0.0836 * h), controlPoint2:CGPoint(x:minX + 0.69 * w, y: minY + 0.05103 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.62222 * w, y: minY))
		text6Path.addCurve(to: CGPoint(x:minX + 0.48111 * w, y: minY + 0.29207 * h), controlPoint1:CGPoint(x:minX + 0.59333 * w, y: minY + 0.10641 * h), controlPoint2:CGPoint(x:minX + 0.54556 * w, y: minY + 0.20413 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.54889 * w, y: minY + 0.33442 * h))
		text6Path.addCurve(to: CGPoint(x:minX + 0.63667 * w, y: minY + 0.18567 * h), controlPoint1:CGPoint(x:minX + 0.58111 * w, y: minY + 0.2899 * h), controlPoint2:CGPoint(x:minX + 0.61 * w, y: minY + 0.23996 * h))
		text6Path.close()
		text6Path.move(to: CGPoint(x:minX + 0.23222 * w, y: minY + 0.30076 * h))
		text6Path.addCurve(to: CGPoint(x:minX + 0.00444 * w, y: minY + 0.62758 * h), controlPoint1:CGPoint(x:minX + 0.18444 * w, y: minY + 0.42345 * h), controlPoint2:CGPoint(x:minX + 0.10889 * w, y: minY + 0.53203 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.02889 * w, y: minY + 0.70901 * h))
		text6Path.addCurve(to: CGPoint(x:minX + 0.15889 * w, y: minY + 0.57438 * h), controlPoint1:CGPoint(x:minX + 0.07667 * w, y: minY + 0.66775 * h), controlPoint2:CGPoint(x:minX + 0.12 * w, y: minY + 0.62215 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.15889 * w, y: minY + h))
		text6Path.addLine(to: CGPoint(x:minX + 0.23778 * w, y: minY + h))
		text6Path.addLine(to: CGPoint(x:minX + 0.23778 * w, y: minY + 0.46145 * h))
		text6Path.addCurve(to: CGPoint(x:minX + 0.3 * w, y: minY + 0.33225 * h), controlPoint1:CGPoint(x:minX + 0.26111 * w, y: minY + 0.4202 * h), controlPoint2:CGPoint(x:minX + 0.28222 * w, y: minY + 0.37785 * h))
		text6Path.close()
		text6Path.move(to: CGPoint(x:minX + 0.32444 * w, y: minY + 0.46254 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.32444 * w, y: minY + 0.53855 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.77889 * w, y: minY + 0.53855 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.77889 * w, y: minY + 0.87405 * h))
		text6Path.addCurve(to: CGPoint(x:minX + 0.72556 * w, y: minY + 0.92725 * h), controlPoint1:CGPoint(x:minX + 0.77889 * w, y: minY + 0.90879 * h), controlPoint2:CGPoint(x:minX + 0.76111 * w, y: minY + 0.92725 * h))
		text6Path.addCurve(to: CGPoint(x:minX + 0.57 * w, y: minY + 0.92182 * h), controlPoint1:CGPoint(x:minX + 0.67667 * w, y: minY + 0.92725 * h), controlPoint2:CGPoint(x:minX + 0.62444 * w, y: minY + 0.92508 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.58778 * w, y: minY + 0.99674 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.75444 * w, y: minY + 0.99674 * h))
		text6Path.addCurve(to: CGPoint(x:minX + 0.85778 * w, y: minY + 0.89359 * h), controlPoint1:CGPoint(x:minX + 0.82333 * w, y: minY + 0.99674 * h), controlPoint2:CGPoint(x:minX + 0.85778 * w, y: minY + 0.962 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.85778 * w, y: minY + 0.53855 * h))
		text6Path.addLine(to: CGPoint(x:minX + w, y: minY + 0.53855 * h))
		text6Path.addLine(to: CGPoint(x:minX + w, y: minY + 0.46254 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.85778 * w, y: minY + 0.46254 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.85778 * w, y: minY + 0.34853 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.77889 * w, y: minY + 0.34853 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.77889 * w, y: minY + 0.46254 * h))
		text6Path.close()
		text6Path.move(to: CGPoint(x:minX + 0.46556 * w, y: minY + 0.60043 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.40333 * w, y: minY + 0.63735 * h))
		text6Path.addCurve(to: CGPoint(x:minX + 0.56778 * w, y: minY + 0.84473 * h), controlPoint1:CGPoint(x:minX + 0.47222 * w, y: minY + 0.71336 * h), controlPoint2:CGPoint(x:minX + 0.52778 * w, y: minY + 0.78176 * h))
		text6Path.addLine(to: CGPoint(x:minX + 0.63 * w, y: minY + 0.80239 * h))
		text6Path.addCurve(to: CGPoint(x:minX + 0.46556 * w, y: minY + 0.60043 * h), controlPoint1:CGPoint(x:minX + 0.59222 * w, y: minY + 0.74484 * h), controlPoint2:CGPoint(x:minX + 0.53667 * w, y: minY + 0.67752 * h))
		text6Path.close()
		text6Path.move(to: CGPoint(x:minX + 0.46556 * w, y: minY + 0.60043 * h))
		
		return text6Path
	}
	
	
}
