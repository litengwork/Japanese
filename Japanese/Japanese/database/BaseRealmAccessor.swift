//
//  BaseRealmAccessor.swift
//  Japanese
//
//  Created by ri on 2020/03/03.
//  Copyright © 2020 Lee. All rights reserved.
//

import RealmSwift

public class BaseRealmAccessor: NSObject {
    private var mRealm: Realm?

    public func createPrimaryKey() -> String {
        return  NSUUID().uuidString
    }

    public override init() {
        mRealm = BaseRealmAccessor.getRealm()
    }

    public func getRealm() -> Realm {
        return mRealm!
    }
}

extension BaseRealmAccessor {
    fileprivate static func getRealm() -> Realm {
        let db_Path = self.getDbDir()
        var configuration = Realm.Configuration(shouldCompactOnLaunch: { totalBytes, usedBytes in
            let hundredMB = 100 * 1024 * 1024
            return (totalBytes > hundredMB) && (Double(usedBytes) / Double(totalBytes))  < 0.5
        })
        let greenPath = db_Path + "jp.realm"
        configuration.fileURL = URL(string: greenPath)
        configuration.schemaVersion = 1
        Realm.Configuration.defaultConfiguration = configuration
        let realm = try! Realm()

        return realm
    }

    fileprivate static func getDbDir() -> String {
        let libraryPath = NSHomeDirectory() + "/Library/"
        let path = libraryPath + "Realm/"
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: path) {
            return path
        }
        do {
            try fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

        } catch{
            print(error.localizedDescription)
            return libraryPath
        }
        return path
    }
}
