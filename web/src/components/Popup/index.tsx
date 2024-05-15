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
          // background: theme.popup.background,
          // background: 'radial-gradient(50% 50% at 50% 50%, rgba(67, 67, 67, 1) 0%, rgba(37, 37, 37, 1) 100%)',
          // border: `0.2vw solid ${theme.popup.border}`,
          color: theme.white,
          // backgroundImage: `url(./popup_bg.png)`,
        }}>
        <h1 className={style.text}>{popup.popupTitle}</h1>
        <h1 className={style.text2}>{popup.popupText}</h1>
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
            onMouseOver={(e) => {
              e.currentTarget.style.background = `radial-gradient(50% 50% at 50% 50%, #4ADF47 0%, #158d13 100%)`;
            }}
            onMouseOut={(e) => {
              e.currentTarget.style.background = `radial-gradient(60% 60% at 50% 50%, #4ADF47 0%, #169814 100%)`;
            }}
            style={{
              background:
                'radial-gradient(60% 60% at 50% 50%, #4ADF47 0%, #169814 100%)',
              border: `0.15vw solid rgba(70, 255, 78, 1)`,
              color: 'rgba(0, 253, 25, 1)',
            }}>
            {language.claim}
          </div>
          <div
            className={style.button}
            onClick={() => {
              popup.onCancel();
            }}
            onMouseOver={(e) => {
              e.currentTarget.style.background = `radial-gradient(50% 50% at 50% 50%, #DB3F3F 0%, #a51919 100%)`;
            }}
            onMouseOut={(e) => {
              e.currentTarget.style.background = `radial-gradient(60% 60% at 50% 50%, #DB3F3F 0%, #AA2020 100%)`;
            }}
            style={{
              background:
                'radial-gradient(60% 60% at 50% 50%, #DB3F3F 0%, #AA2020 100%)',
              border: `0.15vw solid rgba(234, 47, 47, 1)`,
              color: 'rgba(255, 61, 61, 1)',
            }}>
            {language.cancel}
          </div>
        </div>
      </div>
    </div>
  );
};

export default ConfirmPopup;
