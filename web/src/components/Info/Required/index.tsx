import { useAppSelector } from '../../../store/store';
import Item from '../Item';
import style from './index.module.css';

const Required = () => {
  const theme = useAppSelector((state) => state.config.theme);
  const language = useAppSelector((state) => state.config.language);
  const items = useAppSelector((state) => state.crafting);
  const item = items.items[items.selectedItem];
  return (
    <div
      className={style.container}
      style={{
        background: theme.main,
        border: `0.2vw solid ${theme.border}`,
      }}>
      <h1
        className={style.text}
        style={{
          color: theme.white,
        }}>
        {language.required}
      </h1>
      <div className={style.housing}>
        {item.requiredItems.map((req, index) => {
          return (
            <Item
              key={index}
              amount={req.amount}
              myAmount={req.myAmount}
              name={req.name}
            />
          );
        })}
        {/* <Item />
        <Item />
        <Item />
        <Item />
        <Item />
        <Item /> */}
      </div>
    </div>
  );
};

export default Required;
