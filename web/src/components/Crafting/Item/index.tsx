import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { useAppDistpatch, useAppSelector } from '../../../store/store';
import style from './index.module.css';
import { faStar } from '@fortawesome/free-solid-svg-icons';
import { setSelected } from '../../../store/stores/crafting/crafting';

interface Props {
  name: string;
  image: string;
  isFave: boolean;
  id: number;
}

const Item = (props: Props) => {
  const theme = useAppSelector((state) => state.config.theme);
  const dispatch = useAppDistpatch();
  return (
    <div
      className={style.container}
      style={{
        background: theme.main,
        border: `0.2vw solid ${theme.border}`,
      }}
      onClick={() => {
        dispatch(setSelected(props.id));
      }}>
      {props.isFave && (
        <FontAwesomeIcon
          icon={faStar}
          className={style.fave}
          style={{
            color: theme.white,
          }}
        />
      )}
      <img src={`url(${props.image})`} className={style.icon} />
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
