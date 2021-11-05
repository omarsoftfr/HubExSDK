//
//  Store.swift
//  HubEx
//
//  Created by Sébastien Filaumart on 29/08/2021.
//

import Foundation


class Store : NSObject, NSCoding, Identifiable, Codable{

    var categories : [String]!
    var cover : String!
    var createdBy : String!
    var descriptionField : String!
    var email : String!
    var id : String!
    var locale : String!
    var localizations : [String]!
    var logo : String!
    var name : String!
    var phone : String!
    var products : [String]!
    var publishedAt : String!
    var updatedBy : String!
    var useInvoices : Bool!
    var user : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        cover = dictionary["cover"] as? String
        createdBy = dictionary["created_by"] as? String
        descriptionField = dictionary["description"] as? String
        email = dictionary["email"] as? String
        id = dictionary["id"] as? String
        locale = dictionary["locale"] as? String
        logo = dictionary["logo"] as? String
        name = dictionary["name"] as? String
        phone = dictionary["phone"] as? String
        publishedAt = dictionary["published_at"] as? String
        updatedBy = dictionary["updated_by"] as? String
        useInvoices = dictionary["useInvoices"] as? Bool
        user = dictionary["user"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if cover != nil{
            dictionary["cover"] = cover
        }
        if createdBy != nil{
            dictionary["created_by"] = createdBy
        }
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if email != nil{
            dictionary["email"] = email
        }
        if id != nil{
            dictionary["id"] = id
        }
        if locale != nil{
            dictionary["locale"] = locale
        }
        if logo != nil{
            dictionary["logo"] = logo
        }
        if name != nil{
            dictionary["name"] = name
        }
        if phone != nil{
            dictionary["phone"] = phone
        }
        if publishedAt != nil{
            dictionary["published_at"] = publishedAt
        }
        if updatedBy != nil{
            dictionary["updated_by"] = updatedBy
        }
        if useInvoices != nil{
            dictionary["useInvoices"] = useInvoices
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
        categories = aDecoder.decodeObject(forKey: "categories") as? [String]
        cover = aDecoder.decodeObject(forKey: "cover") as? String
        createdBy = aDecoder.decodeObject(forKey: "created_by") as? String
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        email = aDecoder.decodeObject(forKey: "email") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        locale = aDecoder.decodeObject(forKey: "locale") as? String
        localizations = aDecoder.decodeObject(forKey: "localizations") as? [String]
        logo = aDecoder.decodeObject(forKey: "logo") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        phone = aDecoder.decodeObject(forKey: "phone") as? String
        products = aDecoder.decodeObject(forKey: "products") as? [String]
        publishedAt = aDecoder.decodeObject(forKey: "published_at") as? String
        updatedBy = aDecoder.decodeObject(forKey: "updated_by") as? String
        useInvoices = aDecoder.decodeObject(forKey: "useInvoices") as? Bool
        user = aDecoder.decodeObject(forKey: "user") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if categories != nil{
            aCoder.encode(categories, forKey: "categories")
        }
        if cover != nil{
            aCoder.encode(cover, forKey: "cover")
        }
        if createdBy != nil{
            aCoder.encode(createdBy, forKey: "created_by")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if locale != nil{
            aCoder.encode(locale, forKey: "locale")
        }
        if localizations != nil{
            aCoder.encode(localizations, forKey: "localizations")
        }
        if logo != nil{
            aCoder.encode(logo, forKey: "logo")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if phone != nil{
            aCoder.encode(phone, forKey: "phone")
        }
        if products != nil{
            aCoder.encode(products, forKey: "products")
        }
        if publishedAt != nil{
            aCoder.encode(publishedAt, forKey: "published_at")
        }
        if updatedBy != nil{
            aCoder.encode(updatedBy, forKey: "updated_by")
        }
        if useInvoices != nil{
            aCoder.encode(useInvoices, forKey: "useInvoices")
        }
        if user != nil{
            aCoder.encode(user, forKey: "user")
        }
    }
}
