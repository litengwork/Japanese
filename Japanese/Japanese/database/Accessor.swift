//
//  ABABAccessor.swift
//  Japanese
//
//  Created by ri on 2020/03/03.
//  Copyright © 2020 Lee. All rights reserved.
//

import UIKit

class ABABAccessor: BaseRealmAccessor {
    func insert(arr: [[String]]) -> Bool {
        let realm = getRealm()
        do {
            for values in arr {
                try realm.write {
                    let abab = JpABAB()
                    abab.id = createPrimaryKey()
                    abab.adverb = values[0]
                    abab.meaning = values[1]
                    abab.exSentences = values[2]
                    abab.exMeaning = values[3]
                    realm.add(abab, update: .all)
                }
            }
        } catch {
            return false
        }

        return true
    }

}

class JpSectionAccessor: BaseRealmAccessor {
    func insert(arr: [[String]]) -> Bool {
        let realm = getRealm()
        do {
            for values in arr {
                try realm.write {
                    
//                    let abab = JpSection()
//                    abab.id = createPrimaryKey()
//                    abab.section = value
//                    realm.add(abab, update: .all)
                }
            }
        } catch {
            return false
        }

        return true
    }

}

