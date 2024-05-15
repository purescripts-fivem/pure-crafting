import { useState } from 'react';
import { useAppDistpatch, useAppSelector } from '../../../store/store';
import style from './index.module.css';
import { sendNui } from '../../../utils/sendNui';
import { hidePopup, setPopup } from '../../../store/stores/popup/popup';

interface Props {
  image: string;
  secondsLeft: number;
  timeStarted: number;
  startTimer: boolean;
  finished: boolean;
  id: number;
  index: number;
}

const Queue = (props: Props) => {
  const theme = useAppSelector((state) => state.config.theme);
  const language = useAppSelector((state) => state.config.language);
  const [hovering, setHovering] = useState(false);
  const dispatch = useAppDistpatch();

  if (props.finished) {
    return (
      <div
        className={style.container}
        onClick={() => {
          dispatch(
            setPopup({
              showPopup: true,
              popupTitle: language.claimCraft,
              popupText: language.areYouSure,
              onSubmit: () => {
                sendNui('claimCraft', {
                  id: props.id,
                  index: props.index,
                });
                dispatch(hidePopup());
              },
              onCancel: () => {
                dispatch(hidePopup());
              },
            })
          );
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
        dispatch(
          setPopup({
            showPopup: true,
            popupTitle: language.cancelCraft,
            popupText: language.areYouSure,
            onSubmit: () => {
              sendNui('cancelCraft', {
                id: props.id,
                index: props.index,
              });
              dispatch(hidePopup());
            },
            onCancel: () => {
              dispatch(hidePopup());
            },
          })
        );
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
        {hovering ? language.cancel : props.secondsLeft + language.s}
      </h1>
    </div>
  );
};

export default Queue;
