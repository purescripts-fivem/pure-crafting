import { useState, useMemo, Suspense, lazy } from 'react';
import { getThemeVariables } from './utils/getThemeVariables';
import { useAppDistpatch, useAppSelector } from './store/store';
import { fetchNui } from './utils/fetchNui';
import { setConfig, setLanguage, setTheme } from './store/stores/config/config';
import { debugData } from './utils/debugData';
import style from './index.module.css';
import Crafting from './components/Crafting';
import Info from './components/Info';
import { useNuiEvent } from './hooks/useNuiEvent';
import {
  addItem,
  setQueueFinishedItems,
  setQueueItems,
  updateSecondsChange,
} from './store/stores/crafting/queue';
import { setItems } from './store/stores/crafting/crafting';
import { setCategories } from './store/stores/crafting/ui';
const Popup = lazy(() => import('./components/Popup'));

debugData([
  {
    action: 'setVisible',
    data: true,
  },
]);

const App = () => {
  const dispatch = useAppDistpatch();
  const [loaded, setLoaded] = useState(false);
  const [configLoaded, setConfigLoaded] = useState(false);
  const popup = useAppSelector((state) => state.popup);

  useMemo(() => {
    const asyncConfig = async () => {
      const themeVariables = await getThemeVariables();
      dispatch(setTheme(themeVariables));
      setLoaded(true);
      // updateRipples();
    };
    asyncConfig();

    fetchNui('getSettings', {}).then((settings) => {
      dispatch(setCategories(settings.categories));
      dispatch(setItems(settings.items));
    });

    fetchNui(
      'getConfig',
      {},
      {
        // config here for react
      }
    )
      .then((config) => {
        dispatch(setConfig(config));
        setConfigLoaded(true);
      })
      .catch((err) => {
        console.log(err);
      });

    fetchNui(
      'getLanguage',
      {},
      {
        craft: 'Craft',
        language: 'Items Required:',
        craftTime: 'Crafting Time:',
        s: 's',
        uses: 'Uses:',
        claim: 'Claim',
        cancel: 'Cancel',
        yes: 'Yes',
        no: 'No',
        cancelCraftPopup: 'Are you sure you want to cancel this craft?',
        claimCraftPopup: 'Are you sure you want to claim this craft?',
        noItemSelected: 'No item selected',
      }
    )
      .then((language) => {
        dispatch(setLanguage(language));
      })
      .catch((err) => {
        console.log(err);
      });
  }, []);

  useNuiEvent('addToQueue', (data) => {
    dispatch(addItem(data));
  });

  useNuiEvent('updateItems', (data) => {
    if (data === '[]') {
      dispatch(setQueueItems([]));
      return;
    }
    dispatch(setQueueItems(data));
  });

  useNuiEvent('updateFinished', (data) => {
    if (data === '[]') {
      dispatch(setQueueFinishedItems([]));
      return;
    }
    dispatch(setQueueFinishedItems(data));
  });

  useNuiEvent('secondsChange', (data) => {
    dispatch(updateSecondsChange(data));
  });

  useNuiEvent('itemsChange', (data) => {
    dispatch(setItems(data));
  });

  if (!loaded) return null;
  if (!configLoaded) return null;

  return (
    <>
      {/* <div
        style={{
          backgroundImage: `url(./image.webp)`,
          zIndex: -1,
        }}
        className={style.container}></div> */}
      <Suspense fallback={<div>Loading...</div>}>
        {popup.showPopup && <Popup />}
      </Suspense>
      <div
        className={style.container}
        style={
          {
            // marginTop: '1.75vh',
            // marginLeft: '-  0.1vw',
          }
        }>
        <Crafting />
        <Info />
      </div>
    </>
  );
};

export default App;
