import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea(.all)
            
            Image("splash-logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 36)
        }
    }
}

/*
#Preview {
    SplashScreenView()
}*/
