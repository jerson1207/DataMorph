import React, { useState, useRef, useEffect } from 'react';
import { CiMenuBurger } from 'react-icons/ci';
import { FaUserCircle, FaBell, FaMoon } from 'react-icons/fa';
import { useDarkMode } from '../contexts/DarkModeContext';
import { IoIosSunny } from 'react-icons/io';
import Modal from '../components/Modal'
import { useSubscription } from '../contexts/SubscriptionContext';

function Header() {
  const { darkMode, toggleDarkMode } = useDarkMode();
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const dropdownRef = useRef(null); // Reference to the dropdown menu
  const userIconRef = useRef(null); // Reference to the user icon
  const [isModalOpen, setIsModalOpen] = useState(false);
  const { subscriptionType, updateSubscription } = useSubscription(); 
  

  // Close the dropdown when clicking outside of it
  useEffect(() => {
    const handleClickOutside = (event) => {
      if (
        dropdownRef.current &&
        !dropdownRef.current.contains(event.target) &&
        userIconRef.current &&
        !userIconRef.current.contains(event.target)
      ) {
        setIsMenuOpen(false);
      }
    };

    document.addEventListener('mousedown', handleClickOutside);

    // Cleanup the event listener when the component unmounts
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, []);

  const handleUserIconClick = () => {
    setIsMenuOpen(!isMenuOpen);
  };


  const handleSettingsClick = () => {
    setIsModalOpen(true); // Open modal when "Settings" is clicked
    setIsMenuOpen(false); // Close the dropdown menu
  };

  const handleOptionChange = (e) => {
    updateSubscription(e.target.value); // Update the subscription type in context
  };

  const closeModal = () => {
    setIsModalOpen(false); // Close the modal
  };

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
      <div className="flex items-center space-x-6 relative">
        {/* Alerts Icon */}
        <div className="relative">
          <FaBell size={24} className={darkMode ? 'text-darkText' : 'text-neutral'} />
          <span className="absolute top-[-10px] right-[-10px] bg-red-500 text-white text-xs rounded-full px-2 py-1">
            3
          </span>
        </div>

        {/* User Icon */}
        <FaUserCircle
          size={30}
          className={darkMode ? 'text-darkText' : 'text-neutral'}
          onClick={handleUserIconClick} // Toggle dropdown on click
          ref={userIconRef} // Reference the user icon
        />

        {/* Dropdown Menu */}
        {isMenuOpen && (
          <div
            ref={dropdownRef} // Reference the dropdown
            className="absolute right-0 mt-2 w-48 bg-white shadow-lg rounded-lg z-10"
          >
            <ul className="list-none p-2">
              <li>
                <button
                  className="block w-full text-left px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 rounded-md"
                  onClick={handleSettingsClick}
                >
                  Settings
                </button>
              </li>
            </ul>
          </div>
        )}

        {/* Dark Mode Toggle */}
        <button
          onClick={toggleDarkMode}
          className={`text-white ${darkMode ? 'bg-primary' : 'bg-neutral'} p-2 rounded`}
        >
          {darkMode ? <IoIosSunny /> : <FaMoon />}
        </button>
      </div>

{/* Modal for Settings */}
<Modal isOpen={isModalOpen} closeModal={closeModal}>
        <h2 className="text-xl font-semibold">Settings</h2>
        <div className="mt-4">
          <p>Select your subscription type:</p>
          
          {/* Subscription Type Options */}
          <div className="space-y-2 mt-2">
            <label className="block">
              <input
                type="radio"
                name="subscriptionType"
                value="monthly"
                checked={subscriptionType === 'monthly'}
                onChange={handleOptionChange}
                className="mr-2"
              />
              Monthly
            </label>

            <label className="block">
              <input
                type="radio"
                name="subscriptionType"
                value="yearly"
                checked={subscriptionType === 'yearly'}
                onChange={handleOptionChange}
                className="mr-2"
              />
              Yearly
            </label>

            <label className="block">
              <input
                type="radio"
                name="subscriptionType"
                value="custom"
                checked={subscriptionType === 'custom'}
                onChange={handleOptionChange}
                className="mr-2"
              />
              Custom
            </label>
          </div>
        </div>
      </Modal>
    </div>
  );
}

export default Header;
