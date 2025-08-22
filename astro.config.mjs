import { defineConfig } from "astro/config";
import node from "@astrojs/node";

export default defineConfig({
  output: "server",
  adapter: node({
    mode: "standalone",
    // bind to Railway's dynamic port
    port: process.env.PORT ? Number(process.env.PORT) : 3000,
    host: "0.0.0.0", // allow external connections
  }),
  server: {
    host: "0.0.0.0",
  },
  
});
