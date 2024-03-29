//
//  ViewController.swift
//  ivory
//
//  Created by Varun on 07/10/19.
//  Copyright © 2019 Varun. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController
{
    @IBOutlet var childview : UIView!
    @IBOutlet var webview : WKWebView!
    @IBOutlet var errorview : UIView!
    var viewsize:CGSize?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        AppManager.shared.updatechildview(view: self.view, childview: childview)
        errorview.frame = CGRect(x: 0, y: 0, width: childview.frame.size.width, height: childview.frame.size.height)
        AppManager.shared.parentController = self
        webview.load(URLRequest(url: URL.init(string: "http://ivorytech.net/wms_clone/schApp")!))
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .black
        refreshControl.addTarget(self, action: #selector(refreshWebView(_:)), for: .valueChanged);
        webview.scrollView.addSubview(refreshControl)
        webview.scrollView.bounces = true
    }
    @objc func refreshWebView(_ sender: UIRefreshControl)
    {
        loadweb()
        sender.endRefreshing()
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
    super.viewWillTransition(to: size, with: coordinator)
    viewsize = size;
    AppManager.shared.updatechildframe(size: viewsize!, childview: childview , parentview: self.view)
    errorview.frame = CGRect(x: 0, y: 0, width: childview.frame.size.width, height: childview.frame.size.height)
    }
    override func viewSafeAreaInsetsDidChange()
    {
        super.viewSafeAreaInsetsDidChange()
        if (viewsize != nil)
        {
            AppManager.shared.updatechildframe(size: viewsize!, childview: childview , parentview: self.view)
            errorview.frame = CGRect(x: 0, y: 0, width: childview.frame.size.width, height: childview.frame.size.height)
        }
    }
    func detectconnection(reach : Reachability)
    {
        if reach.connection == .unavailable
        {
            childview.addSubview(errorview)
        }
        else
        {
            loadweb()
            errorview.removeFromSuperview()
        }
    }
    func loadweb()
      {
              if webview.url == nil
               {
                webview.load(URLRequest(url: URL.init(string: "http://ivorytech.net/wms_clone/schApp")!))
               }
               else
               {
                   webview.reload();
               }
      }
    
}

