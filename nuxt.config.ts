// https://nuxt.com/docs/api/configuration/nuxt-config
const autoprefixer = require('autoprefixer');
const tailwindcss = require('tailwindcss');

export default defineNuxtConfig({
  css: ['~/assets/css/main.css'],
  devtools: { enabled: true },
  modules: ['@nuxtjs/tailwindcss', '@pinia/nuxt',],
  postcss: {
    plugins: {
      tailwindcss: tailwindcss,
      autoprefixer: autoprefixer,
    },
  },
});
