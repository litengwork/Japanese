//
//  JpABAB.swift
//  Japanese
//
//  Created by ri on 2020/03/03.
//  Copyright © 2020 Lee. All rights reserved.
//

import RealmSwift

@objcMembers
public class JpABAB: Object {
    dynamic var id = ""
    dynamic var adverb = ""
    dynamic var meaning = ""
    dynamic var exSentences = ""
    dynamic var exMeaning = ""

    override public static func primaryKey() -> String {
        return "id"
    }
}

@objcMembers
public class JpSection: Object {
    dynamic var id = ""
    dynamic var section = ""
    var rowvalues = List<JpRowValue>()

    override public static func primaryKey() -> String {
        return "id"
    }
}

@objcMembers
public class JpRowValue: Object {
    dynamic var id = ""
    dynamic var value1 = ""
    dynamic var value2 = ""
    dynamic var value3 = ""
    dynamic var value4 = ""

    override public static func primaryKey() -> String {
        return "id"
    }
}

