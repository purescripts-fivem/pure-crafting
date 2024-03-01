import { useEffect, useState } from 'react';
import { useAppSelector } from '../../../store/store';
import style from './index.module.css';

interface Props {
  image: string;
  secondsLeft: number;
  timeStarted: number;
  startTimer: boolean;
}

const Queue = (props: Props) => {
  const theme = useAppSelector((state) => state.config.theme);
  const language = useAppSelector((state) => state.config.language);
  const [timeLeft, setTimeLeft] = useState(props.secondsLeft);
  const [hovering, setHovering] = useState(false);
  const usedTime = props.timeStarted + props.secondsLeft;
  const currentTime = Math.floor(Date.now() / 1000);
  const displayTime = usedTime - currentTime;
  const canUse = displayTime <= 0 ? true : false;

  useEffect(() => {
    if (canUse) return;
    if (!props.startTimer) return;
    const interval = setInterval(() => {
      setTimeLeft(displayTime);
    }, 1000);
    return () => clearInterval(interval);
  }, [displayTime]);

  if (canUse) {
    return (
      <div
        className={style.container}
        onClick={() => {
          console.log('onClick - claim');
        }}
        style={{
          background: theme.greenFaded,
          border: `0.2vw solid ${theme.border}`,
        }}>
        <img src={props.image} className={style.img} />
        <h1
          className={style.text}
          style={{
            color: theme.white,
          }}>
          {language.claim}
        </h1>
      </div>
    );
  }

  return (
    <div
      className={style.container}
      onClick={() => {
        console.log('onClick - cancel queue or claim');
        // TODO: make a confirm cancel
      }}
      onMouseOver={() => {
        setHovering(true);
      }}
      onMouseLeave={() => {
        setHovering(false);
      }}
      style={{
        background: hovering ? theme.redFaded : theme.main,
        border: `0.2vw solid ${theme.border}`,
      }}>
      <img src={props.image} className={style.img} />
      <h1
        className={style.text}
        style={{
          color: theme.white,
        }}>
        {hovering ? language.s : timeLeft + language.s}
      </h1>
    </div>
  );
};

export default Queue;
