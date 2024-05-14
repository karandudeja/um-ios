import Foundation

struct Wrapper: Codable {
    let restaurants: [Restaurant]
}

struct Restaurant: Codable, Identifiable {
    let id: String
    let imageUrl: String
    let deliveryTime: Int
    let name: String
    let rating: Double
    let filterIds: [String]
    
    var filters: [RestaurantFilter] = []
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "image_url"
        case deliveryTime = "delivery_time_minutes"
        case name
        case rating
        case filterIds
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        imageUrl = try container.decode(String.self, forKey: .imageUrl)
        deliveryTime = try container.decode(Int.self, forKey: .deliveryTime)
        name = try container.decode(String.self, forKey: .name)
        rating = try container.decode(Double.self, forKey: .rating)
        filterIds = try container.decode([String].self, forKey: .filterIds)
    }
}


struct RestaurantOpenCloseStatus: Codable, Identifiable {
    let id: String
    let isOpen: Bool
    
    enum CodingKeys2: String, CodingKey {
        case id = "restaurant_id"
        case isOpen = "is_currently_open"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys2.self)
        id = try container.decode(String.self, forKey: .id)
        isOpen = try container.decode(Bool.self, forKey: .isOpen)
    }
}

struct RestaurantFilter: Codable, Identifiable {
    let id: String
    let name: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageUrl = "image_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        imageUrl = try container.decode(String.self, forKey: .imageUrl)
        
    }
}




/*
struct Restaurant{
    let restaurantId: String
    let restaurantName: String
    let restaurantRating: Double
    let restaurantFilterIds: [String]
    let restaurantImage: String
    let restaurantDeliveryTime: Int
}
 
 let restaurant1 = Restaurant(restaurantId: "one", restaurantName: "Wayne's Smelly Eggs", restaurantRating: 3.6, restaurantFilterIds: ["Take-Out"], restaurantImage: "food-eggs", restaurantDeliveryTime: 30)
 
 let restaurant2 = Restaurant(restaurantId: "two", restaurantName: "Emilias Fancy Food", restaurantRating: 0.4, restaurantFilterIds: ["Take-Out", "Fast Delivery", "Eat-In"], restaurantImage: "food-burger", restaurantDeliveryTime: 1)
 
 let restaurant3 = Restaurant(restaurantId: "three", restaurantName: "Yumas Fruits", restaurantRating: 5.0, restaurantFilterIds: ["Eat-In", "Top-Rated"], restaurantImage: "food-fruits", restaurantDeliveryTime: 60)
 */

