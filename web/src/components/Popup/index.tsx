import { useAppSelector } from '../../store/store';
// import { setInMenu } from '../../../store/stores/pages/pages';
import style from './index.module.css';

const ConfirmPopup = () => {
  const popup = useAppSelector((state) => state.popup);
  const theme = useAppSelector((state) => state.config.theme);
  const language = useAppSelector((state) => state.config.language);

  return (
    <div
      className={style.container}
      onClick={(e: any) => {
        if (!e.target || typeof e.target.className !== 'string') return;
        if (e.target.className.includes('container')) {
          popup.onCancel();
          // dispatch(setInMenu(false));
        }
      }}>
      <div
        className={style.popup}
        style={{
          background: theme.popup.background,
          border: `0.2vw solid ${theme.popup.border}`,
          color: theme.popup.text,
          backgroundImage: `url(./popup_bg.png)`,
        }}>
        <h1 className={style.text}>{popup.popupText}</h1>
        <div
          className={style.boxes}
          style={{
            color: theme.white,
          }}>
          <div
            className={style.button}
            onClick={() => {
              popup.onCancel();
              // dispatch(setInMenu(false));
            }}
            onMouseOver={(e) => {
              e.currentTarget.style.color = theme.popup.redText;
            }}
            onMouseOut={(e) => {
              e.currentTarget.style.color = theme.popup.redBorder;
            }}
            style={{
              background: theme.popup.redBackground,
              border: `0.25vw solid ${theme.popup.redBorder}`,
              color: theme.popup.redBorder,
            }}>
            {language.cancel}
          </div>
          <div
            className={style.button}
            onClick={() => {
              popup.onSubmit();
              // dispatch(setInMenu(false));
            }}
            onMouseOver={(e) => {
              e.currentTarget.style.color = theme.popup.greenText;
            }}
            onMouseOut={(e) => {
              e.currentTarget.style.color = theme.popup.greenBorder;
            }}
            style={{
              background: theme.popup.greenBackground,
              border: `0.25vw solid ${theme.popup.greenBorder}`,
              color: theme.popup.greenBorder,
            }}>
            {language.claim}
          </div>
        </div>
      </div>
    </div>
  );
};

export default ConfirmPopup;
