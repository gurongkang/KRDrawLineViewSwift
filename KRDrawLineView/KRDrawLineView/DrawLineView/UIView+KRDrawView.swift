//
//  KRLineView.swift
//  KRDrawLineView
//
//  Created by RK on 2018/1/22.
//  Copyright © 2018年 RK. All rights reserved.
//

import UIKit

extension UIView {
    
    /// 添加顶部线条
    ///
    /// - Parameters:
    ///   - view: 视图
    ///   - offsetLeft: 左边距
    ///   - offsetRight: 右边距
    ///   - color: 颜色
    class public func kr_addTopLineToView(view:UIView, offsetLeft:CGFloat, offsetRight:CGFloat, color:UIColor) -> Void{
        self.addTopLineToView(view: view, offsetLeft: offsetLeft, offsetRight: offsetRight, color: color)
    }
    
    
    /// 添加底部线条
    ///
    /// - Parameters:
    ///   - view: 视图
    ///   - offsetLeft: 左边距
    ///   - offsetRight: 右边距
    ///   - color:  颜色
    class public func kr_addBottomLineToView(view:UIView, offsetLeft:CGFloat, offsetRight:CGFloat, color:UIColor) -> Void {
        self.addBottomLineToView(view: view, offsetLeft: offsetLeft, offsetRight: offsetRight, color: color)
    }
    
    /// 添加顶部线条
    ///
    /// - Parameter view: 视图
    ///   - color:  颜色
    class public func kr_addTopLineToView(view:UIView, color:UIColor) -> Void {
        self.addTopLineToView(view: view, offsetLeft:0.0, offsetRight: 0.0, color: color)
    }
    
    /// 添加底部底部线条
    ///
    /// - Parameters:
    ///   - view: 视图
    ///   - color: 颜色
    class public func kr_addBottomLineToView(view:UIView, color:UIColor) -> Void {
        self.addBottomLineToView(view: view, offsetLeft:0.0, offsetRight: 0.0, color: color)
    }
    
    
    /// 添加右边线条
    ///
    /// - Parameters:
    ///   - view: 视图
    ///   - color: 颜色
    class public func kr_addRightLineToView(view:UIView, color:UIColor) -> Void {
        self.addRightLineToView(view: view, offsetTop: 0.0, offsetBottom: 0.0, color: color)
    }
    
    /// 添加右边线条
    ///
    /// - Parameters:
    ///   - view: 视图
    ///   - offsetTop: 上边距
    ///   - offsetBottom: 下边距
    ///   - color: 颜色
   class public func kr_addRightLineToView(view:UIView, offsetTop:CGFloat, offsetBottom:CGFloat, color:UIColor) -> Void {
        self.addRightLineToView(view: view, offsetTop: offsetTop, offsetBottom: offsetBottom, color: color)
    }
    
    /// 添加顶部线条
    ///
    /// - Parameters:
    ///   - view: 视图
    ///   - offsetLeft: 左边距
    ///   - offsetRight: 右边距
    ///   - color: 颜色
   class func addTopLineToView(view:UIView, offsetLeft:CGFloat, offsetRight:CGFloat, color:UIColor) -> Void {
        self.delTopLine(view: view)
        let v:KRDrawLineView = KRDrawLineView.init(frame:CGRect.init(x: 0, y: 0, width: view.frame.size.width, height: 1.0))
        v.lineWidth = 1.0
        v.lineColor = color
        v.tag = 54321
        v.paddingStart = offsetLeft
        v.paddingEnd = offsetRight
        v.autoresizingMask =  UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) |  UInt8(UIViewAutoresizing.flexibleBottomMargin.rawValue)))
        view.addSubview(v)
    }
    
    /// 添加底部线条
    ///
    /// - Parameters:
    ///   - view: 视图
    ///   - offsetLeft: 左边距
    ///   - offsetRight: 右边距
    ///   - color:  颜色
   class func addBottomLineToView(view:UIView, offsetLeft:CGFloat, offsetRight:CGFloat, color:UIColor) -> Void {
        self.delBottomLine(view: view)
        let v:KRDrawLineView = KRDrawLineView.init(frame:CGRect.init(x: 0, y: view.frame.size.height - 1.0, width: view.frame.size.width, height: 1.0))
        v.lineWidth = 1.0
        v.lineColor = color
        v.tag = 12345
        v.paddingStart = offsetLeft
        v.paddingEnd = offsetRight
        v.autoresizingMask =  UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) |  UInt8(UIViewAutoresizing.flexibleBottomMargin.rawValue)))
        view.addSubview(v)
    }
    
    /// 添加右边线条
    ///
    /// - Parameters:
    ///   - view: 视图
    ///   - offsetLeft: 左边距
    ///   - offsetRight: 右边距
    ///   - color:  颜色
    class func addRightLineToView(view:UIView, offsetTop:CGFloat, offsetBottom:CGFloat, color:UIColor) -> Void {
        self.delBottomLine(view: view)
        let v:KRDrawLineView = KRDrawLineView.init(frame:CGRect.init(x: view.frame.size.width-1.0, y:offsetTop, width: 1.0, height: view.frame.size.height-offsetTop-offsetBottom))
        v.lineWidth = 1.0
        v.lineColor = color
        v.tag = 15457
        v.paddingStart = offsetTop
        v.paddingEnd = offsetBottom
        v.autoresizingMask =  UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) |  UInt8(UIViewAutoresizing.flexibleBottomMargin.rawValue)))
        view.addSubview(v)
    }
    
    /// 删除顶部线条
    ///
    /// - Parameter view: view
    class func delTopLine(view:UIView) -> Void {
        let v = view.viewWithTag(54321);
        
        if ((v?.isKind(of: KRDrawLineView.self))==true && 54321 == view.tag) {
            view.removeFromSuperview()
        }
    }
    
    
    /// 删除底部线条
    ///
    /// - Parameter view: view
    class func delBottomLine(view:UIView) -> Void {
        let v = view.viewWithTag(12345);
        
        if ((v?.isKind(of: KRDrawLineView.self))==true && 12345 == view.tag) {
            view.removeFromSuperview()
        }
    }
    
    
    /// 删除右边线条
    ///
    /// - Parameter view: view
    class func delRightLine(view:UIView) -> Void {
        let v = view.viewWithTag(15457);
        
        if ((v?.isKind(of: KRDrawLineView.self))==true && 15457 == view.tag) {
            view.removeFromSuperview()
        }
    }
}
