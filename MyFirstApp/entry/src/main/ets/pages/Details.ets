import { router } from '@kit.ArkUI';
import Nav from '../components/Nav'

@Entry
@Component
struct Details {
  @State message: string = 'Details';
onPageShow(): void {
  this.message = JSON.stringify(router.getParams())
  console.log('接收到的参数:',JSON.stringify(router.getParams()))
}
  build() {
    RelativeContainer() {
      Column() {
        Nav({ title: '详情页面' })
        Text(this.message)
          .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Top },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
      }.padding(15)
    }
    .height('100%')
    .width('100%')
  }
}