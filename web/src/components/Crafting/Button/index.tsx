import { useAppSelector } from '../../../store/store';
import style from './index.module.css';
import '@fortawesome/fontawesome-free/css/all.min.css';

interface Props {
  onClick: () => void;
  icon: string;
}

const Button = (props: Props) => {
  const theme = useAppSelector((state) => state.config.theme);
  return (
    <div
      className={style.container}
      style={{
        background: theme.main,
        border: `0.2vw solid ${theme.border}`,
      }}
      onClick={() => {
        props.onClick();
      }}>
      <i
        className={`fa ${props.icon}` + ' ' + style.icon}
        style={{
          color: theme.white,
        }}></i>
    </div>
  );
};

export default Button;
