import React from 'react';
import Headings from './Headings.js';
import Rows from './Rows.js';
import Total from './Total.js';

export default function FormBody({
    data,
    budgetValues,
    setBudgetValues
  }) {

  return (
    <React.Fragment>
      <Headings/>
      <Rows
        data={data}
        budgetValues={budgetValues}
        setBudgetValues={setBudgetValues}/>
      <Total
        totalBudget={data.totalBudget}
        budgetValues={budgetValues}
        setBudgetValues={setBudgetValues}/>
    </React.Fragment>
  );
};
