//
//  KRDrawLineView.swift
//  KRDrawLineView
//
//  Created by RK on 2018/1/7.
//  Copyright © 2018年 RK. All rights reserved.
//

import UIKit

enum KRDrawLineViewStyle {
    case KRDrawLineViewStyleSolidLine//实线
    case KRDrawLineViewStyleDashLine//点线
};

class KRDrawLineView: UIView {
    
    let SINGLE_LINE_WIDTH  = (1 / UIScreen.main.scale)
    let SINGLE_LINE_ADJUST_OFFSET = ((1/UIScreen.main.scale)/2)
    
    var lineStyle:KRDrawLineViewStyle = KRDrawLineViewStyle.KRDrawLineViewStyleSolidLine
    var lineWidth:CGFloat?
    var lineColor:UIColor?
    var paddingStart:CGFloat = 0.0
    var paddingEnd:CGFloat = 0.0
    var isBottomLine:Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpUI()
    }

    func setUpUI(){
        backgroundColor = UIColor.clear
        lineStyle = KRDrawLineViewStyle.KRDrawLineViewStyleSolidLine
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        if (lineColor == nil) {
            lineColor = UIColor.lightGray
        }
        
        context?.setStrokeColor(lineColor!.cgColor)
        context?.setShouldAntialias(false)
        
        if (lineStyle == KRDrawLineViewStyle.KRDrawLineViewStyleDashLine) {
            let dasg:[CGFloat] = [1.0, 1.0];
            context?.setLineDash(phase: 0, lengths:dasg)
        }
        
        var width = lineWidth;
        var adjustPixelOffset:CGFloat = 0;
        //画一像素线
        if (width! < CGFloat(1.1)) {
            width = SINGLE_LINE_WIDTH
            if (Int(((width!) * UIScreen.main.scale + CGFloat(1))) % 2 == 0) {
                adjustPixelOffset = SINGLE_LINE_ADJUST_OFFSET
            }
        }
        
        context?.setLineWidth(width!)
        
        let VIEW_HEIGHT = self.bounds.size.height
        let VIEW_WIDTH = self.bounds.size.width;
        
        var startPoint:CGPoint?
        var endPoint:CGPoint?
        
        if (VIEW_HEIGHT > VIEW_WIDTH) {
            startPoint = CGPoint.init(x: VIEW_WIDTH / 2 -  adjustPixelOffset, y: paddingStart)
            endPoint = CGPoint.init(x: VIEW_WIDTH / 2 - adjustPixelOffset, y: VIEW_HEIGHT - paddingEnd)
        } else {
            if (isBottomLine) {
                startPoint = CGPoint.init(x: paddingStart, y: VIEW_HEIGHT - adjustPixelOffset)
                endPoint = CGPoint.init(x: VIEW_WIDTH - paddingEnd, y: VIEW_HEIGHT - adjustPixelOffset)
            } else {
                startPoint = CGPoint.init(x: paddingStart, y: VIEW_HEIGHT / 2 - adjustPixelOffset)
                endPoint = CGPoint.init(x:VIEW_WIDTH - paddingEnd, y:VIEW_HEIGHT / 2 - adjustPixelOffset);
            }
        }
        
        context?.move(to: startPoint!)
        context?.addLine(to: endPoint!)
        context?.strokePath()
    }
}
