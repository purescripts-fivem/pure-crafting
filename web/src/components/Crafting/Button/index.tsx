import { useEffect } from 'react';
import { useAppSelector } from '../../../store/store';
import style from './index.module.css';
import '@fortawesome/fontawesome-free/css/all.min.css';
import updateRipples from '../../../utils/updateRipples';

interface Props {
  onClick: () => void;
  icon: string;
}

const Button = (props: Props) => {
  const theme = useAppSelector((state) => state.config.theme);

  useEffect(() => {
    updateRipples();
  });
  return (
    <div
      className={style.container}
      style={{
        background: theme.main,
        border: `0.2vw solid ${theme.border}`,
      }}
      onClick={() => {
        props.onClick();
      }}
      id='ripple-animation'>
      <i
        className={`fa ${props.icon}` + ' ' + style.icon}
        style={{
          color: theme.white,
        }}></i>
    </div>
  );
};

export default Button;
