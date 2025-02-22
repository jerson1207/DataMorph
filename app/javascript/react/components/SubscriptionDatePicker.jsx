import React from 'react';
import { useSubscription } from '../contexts/SubscriptionContext';
import { LocalizationProvider, DatePicker } from "@mui/x-date-pickers";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import dayjs from 'dayjs';

const DatePickerWrapper = ({ label, value, minDate, maxDate, views }) => (
  <LocalizationProvider dateAdapter={AdapterDayjs}>
    <div className="flex justify-end w-full mb-2">
      <div className="flex gap-2">
        <DatePicker
          label={label}
          value={value}
          views={views}
          minDate={minDate}
          maxDate={maxDate}
          slotProps={{ textField: { size: "small" } }}
        />
      </div>
    </div>
  </LocalizationProvider>
);

export default function SubscriptionDatePicker() {
  const { subscriptionType } = useSubscription();
  const startDate = dayjs(new Date(new Date().getFullYear(), new Date().getMonth(), 1));
  const endDate = dayjs(); // Current date as Dayjs object

  return (
    <div>
      {subscriptionType === 'monthly' && 
        <DatePickerWrapper
          label="Start Date"
          value={startDate}
          maxDate={endDate}
          views={['year', 'month']}
        />
      }

      {subscriptionType === 'yearly' && 
        <DatePickerWrapper
          label="Start Date"
          value={startDate}
          maxDate={endDate}
          views={['year']}
        />
      }

      {subscriptionType === 'custom' && 
        <div className='flex justify-end w-full mb-2'>
          <div className="flex gap-2">
            <DatePickerWrapper
              label="Start Date"
              value={startDate}
              maxDate={endDate}
            />
            <DatePickerWrapper
              label="End Date"
              value={endDate}
              minDate={startDate}
            />
          </div>
        </div>
      }
    </div>
  );
}
