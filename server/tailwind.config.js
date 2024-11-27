/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./static/**/*.{html,js}"],
  theme: {
    extend: {
        fontSize: {
            '20xl': '12rem',
        },
        fontFamily: {
            oswald: ["Oswald", "sans-serif"],
            lato: ["Lato", "sans-serif"],
        },
    },
  },
  plugins: [],
}

