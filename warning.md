# Flutter Tailwind 使用注意事项

## 1. 样式链式调用顺序
1. 颜色样式放最前面（如 white、primary、grey）
2. 布局样式放中间（如 p16、mt12、expanded）
3. children/child 放在 click 前面
4. click 永远放在最后面 


## 2. mk 的使用规则
1. 如果链式调用以 children/child 结尾，不需要 mk
2. 如果链式调用以 click 结尾，不需要 mk
3. 如果是单个组件的样式链，需要 mk
