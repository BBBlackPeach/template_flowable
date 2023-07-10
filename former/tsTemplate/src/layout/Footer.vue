<template>
  <div class="footer-layout">
    <div>
      <span>版权所有：后台管理系统开发模板</span>
      <el-divider direction="vertical" />
      <span>京ICP备：XXXXXXX-X号</span>
      <el-divider direction="vertical" />
      <span>
        <a href="#">京公网安备XXXXXXXXXXXXXX号</a>
      </span>
    </div>
  </div>
</template>

<script setup lang="ts">
</script>

<style lang="scss" scoped>
.footer-layout {
  color: #888;
  height: 3.75vh;
  margin-top: 0.625rem;
  font-size: 1rem;

  a {
    color: #888;
  }

  div {
    display: flex;
    justify-content: center;

    .el-divider {
      height: 2.5vh;
    }

    span {
      margin: 0 0.25rem;
    }
  }
}
</style>
