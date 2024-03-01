import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import style from './index.module.css';
import { faClock, faHammer, faStar } from '@fortawesome/free-solid-svg-icons';
import { useAppSelector } from '../../store/store';
import Required from './Required';
import Queue from './Queue';
import Bottom from './Bottom';

const Info = () => {
  const theme = useAppSelector((state) => state.config.theme);
  const language = useAppSelector((state) => state.config.language);
  const items = useAppSelector((state) => state.crafting);
  const item = items.items[items.selectedItem];
  const queue = useAppSelector((state) => state.queue);
  return (
    <div
      className={style.container}
      style={{
        background: theme.main,
      }}>
      <div className={style.header}>
        <div
          className={style.fave}
          onClick={() => {
            console.log('onClick - set favourite');
          }}
          style={{
            background: theme.button,
            border: `0.2vw solid ${theme.border}`,
            color: theme.white,
          }}>
          <FontAwesomeIcon icon={faStar} className={style.star} />
        </div>
        <div
          className={style.imgHousing}
          style={{
            background: theme.main,
            border: `0.2vw solid ${theme.border}`,
          }}></div>
        <div
          className={style.textHousing}
          style={{
            color: theme.white,
          }}>
          <h1 className={style.heading}>{item.name}</h1>
          <h2 className={style.description}>{item.description}</h2>
          <div className={style.flex}>
            <FontAwesomeIcon
              icon={faClock}
              className={style.icon}
              style={{
                color: theme.green,
              }}
            />
            <p
              style={{
                color: theme.gray,
              }}
              className={style.smallText}>
              {language.craftTime}{' '}
              <span
                style={{
                  color: theme.green,
                }}>
                10{language.s}
              </span>
            </p>
          </div>
          <div className={style.flex}>
            <FontAwesomeIcon
              icon={faHammer}
              className={style.icon}
              style={{
                color: theme.blue,
              }}
            />
            <p
              style={{
                color: theme.gray,
              }}
              className={style.smallText}>
              {language.uses}{' '}
              <span
                style={{
                  color: theme.blue,
                }}>
                4
              </span>
            </p>
          </div>
          <div></div>
        </div>
      </div>
      <div className={style.middle}>
        <Required />
      </div>
      <div className={style.spacer}></div>
      <div
        className={style.queue}
        style={{
          background: theme.main,
          border: `0.2vw solid ${theme.border}`,
        }}>
        {queue.items.map((queueItem, index) => {
          const startTimer = index === queue.currentItem;
          return (
            <Queue
              key={index}
              image={queueItem.image}
              secondsLeft={queueItem.secondsLeft}
              timeStarted={queueItem.timeStarted}
              startTimer={startTimer}
            />
          );
        })}
        {/* <Queue />
        <Queue />
        <Queue />
        <Queue />
        <Queue />
        <Queue /> */}
      </div>
      <div className={style.bottom}>
        <Bottom />
      </div>
    </div>
  );
};

export default Info;
