import { router } from "@kit.ArkUI";

@Component
export  default  struct Nav {
  @State title: string = '首页';

  build() {
    Row(){
      Text('返回')
        .onClick(()=>{
          router.back()
        })
      Text(this.title)
      Text('')
    }
    .width('100%')
    .padding(20)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

