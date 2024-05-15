import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { useAppDistpatch, useAppSelector } from '../../../store/store';
import style from './index.module.css';
import { faStar } from '@fortawesome/free-solid-svg-icons';
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

const Item = (props: Props) => {
  const theme = useAppSelector((state) => state.config.theme);
  const config = useAppSelector((state) => state.config.config);
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
      {props.isFave && config.enableFavourites && (
        <FontAwesomeIcon
          icon={faStar}
          className={style.fave}
          style={{
            color: theme.white,
          }}
        />
      )}
      <img src={props.image} className={style.icon} />
      <h1
        className={style.text}
        style={{
          color: theme.white,
        }}>
        {props.name}
      </h1>
    </div>
  );
};

export default Item;
