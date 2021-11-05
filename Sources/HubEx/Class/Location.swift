//
//  Location.swift
//  HubEx
//
//  Created by Sébastien Filaumart on 29/08/2021.
//

import Foundation


class Location : NSObject, NSCoding, Identifiable, Codable{

    var adress : String!
    var createdAt : String!
    var id : Int!
    var latitude : Int!
    var longitude : Int!
    var metadata : String!
    var publishedAt : String!
    var updatedAt : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        adress = dictionary["adress"] as? String
        createdAt = dictionary["created_at"] as? String
        id = dictionary["id"] as? Int
        latitude = dictionary["latitude"] as? Int
        longitude = dictionary["longitude"] as? Int
        metadata = dictionary["metadata"] as? String
        publishedAt = dictionary["published_at"] as? String
        updatedAt = dictionary["updated_at"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if adress != nil{
            dictionary["adress"] = adress
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if latitude != nil{
            dictionary["latitude"] = latitude
        }
        if longitude != nil{
            dictionary["longitude"] = longitude
        }
        if metadata != nil{
            dictionary["metadata"] = metadata
        }
        if publishedAt != nil{
            dictionary["published_at"] = publishedAt
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        adress = aDecoder.decodeObject(forKey: "adress") as? String
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        latitude = aDecoder.decodeObject(forKey: "latitude") as? Int
        longitude = aDecoder.decodeObject(forKey: "longitude") as? Int
        metadata = aDecoder.decodeObject(forKey: "metadata") as? String
        publishedAt = aDecoder.decodeObject(forKey: "published_at") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if adress != nil{
            aCoder.encode(adress, forKey: "adress")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if latitude != nil{
            aCoder.encode(latitude, forKey: "latitude")
        }
        if longitude != nil{
            aCoder.encode(longitude, forKey: "longitude")
        }
        if metadata != nil{
            aCoder.encode(metadata, forKey: "metadata")
        }
        if publishedAt != nil{
            aCoder.encode(publishedAt, forKey: "published_at")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
    }
}
