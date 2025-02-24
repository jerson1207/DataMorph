import React, { createContext, useContext, useState, useEffect } from 'react';
import dayjs from 'dayjs';
import { useSubscription } from '../contexts/SubscriptionContext';  // Import useSubscription

const DateFilterContext = createContext();

export const useDateFilter = () => {
  return useContext(DateFilterContext);
};

export const DateFilterProvider = ({ children }) => {
  // Initialize the start and end date using dayjs
  const initialStartDate = dayjs(new Date(new Date().getFullYear(), new Date().getMonth(), 1)); // First day of the current month
  const initialEndDate = dayjs(); // Current date
  
  const [startDate, setStartDate] = useState(initialStartDate);
  const [endDate, setEndDate] = useState(initialEndDate);

  const { subscriptionType } = useSubscription();  // Get the subscriptionType from SubscriptionContext

  // Function to calculate the dates based on subscription type
  const calculateDates = (type) => {
    let start = startDate;
    let end = endDate;

    switch(type) {
      case 'monthly':
        start = dayjs().startOf('month'); // First day of the current month
        end = dayjs().endOf('month'); // Last day of the current month
        break;
  
      case 'yearly':
        start = dayjs().startOf('year'); // First day of the current year
        end = dayjs().endOf('year'); // Last day of the current year
        break;
  
      case 'custom':
        // Keep the current startDate and endDate as they are
        break;
  
      default:
        break;
    }

    // Update the context with the newly calculated dates
    setStartDate(start);
    setEndDate(end);
  };

  // Whenever subscriptionType changes, recalculate the dates
  useEffect(() => {
    calculateDates(subscriptionType); // Recalculate dates whenever subscriptionType changes
  }, [subscriptionType]);

  return (
    <DateFilterContext.Provider
      value={{ startDate, endDate, setStartDate, setEndDate }}
    >
      {children}
    </DateFilterContext.Provider>
  );
};
