import { useRef } from 'react';
import { useAppSelector } from '../../../store/store';
import Item from '../Item';
import style from './index.module.css';

interface Props {
  type: string;
}

const Required = (props: Props) => {
  const theme = useAppSelector((state) => state.config.theme);
  const language = useAppSelector((state) => state.config.language);
  const item = useAppSelector((state) => state.crafting.currentItem);
  const scrollRef = useRef<HTMLDivElement>(null);

  const handleWheel = (evt: any) => {
    const delta = evt.deltaY;
    if (scrollRef.current) {
      scrollRef.current.scrollLeft += delta;
    }
  };

  if (props.type === 'blaze') {
    return (
      <div
        className={style.container}
        style={{
          background: theme.button,
          border: `0.2vw solid ${theme.border}`,
        }}>
        <h1
          className={style.text2}
          style={{
            color: theme.white,
          }}>
          {language.unlockBP}
        </h1>
      </div>
    );
  }

  return (
    <div
      className={style.container}
      style={{
        background: theme.button,
        border: `0.2vw solid ${theme.border}`,
      }}>
      <h1
        className={style.text}
        style={{
          color: theme.white,
        }}>
        {language.required}
      </h1>
      <div className={style.housing} ref={scrollRef} onWheel={handleWheel}>
        {item &&
          item.requiredItems.length > 0 &&
          item.requiredItems.map((req, index) => {
            return (
              <Item
                key={index}
                amount={req.amount}
                myAmount={req.myAmount}
                name={req.name}
                image={req.image}
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
