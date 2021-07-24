import React, { useState, useEffect } from 'react';
import s from '../../styles/styles.module.scss';
import AllocationInput from './allocationInput.js';

/* the following works because of the babel-plugin-inline-react-svg
dependency. it converts an svg into a react component so that it
can easily be used in a react script like this. see examples at
https://github.com/vercel/next.js/tree/master/examples/svg-components
and https://gist.github.com/iamchristough/493c60112770058566d559e6860dc4c9 */
import ChevronDown from '../../static/chevron-down.svg';

/* https://dev.to/pnkfluffy/passing-data-from-child-to-parent-with-react-hooks-1ji3 */
export default function Row(props) {

  const {
    budgetCategory,
    userSelectedBudgetValues,
    handleBudgetValueInput,
    fixedBudgetAmount
  } = props;

  const [accordionOpen, setAccordionOpen] = useState(
    false
  );

  /* when a user clicks on the ChevronDown component, the value of
  accordionOpen will invert and the html components will be
  styled..........accordingly */
  const handleAccordion = () => {
    setAccordionOpen(!accordionOpen);
  };

  // conditionally generate caption for each input scheme
  const generateCaption = () => {
    if (
      userSelectedBudgetValues[budgetCategory.id] == '' ||
      userSelectedBudgetValues[budgetCategory.id] == '0') {
      return "($0)";
    } else {
      let multiplier = parseFloat(userSelectedBudgetValues[budgetCategory.id])/100;
      return `$${formatBillionsOfDollars(fixedBudgetAmount * multiplier)} Billion`;
    }
  };

  const formatBillionsOfDollars = (amount) => (
    Number(Math.round(amount/1000000000 + 'e2') + 'e-2')
  );

  const formattedRowAmount = (amount) => {
    let rowAmountInBillions = formatBillionsOfDollars(amount);
    return rowAmountInBillions != 0 ? `$${rowAmountInBillions} Billion` : "$0";
  };

  const getRowContent = () => {
    return (
      <div key={budgetCategory.id} className={s.formRowCombo}>
        <div className={s.spaghettiDiv}>
          <section
            className={s.formRowSectionHover}
            id={budgetCategory.id}
            onClick={handleAccordion}>
            <ChevronDown
              className={s.chevron}
              id={budgetCategory.id}
              style={accordionOpen ? {transform: 'rotate(180deg)'} : {}}/>
            <div
              className={s.categoryTitle}
              id={budgetCategory.id}>{budgetCategory.name}</div>
          </section>
          <section className={s.formRowSection}>
            <div>{`${budgetCategory.percentage_of_total}% (${formattedRowAmount(budgetCategory.amount)})`}</div>
          </section>
        </div>
        <AllocationInput
          name={budgetCategory.id}
          value={userSelectedBudgetValues[budgetCategory.id]}
          handler={handleBudgetValueInput}
          caption={generateCaption()}/>
      </div>
    );
  };

  if (Boolean(budgetCategory)) {
    return(
      <div>
        {getRowContent()}
        <div
          className={s.formRow}
          style={accordionOpen ? {} : {display: 'none'}}>
          <section
            className={s.accordionTextWrapper}
            dangerouslySetInnerHTML={{ __html: budgetCategory.descriptive_html }}/>
        </div>
      </div>
    );
  } else {
    return <div></div>
  }
}
