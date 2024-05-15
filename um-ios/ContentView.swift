import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: RestaurantsViewModel
    let style:Styles
    
    @State var showSplashScreen : Bool = true
    
    var body: some View {
        
        ZStack{
            if(showSplashScreen){
                SplashScreenView()
                    .transition(.opacity)
            }
            else{
                NavigationStack{
                    VStack {
                        headerView
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ViewFilter(iconName: "icon-badge", iconLabel: "Top Rated", isOn: $viewModel.topRatedToggle, style: Styles())
                                    .onChange(of: viewModel.topRatedToggle) {
                                        viewModel.toggleTopRated()
                                    }
                                
                                ViewFilter(iconName: "icon-coffee", iconLabel: "Take Out", isOn: $viewModel.takeOutToggle, style: Styles())
                                    .onChange(of: viewModel.takeOutToggle) {
                                        viewModel.toggleTakeOut()
                                    }
                                
                                ViewFilter(iconName: "icon-clock", iconLabel: "Fast Delivery", isOn: $viewModel.fastDeliveryToggle, style: Styles())
                                    .onChange(of: viewModel.fastDeliveryToggle) {
                                        viewModel.toggleFastDelivery()
                                    }
                            }
                            .padding(.horizontal, 30)
                            .padding(.bottom, 10)
                            .padding(.top, 0)
                        }
                    
                        ScrollView{
                            ForEach(viewModel.displayedRestaurants){restaurant in
                                NavigationLink(destination: ViewRestaurantDetails(restaurant: restaurant)) {
                                    ViewRestaurantCard(restaurant: restaurant, style: Styles())
                                        .padding(.horizontal)
                                        .padding(.bottom, 12)
                                }
                            }
                            .padding(.top, 16)
                        }
                        .offset(y: -12.0)
                        
                    }
                    .background(style.backgroundColor)
                    .ignoresSafeArea()
                }
                .transition(.opacity)
            }
        }
        .animation(.easeOut(duration: 0.5), value: showSplashScreen)
        .onAppear {
            viewModel.loadRestaurants()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2)
            {
                withAnimation{
                    self.showSplashScreen = false
                }
            }
        }
        
        if let error = viewModel.error {
            Text("Error: \(error.localizedDescription)")
                .foregroundColor(.red)
        }
        
    }
}

private var headerView: some View {
    HStack {
        Image("logo-umain")
            .resizable()
            .scaledToFit()
            .frame(width: 56)
        Spacer()
    }
    .padding(.horizontal)
    .padding(.bottom, 16)
    .padding(.top, 60)
}

//#Preview {
//    ContentView()
//}
