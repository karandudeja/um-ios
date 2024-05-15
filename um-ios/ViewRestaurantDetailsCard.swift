import SwiftUI

struct ViewRestaurantDetailsCard: View {
    
    let restaurant: Restaurant
    let style:Styles
    
    @EnvironmentObject var viewModel: RestaurantsViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            HStack{
                Text(restaurant.name)
                    .font(.system(size: style.headline1size))
                Spacer()
            }
            
            if !restaurant.filters.isEmpty {
                HStack{
                    ForEach(Array(restaurant.filters.enumerated()), id: \.element.id) { index, filter in
                        Text(filter.name + (index == restaurant.filters.count - 1 ? "" : " •"))
                            .font(.system(size: style.subtitle1size))
                            .foregroundStyle(style.subtitleTextColor)
                    }
                }
            }
            
            HStack{
                Text("\(viewModel.isOpenDict[restaurant.id, default: false] ? "Open" : "Closed")")
                    .foregroundColor(viewModel.isOpenDict[restaurant.id, default: false] ? style.positiveColor : style.negativeColor)
                Spacer()
            }
        }
        .frame(width: 343, height: 144)
        .padding(.vertical,0)
        .padding(.horizontal,16)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.1), radius: 8, x: 0, y: 1)
        .onAppear {
            Task {
                do {
                    let status = try await viewModel.fetchOpenCloseStatus(restaurantId: restaurant.id)
                    viewModel.isOpenDict[restaurant.id] = status
                } catch {
                    print("Error fetching open/close status: \(error)")
                }
            }
        }
    }
}

/*
 #Preview {
 ViewRestaurantDetailsCard(restaurant:restaurant1)
 }
 */

