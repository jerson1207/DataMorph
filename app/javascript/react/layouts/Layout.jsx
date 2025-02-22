// src/components/Layout.js

import React from 'react';
import Header from './Header';
import { useDarkMode } from '../contexts/DarkModeContext';
import Sidebar from './Sidebar';
import { Outlet } from 'react-router';

export default function Layout() {
  const { darkMode } = useDarkMode();

  return (
    <div className={`min-h-screen w-screen ${darkMode ? 'bg-darkBackground' : 'bg-background'} transition-colors`}>
      {/* Header */}
      <Header />
      
      {/* Main layout container */}
      <div className="flex h-[calc(100vh-4rem)]"> {/* 4rem for header height */}
        {/* Sidebar */}
        <div className={`w-64 ${darkMode ? 'bg-gray-800' : 'bg-gray-200'} text-white h-full`}>
          <Sidebar />
        </div>
  
        {/* Main Content */}
        <main className="w-full flex-grow">
          <Outlet />
        </main>
      </div>
    </div>
  );  
}
