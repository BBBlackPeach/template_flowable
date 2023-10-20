<template>
  <div class="footer-layout">
    <div>
      <div>版权所有：后台管理系统开发模板</div>
      <el-divider direction="vertical" />
      <div>京ICP备：XXXXXXX-X号</div>
      <el-divider direction="vertical" />
      <div>
        <a href="#">京公网安备XXXXXXXXXXXXXX号</a>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
</script>

<style lang="scss" scoped>
.footer-layout {
  color: #888;
  height: 3%;
  margin-top: 0.3rem;
  font-size: $SecondFontSize;

  a {
    color: #888;
  }

  div {
    display: flex;
    justify-content: center;

    .el-divider {
      height: 2.5vh;
    }

    // div {
    // margin: 0 1vh;
    // }
  }
}
</style>
