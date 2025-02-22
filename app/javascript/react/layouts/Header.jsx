import React from 'react';
import { CiMenuBurger } from 'react-icons/ci';
import { FaUserCircle, FaBell } from 'react-icons/fa';
import { useDarkMode } from '../contexts/DarkModeContext';
import { IoIosSunny } from 'react-icons/io';
import { FaMoon } from 'react-icons/fa';

function Header() {
  const { darkMode, toggleDarkMode } = useDarkMode();

  return (
    <div className="flex items-center justify-between w-full p-4">
      {/* Burger Menu */}
      <div className="flex items-center space-x-4">
        <CiMenuBurger size={30} className={darkMode ? 'text-white' : 'text-primary'} />
      </div>

      {/* Title */}
      <div className={`text-2xl font-semibold ${darkMode ? 'text-darkText' : 'text-primary'}`}>
        Datamorphon
      </div>

      {/* Right Section: User Icon, Alerts, and Dark Mode Toggle */}
      <div className="flex items-center space-x-6">
        {/* Alerts Icon */}
        <div className="relative">
          <FaBell size={24} className={darkMode ? 'text-darkText' : 'text-neutral'} />
          <span className="absolute top-[-10px] right-[-10px] bg-red-500 text-white text-xs rounded-full px-2 py-1">
            3
          </span>
        </div>

        {/* User Icon */}
        <FaUserCircle size={30} className={darkMode ? 'text-darkText' : 'text-neutral'} />

        {/* Dark Mode Toggle */}
        <button
          onClick={toggleDarkMode}
          className={`text-white ${darkMode ? 'bg-primary' : 'bg-neutral'} p-2 rounded`}>
          {darkMode ? <IoIosSunny /> : <FaMoon />}
        </button>
      </div>
    </div>
  );
}

export default Header;
