/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        bg: 'var(--bg)',
        surface: 'var(--surface)',
        surface2: 'var(--surface2)',
        dim: 'var(--dim)',
        accent: 'var(--accent)',
      },
      fontFamily: {
        sans: ['Noto Sans KR', 'sans-serif'],
        mono: ['Space Mono', 'monospace'],
        display: ['Playfair Display', 'serif'],
      },
    },
  },
  plugins: [],
}
