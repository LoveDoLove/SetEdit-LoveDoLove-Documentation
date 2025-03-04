import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  base: "/",
  ignoreDeadLinks: true,
  title: "SetEdit LoveDoLove Documentation",
  description: "SetEdit LoveDoLove Documentation",
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: "Home", link: "/" },
      { text: "SetEdit Docs", link: "/features/introduction" },
    ],

    sidebar: [
      {
        text: "SetEdit",
        items: [
          { text: "Introduction", link: "/features/introduction" },
          { text: "Main Features", link: "/features/main-features" },
          { text: "Build.prop Editor", link: "/features/build-prop-editor" },
          { text: "Shell Terminal", link: "/features/shell-terminal" },
          { text: "Import Properties", link: "/features/import-properties" },
          { text: "Application Launcher", link: "/features/application-launcher" },
          { text: "Hidden Network", link: "/features/hidden-network" },
          { text: "Root Modules", link: "/features/root-modules" },
          { text: "Touch Sensitivity", link: "/features/touch-sensitivity" },
          { text: "Game Driver", link: "/features/game-driver" },
          { text: "Fps Changer", link: "/features/fps-changer" },
          { text: "Virtual Ram", link: "/features/virtual-ram" },
          { text: "Services", link: "/features/services" },
        ],
      },
    ],

    socialLinks: [
      { icon: "github", link: "https://github.com/LoveDoLove" },
      { icon: "youtube", link: "https://www.youtube.com/@lovedolove" },
    ],
  },
});
