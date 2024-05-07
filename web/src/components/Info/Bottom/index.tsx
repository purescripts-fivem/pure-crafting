import { useAppDistpatch, useAppSelector } from '../../../store/store';
import style from './index.module.css';
import { sendNui } from '../../../utils/sendNui';
import { useEffect } from 'react';
import updateRipples from '../../../utils/updateRipples';
import { setAmount } from '../../../store/stores/crafting/crafting';

const Bottom = () => {
  const theme = useAppSelector((state) => state.config.theme);
  const language = useAppSelector((state) => state.config.language);
  const number = useAppSelector((state) => state.crafting.amount);
  const currentItem = useAppSelector((state) => state.crafting.selectedItem);
  const item = useAppSelector((state) => state.crafting.currentItem);
  const dispatch = useAppDistpatch();

  const setNumber = (int: number) => {
    dispatch(setAmount(int));
  };

  const canCraft = () => {
    let canCraft = true;
    if (!item) {
      return false;
    }
    item.requiredItems.forEach((requiredItem) => {
      const hasEnough =
        requiredItem.myAmount - requiredItem.amount * number >= 0;
      if (!hasEnough) {
        canCraft = false;
      }
    });
    return canCraft;
  };

  const changeNumber = (int: number) => {
    if (int < 0) {
      if (number - 1 <= 0) {
        setNumber(1);
        return;
      }
      setNumber(number - 1);
      return;
    }
    setNumber(number + 1);
  };

  useEffect(() => {
    updateRipples();
  });

  return (
    <>
      <div className={style.buttonHousing}>
        <div
          className={style.button}
          id='ripple-animation'
          onClick={() => {
            if (item && item.type === 'blueprint') {
              return;
            }
            changeNumber(-1);
          }}
          style={{
            background: theme.button,
            border: `0.2vw solid ${theme.border}`,
            borderRight: 'none',
            color: theme.white,
          }}>
          <p className={style.buttonText}>-</p>
        </div>
        <input
          type='number'
          value={number}
          onChange={(e) => {
            if (item && item.type === 'blueprint') {
              return;
            }
            setNumber(parseInt(e.target.value));
          }}
          className={style.input}
          style={{
            background: theme.main,
            border: `0.2vw solid ${theme.border}`,
            color: theme.white,
          }}
        />
        <div
          className={style.button}
          id='ripple-animation'
          onClick={() => {
            if (item && item.type === 'blueprint') {
              return;
            }
            changeNumber(1);
          }}
          style={{
            background: theme.button,
            border: `0.2vw solid ${theme.border}`,
            borderLeft: 'none',
            color: theme.white,
          }}>
          <p className={style.buttonText}>+</p>
        </div>
      </div>
      <div
        className={style.craftButton}
        id='ripple-animation'
        onClick={() => {
          if (!item) {
            return;
          }
          const craftingSuccess = canCraft();
          if (!craftingSuccess) {
            sendNui('notEnoughItems', {});
            return;
          }
          sendNui('attemptCraft', {
            amount: number,
            currentItem: currentItem,
            item: item,
          });
        }}
        style={{
          background: theme.button,
          border: `0.2vw solid ${theme.border}`,
          color: theme.white,
        }}>
        {language.craft}
      </div>
    </>
  );
};

export default Bottom;
