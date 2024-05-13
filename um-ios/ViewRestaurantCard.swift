import SwiftUI

//cards on the Home Page
struct ViewRestaurantCard: View {
    let restaurant: Restaurant
    let style:Styles
    
    var body: some View {
        VStack{
            ZStack{
                
                AsyncImage(url: URL(string: restaurant.imageUrl)) { image in
                        image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height:200)
                        .clipped()
                    } placeholder: {
                        ProgressView()
                    }
                
                VStack{
                    Spacer()
                    VStack(alignment: .leading, spacing: 2){
                        HStack{
                            Text(restaurant.name)
                                .font(.system(size: style.title1size))
                                .foregroundColor(style.darkTextColor)
                            Spacer()
                            HStack(spacing:0){
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text(" \(String(format: "%.1f", restaurant.rating))")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(red:0.4, green:0.4, blue:0.4, opacity:1))
                            }
                            .font(.system(size: style.footer1size))
                        }
                        HStack {
                            if !restaurant.filters.isEmpty {
                                ForEach(Array(restaurant.filters.enumerated()), id: \.element.id) { index, filter in
                                    Text(filter.name + (index == restaurant.filters.count - 1 ? "" : " •"))
                                        .fontWeight(.bold)
                                        .font(.system(size: style.subtitle1size))
                                        .foregroundStyle(style.subtitleTextColor)
                                }
                            }
                        }

                        HStack(spacing:2){
                            Image(systemName: "clock")
                                .foregroundStyle(style.negativeColor)
                            Text("\(restaurant.deliveryTime) mins")
                                .foregroundStyle(Color(red:0.3, green: 0.3, blue: 0.3, opacity: 1))
                            Spacer()
                        }
                        .padding(.top, 4)
                        .font(.system(size: style.footer1size))
                        .fontWeight(.medium)
                    }.padding(8)
                    .background(Color.white)
                }
            }
        }
        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 16.0, bottomLeadingRadius: 0.0, bottomTrailingRadius: 0.0, topTrailingRadius: 16.0, style: .continuous))
        .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.1), radius: 8, x: 0, y: 1)
    }
        
}

/*
struct ViewRestaurantCard_Previews: PreviewProvider{
    static var previews: some View{
        ViewRestaurantCard(restaurant:nil)
            .previewLayout(.sizeThatFits)
    }
}
 */


