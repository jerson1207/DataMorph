// src/pages/HomePage.js
import React, { useEffect } from 'react';
import { useSubscription } from '../contexts/SubscriptionContext';
import SubscriptionDatePicker from '../components/SubscriptionDatePicker';

function HomePage() {
  const { subscriptionType, startDate, endDate, updateSubscription } = useSubscription();

  useEffect(() => {
    // Optional: Set default values or load data if needed
    if (!startDate) {
      // Set default start date (could be today or a specific date)
      const today = new Date();
      updateSubscription(subscriptionType, today, null);
    }
  }, [subscriptionType, startDate, updateSubscription]);

  return (
    <div className="container mx-auto p-2">
      <div className="">
        <SubscriptionDatePicker />
      </div>
    </div>
  );
}

export default HomePage;
