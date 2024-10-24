import { router } from '@kit.ArkUI';
import Nav from '../components/Nav'

console.log(new Date().toLocaleString())

class Item {
  name: string
  image: ResourceStr
  price: number
  discount: number
  constructor(name: string, image: ResourceStr, price: number, discount: number = 0) {
    this.name = name
    this.image = image
    this.price = price
    this.discount = discount
  }
}


@Entry
@Component
struct Index {
  @State message: string = 'Welcome Maisy !';
  @State time: string = new Date().toLocaleString();
  @State items: Array<Item> = [
    new Item('123', $r('app.media.startIcon'), 7499),
    new Item('456789', $r('app.media.startIcon'), 6499),
    new Item('Pocket系列', $r('app.media.startIcon'), 7499),
    new Item('Mate系列', $r('app.media.startIcon'), 6499),
    new Item('P系列', $r('app.media.startIcon'), 6988),
    new Item('nova系列', $r('app.media.startIcon'), 4699),
    new Item('畅想系列', $r('app.media.startIcon'), 1499),
    new Item('畅想系列', $r('app.media.startIcon'), 1499),
    new Item('畅想系列', $r('app.media.startIcon'), 1499),
    new Item('畅想系列', $r('app.media.startIcon'), 1499)
  ]

  onPageShow(): void {
    setInterval(() => {
      this.time = new Date().toLocaleString()
    }, 100)

  }

  build() {
    RelativeContainer() {
      Column({ space: 5 }) {
        Row() {
          Text(this.message)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
          Text(this.time)
            .fontSize(16)
            .fontColor(Color.Red)
        }
        // 定义列表
        List({ space: 8 }) {
          ForEach(
            this.items,
            // 也可以写成item => {}，但因为传进来的item类型为any，所以没有提示，声明变量类型后就有提示了
            (item: Item) => {
              ListItem() {
                Row({ space: 10 }) {
                  Image(item.image)
                    .width(50)
                  Column({ space: 4 }) {
                    // 如果有折扣 渲染只有这里有变化
                    if (item.discount) {

                    } else {
                      Column() {
                        Text(item.name)
                          .fontSize(18)
                          .fontWeight(FontWeight.Normal)
                        Text('￥' + item.price)
                          .fontColor('#F36')
                          .fontSize(16)
                      }.alignItems(HorizontalAlign.Center)
                      .justifyContent(FlexAlign.Center)
                      .height('100%')
                    }
                  }
                  .height('100%')
                  .alignItems(HorizontalAlign.Start)
                  // 编辑删除
                  Column({ space: 4 }) {
                    // 如果有折扣 渲染只有这里有变化
                    if (item.discount) {

                    } else {
                      Row() {
                        Text('编辑')
                          .onClick(() => {
                            router.pushUrl({
                              url: 'pages/Details',
                              params: item
                            })
                          })
                          .fontSize(14)
                          .fontWeight(FontWeight.Normal)
                          .margin({ left: '20', right: '20' })
                        Text('删除')
                          .onClick(() => {
                            AlertDialog.show(
                              {
                                title: '提示',
                                subtitle: '',
                                message: '操作将删除数据，是否继续？',
                                autoCancel: true,
                                alignment: DialogAlignment.Bottom,
                                gridCount: 4,
                                offset: { dx: 0, dy: -20 },
                                primaryButton: {
                                  value: '取消',
                                  action: () => {
                                    console.info('Callback when the first button is clicked')
                                  }
                                },
                                secondaryButton: {
                                  enabled: true,
                                  defaultFocus: true,
                                  style: DialogButtonStyle.HIGHLIGHT,
                                  value: '确定',
                                  action: () => {
                                    console.info('Callback when the second button is clicked')
                                  }
                                }
                              }
                            )
                          }).backgroundColor(0x317aff)
                          .fontColor('#ffffff')
                          .backgroundColor('red')
                          .fontSize(14)
                          .padding({left:10,right:10,top:2,bottom:2})
                          .borderRadius(5)
                      }
                      .justifyContent(FlexAlign.Center)
                      .height('100%')
                      .width('120')
                    }
                  }
                  .height('100%')
                  .alignItems(HorizontalAlign.Start)

                }
                .width('100%')
                .backgroundColor('#e6e6e6')
                .borderRadius(10)
                .height(80)
                .padding(10)
                .justifyContent(FlexAlign.SpaceBetween)
              }
            }
          )
        }
        .width('100%')
        .layoutWeight(1) // 权重配比

      }.width('100%')
      .padding(10)
    }
    .height('100%')
    .width('100%')
  }
}