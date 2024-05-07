import { useAppDistpatch, useAppSelector } from '../../../store/store';
import style from './index.module.css';
import { setSelected } from '../../../store/stores/crafting/crafting';
import { useEffect } from 'react';
import updateRipples from '../../../utils/updateRipples';

interface Props {
  name: string;
  image: string;
  isFave: boolean;
  id: number;
  selected: boolean;
  type: string;
}

const Blueprint = (props: Props) => {
  const theme = useAppSelector((state) => state.config.theme);
  const dispatch = useAppDistpatch();

  useEffect(() => {
    updateRipples();
  });
  return (
    <div
      className={style.container + ' center-ripple'}
      style={{
        background: theme.main,
        border: `0.2vw solid ${props.selected ? theme.white : theme.border}`,
      }}
      id='ripple-animation'
      onClick={() => {
        dispatch(
          setSelected({
            id: props.id,
            type: props.type,
          })
        );
      }}>
      <img src={props.image} className={style.icon} />
      <h1
        className={style.text}
        style={{
          color: theme.blueprintGray,
        }}>
        {props.name}
      </h1>
    </div>
  );
};

export default Blueprint;
