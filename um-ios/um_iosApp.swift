import SwiftUI

@main
struct um_iosApp: App {
    @StateObject private var viewModel = RestaurantsViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView(style:Styles())
                .environmentObject(viewModel)
        }
    }
}
