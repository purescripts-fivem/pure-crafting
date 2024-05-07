import { useAppSelector } from '../../../store/store';
import style from './index.module.css';

interface Props {
  amount: number;
  myAmount: number;
  name: string;
  image: string;
}

const Item = (props: Props) => {
  const theme = useAppSelector((state) => state.config.theme);
  const number = useAppSelector((state) => state.crafting.amount);
  const hasEnough = props.myAmount - props.amount * number >= 0;
  return (
    <div className={style.container}>
      <div
        className={style.housing}
        style={{
          background: hasEnough ? theme.greenFaded : theme.redFaded,
          border: `0.2vw solid ${theme.border}`,
        }}>
        <img src={props.image} className={style.img} />
        <p
          className={style.imgText}
          style={{
            color: hasEnough ? theme.green : theme.red,
          }}>
          {props.myAmount}/{props.amount * number}
        </p>
      </div>
      <h1
        className={style.text}
        style={{
          color: hasEnough ? theme.green : theme.red,
        }}>
        {props.name}
      </h1>
    </div>
  );
};

export default Item;
