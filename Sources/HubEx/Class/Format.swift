//
//  Format.swift
//  HubEx
//
//  Created by Sébastien Filaumart on 29/08/2021.
//

import Foundation


class Format : NSObject, NSCoding{

    var large : Large!
    var medium : Medium!
    var small : Small!
    var thumbnail : Thumbnail!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        if let largeData = dictionary["large"] as? [String:Any]{
            large = Large(fromDictionary: largeData)
        }
        if let mediumData = dictionary["medium"] as? [String:Any]{
            medium = Medium(fromDictionary: mediumData)
        }
        if let smallData = dictionary["small"] as? [String:Any]{
            small = Small(fromDictionary: smallData)
        }
        if let thumbnailData = dictionary["thumbnail"] as? [String:Any]{
            thumbnail = Thumbnail(fromDictionary: thumbnailData)
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if large != nil{
            dictionary["large"] = large.toDictionary()
        }
        if medium != nil{
            dictionary["medium"] = medium.toDictionary()
        }
        if small != nil{
            dictionary["small"] = small.toDictionary()
        }
        if thumbnail != nil{
            dictionary["thumbnail"] = thumbnail.toDictionary()
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        large = aDecoder.decodeObject(forKey: "large") as? Large
        medium = aDecoder.decodeObject(forKey: "medium") as? Medium
        small = aDecoder.decodeObject(forKey: "small") as? Small
        thumbnail = aDecoder.decodeObject(forKey: "thumbnail") as? Thumbnail
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if large != nil{
            aCoder.encode(large, forKey: "large")
        }
        if medium != nil{
            aCoder.encode(medium, forKey: "medium")
        }
        if small != nil{
            aCoder.encode(small, forKey: "small")
        }
        if thumbnail != nil{
            aCoder.encode(thumbnail, forKey: "thumbnail")
        }
    }
}
class Thumbnail : NSObject, NSCoding{

    var ext : String!
    var height : Int!
    var mime : String!
    var name : String!
    var path : AnyObject!
    var size : Float!
    var url : String!
    var width : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        ext = dictionary["ext"] as? String
        height = dictionary["height"] as? Int
        mime = dictionary["mime"] as? String
        name = dictionary["name"] as? String
        path = dictionary["path"] as? AnyObject
        size = dictionary["size"] as? Float
        url = dictionary["url"] as? String
        width = dictionary["width"] as? Int
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if ext != nil{
            dictionary["ext"] = ext
        }
        if height != nil{
            dictionary["height"] = height
        }
        if mime != nil{
            dictionary["mime"] = mime
        }
        if name != nil{
            dictionary["name"] = name
        }
        if path != nil{
            dictionary["path"] = path
        }
        if size != nil{
            dictionary["size"] = size
        }
        if url != nil{
            dictionary["url"] = url
        }
        if width != nil{
            dictionary["width"] = width
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        ext = aDecoder.decodeObject(forKey: "ext") as? String
        height = aDecoder.decodeObject(forKey: "height") as? Int
        mime = aDecoder.decodeObject(forKey: "mime") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        path = aDecoder.decodeObject(forKey: "path") as? AnyObject
        size = aDecoder.decodeObject(forKey: "size") as? Float
        url = aDecoder.decodeObject(forKey: "url") as? String
        width = aDecoder.decodeObject(forKey: "width") as? Int
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if ext != nil{
            aCoder.encode(ext, forKey: "ext")
        }
        if height != nil{
            aCoder.encode(height, forKey: "height")
        }
        if mime != nil{
            aCoder.encode(mime, forKey: "mime")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if path != nil{
            aCoder.encode(path, forKey: "path")
        }
        if size != nil{
            aCoder.encode(size, forKey: "size")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
        if width != nil{
            aCoder.encode(width, forKey: "width")
        }
    }
}

class Small : NSObject, NSCoding{

    var ext : String!
//    var hash : String!
    var height : Int!
    var mime : String!
    var name : String!
    var path : AnyObject!
    var size : Float!
    var url : String!
    var width : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        ext = dictionary["ext"] as? String
        height = dictionary["height"] as? Int
        mime = dictionary["mime"] as? String
        name = dictionary["name"] as? String
        path = dictionary["path"] as? AnyObject
        size = dictionary["size"] as? Float
        url = dictionary["url"] as? String
        width = dictionary["width"] as? Int
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if ext != nil{
            dictionary["ext"] = ext
        }
        if hash != nil{
            dictionary["hash"] = hash
        }
        if height != nil{
            dictionary["height"] = height
        }
        if mime != nil{
            dictionary["mime"] = mime
        }
        if name != nil{
            dictionary["name"] = name
        }
        if path != nil{
            dictionary["path"] = path
        }
        if size != nil{
            dictionary["size"] = size
        }
        if url != nil{
            dictionary["url"] = url
        }
        if width != nil{
            dictionary["width"] = width
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        ext = aDecoder.decodeObject(forKey: "ext") as? String
        height = aDecoder.decodeObject(forKey: "height") as? Int
        mime = aDecoder.decodeObject(forKey: "mime") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        path = aDecoder.decodeObject(forKey: "path") as? AnyObject
        size = aDecoder.decodeObject(forKey: "size") as? Float
        url = aDecoder.decodeObject(forKey: "url") as? String
        width = aDecoder.decodeObject(forKey: "width") as? Int
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if ext != nil{
            aCoder.encode(ext, forKey: "ext")
        }
        if hash != nil{
            aCoder.encode(hash, forKey: "hash")
        }
        if height != nil{
            aCoder.encode(height, forKey: "height")
        }
        if mime != nil{
            aCoder.encode(mime, forKey: "mime")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if path != nil{
            aCoder.encode(path, forKey: "path")
        }
        if size != nil{
            aCoder.encode(size, forKey: "size")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
        if width != nil{
            aCoder.encode(width, forKey: "width")
        }
    }
}

class Medium : NSObject, NSCoding{

    var ext : String!
//    var hash : String!
    var height : Int!
    var mime : String!
    var name : String!
    var path : AnyObject!
    var size : Float!
    var url : String!
    var width : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        ext = dictionary["ext"] as? String
        height = dictionary["height"] as? Int
        mime = dictionary["mime"] as? String
        name = dictionary["name"] as? String
        path = dictionary["path"] as? AnyObject
        size = dictionary["size"] as? Float
        url = dictionary["url"] as? String
        width = dictionary["width"] as? Int
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if ext != nil{
            dictionary["ext"] = ext
        }
        if height != nil{
            dictionary["height"] = height
        }
        if mime != nil{
            dictionary["mime"] = mime
        }
        if name != nil{
            dictionary["name"] = name
        }
        if path != nil{
            dictionary["path"] = path
        }
        if size != nil{
            dictionary["size"] = size
        }
        if url != nil{
            dictionary["url"] = url
        }
        if width != nil{
            dictionary["width"] = width
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        ext = aDecoder.decodeObject(forKey: "ext") as? String
        height = aDecoder.decodeObject(forKey: "height") as? Int
        mime = aDecoder.decodeObject(forKey: "mime") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        path = aDecoder.decodeObject(forKey: "path") as? AnyObject
        size = aDecoder.decodeObject(forKey: "size") as? Float
        url = aDecoder.decodeObject(forKey: "url") as? String
        width = aDecoder.decodeObject(forKey: "width") as? Int
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if ext != nil{
            aCoder.encode(ext, forKey: "ext")
        }
        if height != nil{
            aCoder.encode(height, forKey: "height")
        }
        if mime != nil{
            aCoder.encode(mime, forKey: "mime")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if path != nil{
            aCoder.encode(path, forKey: "path")
        }
        if size != nil{
            aCoder.encode(size, forKey: "size")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
        if width != nil{
            aCoder.encode(width, forKey: "width")
        }
    }
}
class Large : NSObject, NSCoding{

    var ext : String!
//    var hash : String!
    var height : Int!
    var mime : String!
    var name : String!
    var path : AnyObject!
    var size : Float!
    var url : String!
    var width : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        ext = dictionary["ext"] as? String
        height = dictionary["height"] as? Int
        mime = dictionary["mime"] as? String
        name = dictionary["name"] as? String
        path = dictionary["path"] as? AnyObject
        size = dictionary["size"] as? Float
        url = dictionary["url"] as? String
        width = dictionary["width"] as? Int
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if ext != nil{
            dictionary["ext"] = ext
        }
        if hash != nil{
            dictionary["hash"] = hash
        }
        if height != nil{
            dictionary["height"] = height
        }
        if mime != nil{
            dictionary["mime"] = mime
        }
        if name != nil{
            dictionary["name"] = name
        }
        if path != nil{
            dictionary["path"] = path
        }
        if size != nil{
            dictionary["size"] = size
        }
        if url != nil{
            dictionary["url"] = url
        }
        if width != nil{
            dictionary["width"] = width
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        ext = aDecoder.decodeObject(forKey: "ext") as? String
        height = aDecoder.decodeObject(forKey: "height") as? Int
        mime = aDecoder.decodeObject(forKey: "mime") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        path = aDecoder.decodeObject(forKey: "path") as? AnyObject
        size = aDecoder.decodeObject(forKey: "size") as? Float
        url = aDecoder.decodeObject(forKey: "url") as? String
        width = aDecoder.decodeObject(forKey: "width") as? Int
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if ext != nil{
            aCoder.encode(ext, forKey: "ext")
        }
        if hash != nil{
            aCoder.encode(hash, forKey: "hash")
        }
        if height != nil{
            aCoder.encode(height, forKey: "height")
        }
        if mime != nil{
            aCoder.encode(mime, forKey: "mime")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if path != nil{
            aCoder.encode(path, forKey: "path")
        }
        if size != nil{
            aCoder.encode(size, forKey: "size")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
        if width != nil{
            aCoder.encode(width, forKey: "width")
        }
    }
}
