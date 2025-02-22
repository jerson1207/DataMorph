import React from 'react';
import { NavLink } from 'react-router-dom';
import { useDarkMode } from '../contexts/DarkModeContext';

export default function Sidebar() {
  const { darkMode } = useDarkMode();

  const linkClass = (isActive) => {
    const baseClass = `block px-4 py-2 text-gray-900 rounded-lg group`;
    const hoverClass = darkMode ? 'hover:bg-gray-700' : 'hover:bg-gray-200';
    const activeClass = isActive
      ? darkMode
        ? 'bg-gray-700 text-white'
        : 'bg-gray-200 text-gray-900'
      : '';
    
    return `${baseClass} ${hoverClass} ${activeClass}`;
  };

  return (
    <nav className="h-full px-3 py-4 bg-gray-50 dark:bg-gray-800">
      <ul className="space-y-2 font-medium">
        <li>
          <NavLink
            to="/"
            className={({ isActive }) => linkClass(isActive)}
          >
            Dashboard
          </NavLink>
        </li>
        <li>
          <NavLink
            to="/ucc_inventory_dataset"
            className={({ isActive }) => linkClass(isActive)}
          >
            Inventory
          </NavLink>
        </li>
        <li>
          <NavLink
            to="/monthly_performance_dataset"
            className={({ isActive }) => linkClass(isActive)}
          >
            Users
          </NavLink>
        </li>
      </ul>
    </nav>
  );
}
