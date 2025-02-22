// contexts/SubscriptionContext.js
import React, { createContext, useContext, useState } from 'react';

const SubscriptionContext = createContext();

export const useSubscription = () => {
  return useContext(SubscriptionContext);
};

export const SubscriptionProvider = ({ children }) => {
  const [subscriptionType, setSubscriptionType] = useState('monthly'); // Default is 'monthly'

  const updateSubscription = (newType) => {
    setSubscriptionType(newType);
  };

  return (
    <SubscriptionContext.Provider value={{ subscriptionType, updateSubscription }}>
      {children}
    </SubscriptionContext.Provider>
  );
};
