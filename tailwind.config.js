module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/javascript/**/*.jsx',
  ],
  theme: {
    extend: {
      colors: {
        primary: '#1DA1F2',   // Twitter/X blue
        secondary: '#657786', // Lighter gray-blue
        background: '#F5F8FA', // Light gray background
        darkBackground: '#15202B', // Dark background for dark mode
        darkText: '#E1E8ED', // Light text in dark mode
        accent: '#1B95E0',  // Accent color for links and highlights
        neutral: '#AAB8C2', // Neutral gray
      },
      fontFamily: {
        sans: ['Segoe UI', 'Roboto', 'Arial', 'sans-serif'],
      },
      spacing: {
        18: '4.5rem',
      },
    },
  },
  darkMode: 'class', // Enable dark mode with class-based switching
  plugins: [],
};
