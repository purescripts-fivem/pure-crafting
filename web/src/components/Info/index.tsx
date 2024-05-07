import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import style from './index.module.css';
import { faClock, faHammer, faStar } from '@fortawesome/free-solid-svg-icons';
import { useAppSelector } from '../../store/store';
import Required from './Required';
import Queue from './Queue';
import Bottom from './Bottom';
import { useEffect } from 'react';
import updateRipples from '../../utils/updateRipples';
import { sendNui } from '../../utils/sendNui';

const Info = () => {
  const theme = useAppSelector((state) => state.config.theme);
  const language = useAppSelector((state) => state.config.language);
  // const items = useAppSelector((state) => state.crafting);
  const item = useAppSelector((state) => state.crafting.currentItem);
  const queue = useAppSelector((state) => state.queue);

  useEffect(() => {
    updateRipples();
  });

  if (item && item.type === 'blaze') {
    return (
      <div
        className={style.container}
        style={{
          background: theme.main,
          border: `0.25vw solid ${theme.border}`,
        }}>
        <div className={style.header}>
          <div
            className={style.fave}
            id='ripple-animation'
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
              background: theme.button,
              border: `0.2vw solid ${theme.border}`,
            }}>
            {item && <img src={item.image} className={style.img} />}
          </div>
          <div
            className={style.textHousing}
            style={{
              color: theme.white,
            }}>
            <h1 className={style.heading}>
              {item ? item.name : language.noItemSelected}
            </h1>
            <h2 className={style.description}>
              {item ? item.description : language.noItemSelected}
            </h2>
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
                  {item ? item.craftingTime : 0}
                  {language.s}
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
                  1
                </span>
              </p>
            </div>
            <div></div>
          </div>
        </div>
        <div className={style.middle}>
          <Required type='blaze' />
        </div>
        <div className={style.spacer}></div>
        <div
          className={style.queue}
          style={{
            background: theme.button,
            border: `0.2vw solid ${theme.border}`,
          }}></div>
        <div className={style.bottom}>{/* <Bottom /> */}</div>
      </div>
    );
  }

  return (
    <div
      className={style.container}
      style={{
        background: theme.main,
        border: `0.25vw solid ${theme.border}`,
      }}>
      <div className={style.header}>
        <div
          className={style.fave}
          id='ripple-animation'
          onClick={() => {
            if (!item || item?.type !== 'item') {
              return;
            }
            sendNui('setFavourite', {
              itemName: item.itemName,
              category: item.category,
            });
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
            background: theme.button,
            border: `0.2vw solid ${theme.border}`,
          }}>
          {item && <img src={item.image} className={style.img} />}
        </div>
        <div
          className={style.textHousing}
          style={{
            color: theme.white,
          }}>
          <h1 className={style.heading}>
            {item ? item.name : language.noItemSelected}
          </h1>
          <h2 className={style.description}>
            {item ? item.description : language.noItemSelected}
          </h2>
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
                {item ? item.craftingTime : 0}
                {language.s}
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
                {item ? (item.uses ? item.uses : 0) : 0}
              </span>
            </p>
          </div>
          <div></div>
        </div>
      </div>
      <div className={style.middle}>
        <Required type='ignore' />
      </div>
      <div className={style.spacer}></div>
      <div
        className={style.queue}
        style={{
          background: theme.button,
          border: `0.2vw solid ${theme.border}`,
        }}>
        {queue.finished.length > 0 &&
          queue.finished.map((queueItem, index) => {
            return (
              <Queue
                key={index}
                image={queueItem.image}
                secondsLeft={queueItem.secondsLeft}
                timeStarted={queueItem.timeStarted}
                startTimer={false}
                finished={true}
                id={queueItem.id}
                index={index}
              />
            );
          })}
        {queue.items.length > 0 &&
          queue.items.map((queueItem, index) => {
            const startTimer = index === 0;
            return (
              <Queue
                key={index}
                image={queueItem.image}
                secondsLeft={queueItem.secondsLeft}
                timeStarted={queueItem.timeStarted}
                startTimer={startTimer}
                finished={false}
                id={queueItem.id}
                index={index}
              />
            );
          })}
      </div>
      <div className={style.bottom}>
        <Bottom />
      </div>
    </div>
  );
};

export default Info;
