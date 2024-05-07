const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './node_modules/flowbite/**/*.js'
  ],
  theme: {
    extend: {
      width: {
        '480': '480px',
      },
      height: {
        '640': '640px',
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      screens:{
        'sm':'480px',
        'md':'640px',
        'lg':'1020px',
        'xl':'1080px',
        '2xl':'1440px',
      },
    },
    colors: {
      blueshadown:'#0D65D9',
      main:'#1E6FD9',
      middleblue:'#5C9DF2',
      lightgray:'#F2F2F2',
      darkgray:'#2C2C33',
      lightblue:'#94BDF2',
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require('flowbite/plugin')
  ]
}
