import { useAppSelector } from '../../store/store';
import style from './index.module.css';

const Popup = () => {
  const theme = useAppSelector((state) => state.config.theme);
  const language = useAppSelector((state) => state.config.language);
  const popup = useAppSelector((state) => state.popup);
  return (
    <div className={style.container}>
      <div
        className={style.popup}
        style={{
          background: theme.popupBackground,
          color: theme.popupText,
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
              popup.onSubmit();
            }}
            style={{
              background: theme.green,
            }}>
            {language.yes}
          </div>
          <div
            className={style.button}
            onClick={() => {
              popup.onCancel();
            }}
            style={{
              background: theme.red,
            }}>
            {language.no}
          </div>
        </div>
      </div>
    </div>
  );
};

export default Popup;
