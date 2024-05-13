import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            headerView
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello Umain!")
        }
        .padding()
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
