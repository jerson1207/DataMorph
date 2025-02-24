import React from 'react';
import SubscriptionDatePicker from '../components/SubscriptionDatePicker';
import { useDateFilter } from '../contexts/DateFilterContext'; // Import the hook

function HomePage() {
  const { startDate, endDate} = useDateFilter(); // Access date filter context

  return (
    <div className="container mx-auto p-2">
      <div>
        <SubscriptionDatePicker
        />
      </div>

      {/* Render the startDate and endDate in a readable format */}
      <div>
        <p>Start date: {startDate.format('MM/DD/YYYY')}</p>
        <p>End date: {endDate.format('MM/DD/YYYY')}</p>
      </div>
    </div>
  );
}

export default HomePage;
