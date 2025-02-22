import React from 'react';

const Modal = ({ isOpen, closeModal, children }) => {
  if (!isOpen) return null;

  return (
    <div
      className="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center z-50"
      onClick={closeModal}
    >
      <div
        className="bg-white p-6 rounded-lg w-96"
        onClick={(e) => e.stopPropagation()} // Prevent closing modal when clicking inside
      >
        <button
          className="absolute top-4 right-4 text-xl font-bold"
          onClick={closeModal}
        >
          &times;
        </button>
        {children}
      </div>
    </div>
  );
};

export default Modal;
