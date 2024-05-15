import SwiftUI

struct ViewRestaurantDetails: View {
    
    @Environment(\.dismiss) private var dismiss
    let restaurant: Restaurant

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: restaurant.imageUrl)) { image in
                image.resizable()
                     .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }

            VStack(alignment: .leading) {
                ViewRestaurantDetailsCard(restaurant: restaurant, style: Styles())
                    .offset(y: -60.0)
            }

            Spacer()
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        ZStack(alignment:.center){
                            Circle()
                                .size(width: 40, height: 40.0)
                                .foregroundColor(.white)
                                .offset(x: -5.0, y:-12.6)
                            
                            Image(systemName: "chevron.down")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}

/*
 #Preview {
 ViewRestaurantDetails(restaurant: restaurant2)
 }
 */

