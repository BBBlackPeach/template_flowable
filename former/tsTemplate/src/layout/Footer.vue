<template>
  <div class="footer-layout">
    <!-- <div>
      <span>版权所有：桂林医学院附属医院</span>
      <el-divider direction="vertical" />
      <span>桂ICP备：03010128-1号</span>
      <el-divider direction="vertical" />
      <span>
        <a href="#">桂公网安备45030502000142号</a>
      </span>
    </div> -->
  </div>
</template>

<script setup lang="ts">
</script>

<style lang="scss" scoped>
.footer-layout {
  color: #888;
  height: 30px;
  margin-top: 10px;

  a {
    color: #888;
  }

  div {
    display: flex;
    justify-content: center;

    .el-divider {
      height: 20px;
    }

    span {
      margin: 0 3px;
    }
  }
}
</style>
