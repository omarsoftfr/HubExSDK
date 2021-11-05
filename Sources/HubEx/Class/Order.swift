//
//  Order.swift
//  HubEx
//
//  Created by Sébastien Filaumart on 29/08/2021.
//

import Foundation


public class Order : NSObject, NSCoding, Identifiable, Codable{

    public var adress : String!
    public var amount : Int!
    public var cancel : Bool!
    public var createdBy : String!
    public var delivery : Bool!
    public var dishes : String!
    public var id : String!
    public var publishedAt : String!
    public var returnField : String!
    public var updatedBy : String!
    public var user : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        adress = dictionary["adress"] as? String
        amount = dictionary["amount"] as? Int
        cancel = dictionary["cancel"] as? Bool
        createdBy = dictionary["created_by"] as? String
        delivery = dictionary["delivery"] as? Bool
        dishes = dictionary["dishes"] as? String
        id = dictionary["id"] as? String
        publishedAt = dictionary["published_at"] as? String
        returnField = dictionary["return"] as? String
        updatedBy = dictionary["updated_by"] as? String
        user = dictionary["user"] as? String
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
        if amount != nil{
            dictionary["amount"] = amount
        }
        if cancel != nil{
            dictionary["cancel"] = cancel
        }
        if createdBy != nil{
            dictionary["created_by"] = createdBy
        }
        if delivery != nil{
            dictionary["delivery"] = delivery
        }
        if dishes != nil{
            dictionary["dishes"] = dishes
        }
        if id != nil{
            dictionary["id"] = id
        }
        if publishedAt != nil{
            dictionary["published_at"] = publishedAt
        }
        if returnField != nil{
            dictionary["return"] = returnField
        }
        if updatedBy != nil{
            dictionary["updated_by"] = updatedBy
        }
        if user != nil{
            dictionary["user"] = user
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
        amount = aDecoder.decodeObject(forKey: "amount") as? Int
        cancel = aDecoder.decodeObject(forKey: "cancel") as? Bool
        createdBy = aDecoder.decodeObject(forKey: "created_by") as? String
        delivery = aDecoder.decodeObject(forKey: "delivery") as? Bool
        dishes = aDecoder.decodeObject(forKey: "dishes") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        publishedAt = aDecoder.decodeObject(forKey: "published_at") as? String
        returnField = aDecoder.decodeObject(forKey: "return") as? String
        updatedBy = aDecoder.decodeObject(forKey: "updated_by") as? String
        user = aDecoder.decodeObject(forKey: "user") as? String
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
        if amount != nil{
            aCoder.encode(amount, forKey: "amount")
        }
        if cancel != nil{
            aCoder.encode(cancel, forKey: "cancel")
        }
        if createdBy != nil{
            aCoder.encode(createdBy, forKey: "created_by")
        }
        if delivery != nil{
            aCoder.encode(delivery, forKey: "delivery")
        }
        if dishes != nil{
            aCoder.encode(dishes, forKey: "dishes")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if publishedAt != nil{
            aCoder.encode(publishedAt, forKey: "published_at")
        }
        if returnField != nil{
            aCoder.encode(returnField, forKey: "return")
        }
        if updatedBy != nil{
            aCoder.encode(updatedBy, forKey: "updated_by")
        }
        if user != nil{
            aCoder.encode(user, forKey: "user")
        }
    }
}
