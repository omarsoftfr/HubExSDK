import SwiftUI
import Foundation



var semaphore = DispatchSemaphore (value: 0)

struct Shipping: Identifiable, Codable {
    var id: Int
    var address: String?
    var name: String?
    var phone: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case address
        case name
        case phone
    }
}


struct File: Identifiable, Codable {
    var id: Int
    var hash: String
    var caption: String
    var provider: String
    var previewUrl: String
    var mime: String
    //    var formats: Format?
    var width: Int64
    var height: Int64
    var url: String
    var created_at: String
    var size: Double
    var updated_at: String
    var ext: String
    var provider_metadata: String
    var name: String
    var alternativeText: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case hash
        case caption
        case provider
        case previewUrl
        case mime
        //        case formats
        case width
        case height
        case url
        case created_at
        case size
        case updated_at
        case ext
        case provider_metadata
        case name
        case alternativeText
    }
}



struct User: Identifiable, Codable {
    var id: Int
    var jwt: String
    var firstname: String
    var lastname: String
    var username: String
    var address: String?
    var description: String?
    var shipping:Shipping?
    var email:String
    var avatar:File?
    var blocked:Bool
    var confirmed:Bool
    var created_at:String
    var provider:String
    var updated_at:String
    var validCGU:String //date
    var walletId:String
    var visible:Bool
    var location:Location?
    var role:Role
    var orders:[Order]
    var deliveryInProgress:DeliveryInProgress?
    var stores:[Store]
    //    var metadata:[String: Any]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case jwt
        case firstname
        case lastname
        case username
        case address
        case description
        case shipping
        case email
        case avatar
        case blocked
        case confirmed
        case created_at
        case provider
        case updated_at
        case validCGU
        case walletId
        case visible
        case location
        case role
        case orders
        case deliveryInProgress
        case stores
        //        case metadata
    }
}





public struct HubEx {
    
    let strapi = Strapi(scheme: .https, host: "cryptic-peak-06997.herokuapp.com")
    @State private var inputImage: UIImage?
    
    func login(_ identifiant: String, _ motdepasse : String, _ com: @escaping(User) -> Void) {
        strapi.login(
            identifier: identifiant,
            password: motdepasse) { response in
            let data = response.dictionaryValue()
            guard (data?["user"]) != nil else {
                return
            }
            guard let jwt = data?["jwt"]  as? String else {
                return
            }

            traitementUser(data, com: { user in
                var u = user
                u.jwt = jwt
                print(u)
                com(u)
            })

        }
    }
    
    func setInt(value: Any,key: String, _ equal:String, com: @escaping(Int64) -> Void ){
        if key == equal{
            if let v = value as? Int64 {
                com(v)
            }
        }
    }
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    func getFormatFile(fromDictionary dictionary: [String:Any],com:@escaping(Format) -> Void) {
        if let formatsData = dictionary["formats"] as? [String:Any]{
            com(Format(fromDictionary: formatsData))
        }
    }
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    func getDeliveryInProgress(fromDictionary dictionary: [String:Any], com:@escaping(DeliveryInProgress) -> Void){
        if let deliveryInProgressData = dictionary["delivery_in_progress"] as? [String:Any]{
            com(DeliveryInProgress(fromDictionary: deliveryInProgressData))
        }
    }
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    func getStores(fromDictionary dictionary: [String:Any],com:@escaping([Store]) -> Void ){
        var stores = [Store]()
        if let storesArray = dictionary["stores"] as? [[String:Any]]{
            for dic in storesArray{
                let value = Store(fromDictionary: dic)
                stores.append(value)
            }
        }
        com(stores)
    }
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    func getLocation(fromDictionary dictionary: [String:Any], com:@escaping(Location) -> Void){
        if let locationData = dictionary["location"] as? [String:Any]{
            com(Location(fromDictionary: locationData))
        }
    }
    func getOrders(fromDictionary dictionary: [String:Any], com:@escaping([Order]) -> Void){
        var orders = [Order]()
        if let ordersArray = dictionary["orders"] as? [[String:Any]]{
            for dic in ordersArray{
                let value = Order(fromDictionary: dic)
                orders.append(value)
            }
        }
        com(orders)
    }
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    func getRole(fromDictionary dictionary: [String:Any], com:@escaping(Role) -> Void){
        if let roleData = dictionary["role"] as? [String:Any]{
            com(Role(fromDictionary: roleData))
        }
    }
    
    
    func setBool(value: Any,key: String, _ equal:String, com: @escaping(Bool) -> Void ){
        if key == equal{
            if let v = value as? Bool {
                com(v)
            }
        }
    }
    
    func setDouble(value: Any,key: String, _ equal:String, com: @escaping(Double) -> Void){
        if key == equal{
            if let v = value as? Double {
                com(v)
            }
        }
    }
    func setValue(value: Any,key: String, _ equal:String, com: @escaping(String) -> Void){
        if key == equal{
            if let v = value as? String {
                com(v)
            }
        }
    }
    
    
    func traitementUser(_ data: [String: Any]?,com: @escaping(User) -> Void){
        if data?.count ?? 0 > 0 {
            guard (data?["user"]) != nil else {
                return
            }
            
            for (_, value) in (data ?? [:]) as [String:Any] {
                if let _ = value as? String {
                    //                        print(r) - > JWT
                }else{
                    var firstname = String()
                    var lastname = String()
                    var adress = String()
                    var description:String? = nil
                    var username = String()
                    var shipping = Shipping(id: 0)
                    var email = String()
                    var avatar:File? = nil
                    var blocked:Bool = false
                    var confirmed:Bool = false
                    var created_at = String()
                    var provider = String()
                    var updated_at = String()
                    var validCGU = String()
                    var walletId = String()
                    var visible:Bool = false
                    var location:Location? = nil
                    var id = Int()
                    var role:Role? = nil
                    var orders:[Order]? = nil
                    var metadata:[String : Any]? = nil
                    var stores:[Store]? = nil
                    var deliveryInProgress:DeliveryInProgress? = nil
                    if let re = value as? NSDictionary {
                        getDeliveryInProgress(fromDictionary: re as! [String : Any]) { delivery in
                            deliveryInProgress = delivery
                        }
                        getStores(fromDictionary: re as! [String : Any]) { stors in
                            stores = stors
                        }
                        
                        getLocation(fromDictionary: re as! [String : Any]) { loca in
                            location = loca
                        }
                        getRole(fromDictionary: re as! [String : Any]) { rol in
                            role = rol
                        }
                        getOrders(fromDictionary: re as! [String : Any]) { ord in
                            orders = ord
                        }
                        for (key, value) in re{
                            setValue(value: value, key: key as! String, "firstname") { v in
                                firstname = v
                            }
                            setValue(value: value, key:  key as! String, "validCGU") { v in
                                validCGU = v
                            }
                            setValue(value: value, key: key as! String, "walletId") { v in
                                walletId = v
                            }
                            
                            setValue(value: value, key: key as! String, "updated_at") { v in
                                updated_at = v
                            }
                            setBool(value: value, key: key as! String, "blocked") { v in
                                blocked = v
                            }
                            
                            setValue(value: value, key: key as! String, "email") { v in
                                email = v
                            }
                            
                            setValue(value: value, key: key as! String, "lastname") { v in
                                lastname = v
                            }
                            
                            setValue(value: value, key: key as! String, "username") { v in
                                username = v
                            }
                            
                            setValue(value: value, key: key as! String, "address") { v in
                                adress = v
                            }
                            setValue(value: value, key: key as! String, "provider") { v in
                                provider = v
                            }
                            
                            setValue(value: value, key: key as! String, "description") { v in
                                description = v
                            }
                            
                            setBool(value: value, key: key as! String, "confirmed") { v in
                                confirmed = v
                            }
                            setValue(value: value, key: key as! String, "created_at") {  v in
                                created_at = v
                            }
                            setBool(value: value, key: key as! String, "visible") { v in
                                visible = v
                            }
                            
                            
                            if key as! String == "avatar"{
                                if let re = value as? NSDictionary {
                                    
                                    var hash = String()
                                    var caption = String()
                                    var provider = String()
                                    var previewUrl = String()
                                    var mime = String()
                                    //                                        var formats = Format()
                                    var width:Int64 = 0
                                    var height:Int64 = 0
                                    var url = String()
                                    var created_at = String()
                                    var size = Double()
                                    var updated_at = String()
                                    var ext = String()
                                    var provider_metadata = String()
                                    var name = String()
                                    var alternativeText = String()
                                    var format:Format? = nil
                                    
                                    getFormatFile(fromDictionary: re as! [String : Any]){ form in
                                        format = form
                                    }
                                    for (key, value) in re{
                                        print("\(key) --- \(value)")
                                        
                                        setValue(value: value, key: key as! String, "provider_metadata") { v in
                                            provider_metadata = v
                                        }
                                        setValue(value: value, key: key as! String, "alternativeText") { v in
                                            alternativeText = v
                                        }
                                        setValue(value: value, key: key as! String, "hash") { v in
                                            hash = v
                                        }
                                        setValue(value: value, key: key as! String, "caption") { v in
                                            caption = v
                                        }
                                        setValue(value: value, key: key as! String, "provider") { v in
                                            provider = v
                                        }
                                        setValue(value: value, key: key as! String, "mime") { v in
                                            mime = v
                                        }
                                        setValue(value: value, key: key as! String, "previewUrl") { v in
                                            previewUrl = v
                                        }
                                        setValue(value: value, key: key as! String, "updated_at") { v in
                                            updated_at = v
                                        }
                                        setValue(value: value, key: key as! String, "updated_at") { v in
                                            updated_at = v
                                        }
                                        
                                        setValue(value: value, key: key as! String, "url") { v in
                                            url = v
                                        }
                                        setValue(value: value, key: key as! String, "created_at") { v in
                                            created_at = v
                                        }
                                        setValue(value: value, key: key as! String, "updated_at") { v in
                                            created_at = v
                                        }
                                        setValue(value: value, key: key as! String, "ext") { v in
                                            ext = v
                                        }
                                        setValue(value: value, key: key as! String, "name") { v in
                                            name = v
                                        }
                                        setDouble(value: value, key: key as! String, "size") { v in
                                            size = v
                                        }
                                        setInt(value: value, key: key as! String, "height") { v in
                                            height = v
                                        }
                                        setInt(value: value, key: key as! String, "width"){ v in
                                            width = v
                                        }
                                    }
                                    avatar = File(id: re["id"] as! Int, hash: hash, caption: caption, provider: provider, previewUrl: previewUrl, mime: mime/*,formats: format*/,  width: width, height: height, url: url, created_at: created_at, size: size, updated_at: updated_at, ext: ext, provider_metadata: provider_metadata, name: name, alternativeText: alternativeText)
                                    //                                        print(avatar)
                                }
                                
                            }
                            
                            if key as! String == "id"{
                                id = value as! Int
                            }
                            if key as! String == "description"{
                                if let v = value as? String {
                                    description = v
                                }
                            }
                            if key as! String == "shipping" {
                                if let _ = value as? String {
                                    //                        print(r) - > JWT
                                }else{
                                    if let shippingValue = value as? [String:Any] {
                                        //                                                print("ici")
                                        shipping.id = shippingValue["id"] as! Int
                                        if let ad =
                                            shippingValue["adress"] as? String {
                                            shipping.address = ad
                                        }
                                        
                                        if let name =
                                            shippingValue["name"] as? String {
                                            shipping.name = name
                                        }
                                        if let phone =
                                            shippingValue["phone"] as? String {
                                            shipping.phone = phone
                                        }
                                    }
                                    
                                }
                            }
                            
                        }
                        //                        print()
                        let u = User(id: id, jwt: "", firstname: firstname, lastname: lastname, username: username, address: adress, description: description, shipping: shipping, email: email, avatar: avatar,blocked: blocked, confirmed: confirmed, created_at: created_at, provider: provider, updated_at: updated_at, validCGU: validCGU, walletId: walletId, visible: visible, location: location,role: role!, orders: orders!, deliveryInProgress: deliveryInProgress, stores: stores!/*, metadata:metadata!*/)
                        com(u)
                        
                    }
                }
            }
            
            
        }
    }
    func getUser(){
        strapi.me { response in
            if let error = response.strapiError()?.messages {
                print(error)
                return
            }
            traitementUser(["user" : response.dictionaryValue()], com: { user in
                print(user)
            })
        }
    }
    
    func sendFile(data: UIImage){
        let interceptor = StrapiAuthorizationInterceptor(storage: strapi.storage)
        let boundary = "Boundary-\(UUID().uuidString)"
        
        if let datas = data.jpegData(compressionQuality: 0.1) {
                    strapi.upload(contentType: "multipart/form-data; boundary=\(boundary)", id: 12, field: "", filename: "image", mimeType: "image/jpg", fileData: datas, interceptor: interceptor) { response in
//
//                            if let error = response.strapiError()?.messages {
//                                print(error)
//                                return
//                            }
//
                        let data = response.dictionaryValue()
                        
                        if response.statusCode == 200 {
                            print("Some data: \(response.statusCode)")
                        }
//                                    guard let record = response.dictionaryValue() else {
//                                        return
//                                    }
                        
                        print("Some data: \(data)")
                    }
                }
        
        
        
    }
    
    func setKeysAndValues (object : AnyObject, dictionary : NSDictionary)  -> AnyObject  {
        for (key, value) in dictionary {
            if let key = key  as? String, let value = value as? String {
                if (object.responds(to: NSSelectorFromString(key))) {
                    object.setValue(value, forKey: key)
                }
            }
        }
        return object
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        sendFile(data: inputImage)
        //        if let data = inputImage.jpegData(compressionQuality: 1) {
        //            sendFile(data: data)
        //        }
        
    }
    
    func imageDataProperties(_ imageData: Data) -> NSDictionary? {
        if let imageSource = CGImageSourceCreateWithData(imageData as CFData, nil)
        {
            if let dictionary = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) {
                return dictionary
            }
        }
        return nil
    }
    
}

struct HubExLoginUI:View {
    @State var id:String = ""
    @State var mdp:String = ""
    var com:(User) -> () = { _ in }
    
//    let hubEx = HubEx()
    
    
    public var body: some View {
        VStack{
            Form{
                TextField("Identifiant: ", text: $id)
                TextField("Mot de passe: ", text: $mdp)
                Button {
//                    login(id,mdp)
                    HubEx().login(id, mdp) { user in
                        print("HubEx login \(user)")
                        com(user)
                    }
                } label: {
                    Text("Connexion")
                        .opacity(id == "" || mdp == "" ? 0.3: 1)
                }.disabled(id == "" || mdp == "")

            }
        }
    }
}
