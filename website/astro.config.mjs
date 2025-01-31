import { defineConfig } from "astro/config";
import starlight from "@astrojs/starlight";
// https://starlight.astro.build/guides/css-and-tailwind/#tailwind-css
import tailwind from "@astrojs/tailwind";
// https://github.com/HiDeoo/starlight-links-validator
import starlightLinksValidator from "starlight-links-validator";
// https://github.com/HiDeoo/starlight-image-zoom
import starlightImageZoom from "starlight-image-zoom";
// https://github.com/HiDeoo/starlight-blog
import starlightBlog from "starlight-blog";
// https://docs.astro.build/en/guides/integrations-guide/sitemap/
import sitemap from "@astrojs/sitemap";
// https://github.com/alextim/astro-lib/tree/main/packages/astro-robots-txt#readme
import robotsTxt from "astro-robots-txt";
// https://github.com/giuseppelt/astro-lottie
import lottie from "astro-integration-lottie";
// https://github.com/risu729/astro-better-image-service
import betterImageService from "astro-better-image-service";
// https://github.com/Playform/Compress
import playformCompress from "@playform/compress";
// Configure global authors here
import { authors } from "./src/content/docs/news/authors";
const site = "https://truecharts.org";

// https://astro.build/config
export default defineConfig({
  site: site,
  base: "/",
  output: "static",
  outDir: "build",
  cacheDir: ".astro/cache",
  trailingSlash: "ignore",
  compressHTML: true,
  prefetch: {
    prefetchAll: true,
  },
  build: {
    output: "directory",
  },
  experimental: {
  },
  integrations: [
    starlight({
      title: "TrueCharts Charts",
      customCss: ["./src/tailwind.css"],
      tagline: "Awesome Helm Charts",
      pagefind: true,
      logo: {
        src: "./src/assets/with-text.svg",
        replacesTitle: true,
      },
      head: [
        {
          tag: "script",
          attrs: {
            src: "https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-9270569596814796",
            crossorigin: "anonymous",
            defer: true,
          },
        },
        {
          tag: "script",
          attrs: {
            src: "https://www.googletagmanager.com/gtag/js?id=G-Q9NT692BZZ",
            defer: true,
          },
        },
        {
          tag: "script",
          content:
            "window.dataLayer = window.dataLayer || []; function gtag(){dataLayer.push(arguments);} gtag('js', new Date()); gtag('config', 'G-Q9NT692BZZ');",
        },
      ],
      tableOfContents: {
        maxHeadingLevel: 6,
      },
      social: {
        github: "https://github.com/truecharts",
        facebook: "https://www.facebook.com/truecharts",
        "x.com": "https://twitter.com/useTrueCharts",
        discord: "https://discord.gg/tVsPTHWTtr",
        telegram: "https://t.me/s/truecharts",
        openCollective: "https://opencollective.com/truecharts",
        patreon: "https://patreon.com/truecharts",
      },
      editLink: {
        baseUrl: "https://github.com/truecharts/public/tree/master/website/",
      },
      components: {
        Header: "./src/components/CustomHeader.astro",
        Hero: "./src/components/CustomHero.astro",
        MarkdownContent: "./src/components/CustomMarkdownContent.astro",
      },
      plugins: [
        starlightBlog({
          prefix: "news",
          title: "TrueCharts News",
          postCount: 5,
          recentPostCount: 10,
          authors: authors,
        }),
        starlightImageZoom(),
        starlightLinksValidator({
          errorOnRelativeLinks: false,
          errorOnFallbackPages: false,
          errorOnLocalLinks: false,
          exclude: [
            "/s/charts",
            "/s/discord",
            "/s/fb",
            "/s/ghs",
            "/s/git",
            "/s/oc",
            "/s/patreon",
            "/s/shop",
            "/s/tg",
            "/s/twitter",
          ],
        }),
      ],
      sidebar: [
        {
          label: "General",
          collapsed: false,
          autogenerate: {
            directory: "general",
            collapsed: true
          },
        },
        {
          label: "Common Chart Options",
          collapsed: true,
          autogenerate: {
            directory: "common",
          },
        },
        {
          label: "Guides",
          collapsed: true,
          autogenerate: {
            directory: "guides",
          },
        },
        {
          label: "ClusterTool",
          collapsed: true,
          autogenerate: {
            directory: "clustertool",
          },
        },
        {
          label: "Charts",
          collapsed: true,
          autogenerate: {
            directory: "charts",
          },
        },
        {
          label: "Development",
          collapsed: true,
          autogenerate: {
            directory: "development",
          },
        },
        {
          label: "Deprecated",
          collapsed: true,
          autogenerate: {
            directory: "deprecated",
          },
        },
      ],
    }),
    sitemap(),
    robotsTxt(),
    tailwind({
      // Disable the default base styles:
      applyBaseStyles: false,
    }),
    lottie(),
    betterImageService(),
    playformCompress({
      HTML: false,
      CSS: true,
      JavaScript: true,
      Image: true,
      SVG: true,
    }),
  ],
});
