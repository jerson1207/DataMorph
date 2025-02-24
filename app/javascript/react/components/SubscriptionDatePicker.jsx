import React, { useState } from 'react';
import { useDateFilter } from '../contexts/DateFilterContext';
import { LocalizationProvider, DatePicker } from "@mui/x-date-pickers";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import { useSubscription } from '../contexts/SubscriptionContext';

const DatePickerWrapper = ({ label, value, minDate, maxDate, views, onChange }) => (
  <LocalizationProvider dateAdapter={AdapterDayjs}>
    <div className="flex justify-end w-full mb-2">
      <div className="flex gap-2">
        <DatePicker
          label={label}
          value={value}
          views={views}
          minDate={minDate}
          maxDate={maxDate}
          onChange={onChange}
          slotProps={{ textField: { size: "small" } }}
        />
      </div>
    </div>
  </LocalizationProvider>
);

export default function SubscriptionDatePicker() {
  const { startDate, endDate, setStartDate, setEndDate } = useDateFilter(); // Get date context
  const { subscriptionType } = useSubscription(); 

  const handleMonthly = (date) => {
    const startMonth = date.startOf('month');
    const endMonth = date.endOf('month');
    setStartDate(startMonth);
    setEndDate(endMonth);
  };

  const handleYearly = (date) => {
    const startMonth = date.startOf('year');
    const endMonth = date.endOf('year');
    setStartDate(startMonth);
    setEndDate(endMonth);
  }

  return (
    <div>
      {subscriptionType === 'monthly' && 
        <DatePickerWrapper
          label="Start Date"
          value={startDate}
          views={['year', 'month']}
          onChange={handleMonthly}
        />
      }

      {subscriptionType === 'yearly' && 
        <DatePickerWrapper
          label="Start Date"
          value={startDate}
          maxDate={endDate}
          views={['year']}
          onChange={handleYearly}
        />
      }

      {subscriptionType === 'custom' && 
        <div className='flex justify-end w-full mb-2'>
          <div className="flex gap-2">
            <DatePickerWrapper
              label="Start Date"
              value={startDate}
              maxDate={endDate}
              onChange={setStartDate}
            />
            <DatePickerWrapper
              label="End Date"
              value={endDate}
              minDate={startDate}
              onChange={setEndDate}
            />
          </div>
        </div>
      }
    </div>
  );
}
