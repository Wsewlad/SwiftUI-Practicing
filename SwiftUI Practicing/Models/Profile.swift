/*
See LICENSE folder for this sample’s licensing information.

Abstract:
An object that models a user profile.
*/
import SwiftUI

struct Profile: Hashable, Codable, Identifiable  {
    var id: Int
    var firstName: String
    var lastName: String
    var avatarImageName: String
    var coverImageName: String
    var currentPosition: String
    var currentWorkplace: String
    var education: String
    var showAboveEducationInMyIntro: Bool
    var country: String
    var about: String?
    var experience: [ExperienceItem]
    
    struct ExperienceItem: Hashable, Codable, Identifiable {
        var id: Int
        var companyName: String
        var companyLogoName: String
        var city: String
        var position: String
        var duration: String
        var description: String
    }
    
    
}

extension Profile.ExperienceItem {
    var companyLogo: Image {
        ImageStore.shared.image(name: companyLogoName)
    }
}

extension Profile {
    var fullname: String {
        "\(firstName) \(lastName)"
    }
    var avatarImage: Image {
        ImageStore.shared.image(name: avatarImageName)
    }
    var coverImage: Image {
        ImageStore.shared.image(name: coverImageName)
    }
    var headline: String {
        "\(currentPosition) at \(currentWorkplace)"
    }
}

enum ActivityIndicator: String {
    case online = "Online"
    case offline = "Offline"
    
    mutating func toggle() {
        switch self {
        case .offline:
            self = .online
        default:
            self = .offline
        }
    }
}
