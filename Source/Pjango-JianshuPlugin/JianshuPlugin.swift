//
//  JianshuPlugin.swift
//  Pjango-JianshuPlugin
//
//  Created by 郑宇琦 on 2017/6/24.
//  Copyright © 2017年 郑宇琦. All rights reserved.
//

import Foundation
import PerfectCURL
import SwiftyJSON
import Pjango

open class JianshuPlugin: PCTimerPlugin {
    
    override open var timerInterval: TimeInterval {
        return 300
    }
    
    
    override open var task: PCTask? {
        return {
            self.reloadJianshu()
        }
    }
    
    fileprivate func reloadJianshu() {
        let url = CURL.init(url: "http://www.jianshu.com/p/457922e0676c")
        let (_, _, bytes) = url.performFully()
        guard let html = String.init(bytes: bytes, encoding: .utf8) else {
            return
        }
        guard let article = buildJianshuArticle(html: html) else {
            return
        }
        print(article)
    }

    fileprivate func buildJianshuArticle(html: String) -> JSArticle? {
        guard let jsonBegin = html.range(of: "<script type=\"application/json\" data-name=\"page-data\">")?.upperBound else {
            return nil
        }
        guard let jsonEnd = html.range(of: "}}</script>")?.lowerBound else {
            return nil
        }
        let jsonRange = jsonBegin..<html.index(jsonEnd, offsetBy: 2)
        let subString = html.substring(with: jsonRange)
        let json = JSON.parse(subString)
        return JSArticle.init(json: json)
    }

}
