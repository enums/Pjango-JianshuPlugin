//
//  JSArticle.swift
//  Blog
//
//  Created by 郑宇琦 on 2017/2/5.
//  Copyright © 2017年 郑宇琦. All rights reserved.
//

import Foundation
import SwiftyJSON

open class JSArticleNote {
    
    open var slug: String
    open var likes_count: Int
    open var id: Int
    open var views_count: Int
    open var commentable: Bool
    open var user_id: Int
    open var public_wordage: Int
    open var comments_count: Int
    open var notebook_id: Int
    
    public init(json: JSON) {
        slug = json["slug"].string ?? "null"
        likes_count = json["likes_count"].int ?? 0
        id = json["id"].int ?? 0
        views_count = json["views_count"].int ?? 0
        commentable = json["commentable"].bool ?? false
        user_id = json["user_id"].int ?? 0
        public_wordage = json["public_wordage"].int ?? 0
        comments_count = json["comments_count"].int ?? 0
        notebook_id = json["notebook_id"].int ?? 0
    }
}

open class JSArticleNoteShow {
    
    open var is_author: Bool
    open var is_following_author: Bool
    open var is_liked_note: Bool
    open var uuid: String
    
    public init(json: JSON) {
        is_author = json["is_author"].bool ?? false
        is_following_author = json["is_following_author"].bool ?? false
        is_liked_note = json["is_liked_note"].bool ?? false
        uuid = json["uuid"].string ?? "null"
    }
}

open class JSArticle {
    
    open var note: JSArticleNote
    open var os: String
    open var read_font: String
    open var note_show: JSArticleNoteShow
    open var user_signed_in: Bool
    open var read_mode: String
    open var locale: String
    
    public init(json: JSON) {
        note = JSArticleNote.init(json: json["note"])
        os = json["os"].string ?? "null"
        read_font = json["read_font"].string ?? "null"
        note_show = JSArticleNoteShow.init(json: json["note_show"])
        user_signed_in = json["user_signed_in"].bool ?? false
        read_mode = json["read_mode"].string ?? "null"
        locale = json["locale"].string ?? "null"
    }
}

