import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import AutoImport from 'unplugin-auto-import/vite'
import Components from 'unplugin-vue-components/vite'
import { ElementPlusResolver } from 'unplugin-vue-components/resolvers'
import { resolve } from 'path'

// https://vitejs.dev/config/
export default defineConfig({
  base: './',
  plugins: [
    vue(),
    AutoImport({
      imports: ["vue", "vue-router"],
      dts: 'src/auto-import.d.ts'    // 路径下自动生成文件夹存放全局指令
    }),
    Components({
      resolvers: [ElementPlusResolver()],
      dts: "src/components.d.ts",
    }),
  ],
  server: {
    https: false,  // 是否开启 https
    port: 1836,  // 端口号
    host: '0.0.0.0',  // 监听所有地址
    open: true,  // 服务启动时是否自动打开浏览器
    cors: true,   // 允许跨域
    proxy: {},  // 自定义代理规则
  },
  resolve: {
    // 配置别名
    alias: {
      "@": resolve(__dirname, "./src")
    }
  },
  css: {
    // css预处理器
    preprocessorOptions: {
      scss: {
        // 引入 common.scss 这样就可以在全局中使用 common.scss中预定义的变量了
        // 给导入的路径最后加上 ; 
        additionalData: '@import "@/style/common.scss";'
      }
    }
  },
  build: {
    sourcemap: false,
    minify: 'terser',
    chunkSizeWarningLimit: 1500,
    terserOptions: {
      compress: {
        drop_console: true,
        drop_debugger: true
      }
    },
    rollupOptions: {
      output: {
        manualChunks(id) {
          if (id.includes('node_modules')) {
            return id
              .toString()
              .split('node_modules/')[1]
              .split('/')[0]
              .toString();
          }
        },
      }
    }
  },
  optimizeDeps: {
    include: ['element-plus/lib/locale/lang/zh-cn',
      'bpmn-js/lib/Modeler',
      'bpmn-js-token-simulation'
    ]
  }
  // 或
  // 打包
  // build: {
  //   outDir: "dist", // 指定打包输出路径
  //   assetsDir: "assets", // 指定静态资源存放路径
  //   minify: 'terser', // 混淆器,terser构建后文件体积更小
  //   target: "modules", // 指定es版本,浏览器的兼容性
  //   sourcemap: false, // 是否构建source map 文件
  //   cssCodeSplit: true, // css代码拆分,禁用则所有样式保存在一个css里面
  //   chunkSizeWarningLimit: 1500, // 文件大小限制
  //   terserOptions: {
  //     compress: {
  //       drop_console: true, // 生产环境移除console
  //       drop_debugger: true // 生产环境移除debugger
  //     }
  //   },
  //   rollupOptions: {
  //     output: {
  //       manualChunks(id) {
  //         // 解决【Vue3】vite打包报错：块的大小超过限制，Some chunks are larger than 500kb after minification
  //         if (id.includes('node_modules')) {
  //           return id.toString().split('node_modules/')[1].split('/')[0].toString();
  //         }
  //       },
  //       chunkFileNames: (chunkInfo) => {
  //         const facadeModuleId = chunkInfo.facadeModuleId ? chunkInfo.facadeModuleId.split('/'): [];
  //         const fileName = facadeModuleId[facadeModuleId.length - 2] || '[name]';
  //         return `js/${fileName}/[name].[hash].js`;
  //       }
  //     }
  //   }
  // }

})
