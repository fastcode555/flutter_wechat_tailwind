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


## 4. 布局结构
1. 使用 SingleChildScrollView + column.children 替代 listview.children
2. 使用 const Divider() 替代 divider.mk
3. 列表项使用 row.white.p16.children([]) 的结构

## 5. 常见错误

### 1. 颜色样式放错位置

## 6. 代码审查清单
1. 检查颜色样式是否在最前面
2. 检查 click 是否在最后面
3. 检查是否有多余的 mk
4. 检查是否使用了 divider.mk
5. 检查列表结构是否正确
6. 检查布局样式的顺序
7. 检查组件嵌套的合理性

## 7. 性能优化建议
1. 避免不必要的 Obx 包装
2. 合理使用 const 构造器
3. 列表项使用 indexed 构造器
4. 避免深层嵌套
5. 合理使用缓存机制