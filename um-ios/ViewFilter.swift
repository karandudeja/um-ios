import SwiftUI

struct ViewFilter: View {
    var iconName:String
    var iconLabel:String
    @Binding var isOn: Bool
    let style:Styles

    var body: some View {
        ZStack{
            HStack{
                Image(iconName)
                    .resizable()
                    .frame(width:48, height:48)
                    .padding(.trailing, 2)
                Text(iconLabel)
                    .fontWeight(.medium)
                    .font(.system(size: style.title2size))
                    .padding(.trailing, 16)
                    .foregroundColor(isOn ? style.lightTextColor : style.darkTextColor)
            }
            .background(isOn ? style.selectedColor : style.backgroundColor)
            .clipShape(Capsule())
            .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.057), radius: 8, x: 0, y: 2)
        }
        .onTapGesture {
            self.isOn.toggle()
        }
        
    }
}

//#Preview {
//    ViewFilter(iconName: "icon-badge", iconLabel: "Top Rated")
//}
