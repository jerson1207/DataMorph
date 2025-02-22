// routes/Routes.jsx
import React from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import  DashboardLayout  from './layouts/Layout';
import { DarkModeProvider } from './contexts/DarkModeContext';
import Home from './pages/Home'
import UccInventoryDataset from './pages/UccInventoryDataset'
import MonthlyPerformanceDataset from './pages/MonthlyPerformanceDataset'
import { SubscriptionProvider } from './contexts/SubscriptionContext';


export default function RouteConfig() {
  return (
    <DarkModeProvider>
      <SubscriptionProvider>
        <BrowserRouter>
          <Routes>
            <Route path="/" element={<DashboardLayout />}>
              <Route index element={<Home />} />
              <Route path="ucc_inventory_dataset" element={<UccInventoryDataset />} />
              <Route path="monthly_performance_dataset" element={<MonthlyPerformanceDataset />} />
            </Route>
          </Routes>
        </BrowserRouter>
      </SubscriptionProvider>
    </DarkModeProvider>
  );
}
