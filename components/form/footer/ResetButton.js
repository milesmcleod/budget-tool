import styles from './ResetButton.module.scss';

export default function ResetButton({
    createDefaultBudgetValues,
    setBudgetValues
  }) {

  const handler = (e) => {
    e.preventDefault();
    setBudgetValues(createDefaultBudgetValues());
  }

  return (
    <button
      type={"button"}
      onClick={handler}
      className={styles.button}>{"Reset"}</button>
  );
};
