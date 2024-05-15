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
import { setBlueprints, setItems } from './store/stores/crafting/crafting';
import { setCategories, setFaves } from './store/stores/crafting/ui';
import updateRipples from './utils/updateRipples';
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
  const config = useAppSelector((state) => state.config.config);

  useMemo(() => {
    const asyncConfig = async () => {
      const themeVariables = await getThemeVariables();
      dispatch(setTheme(themeVariables));
      setLoaded(true);
      updateRipples();
    };
    asyncConfig();

    fetchNui(
      'getConfig',
      {},
      {
        items: [
          {
            itemName: 'assualtrifle',
            name: 'Assault Rifle',
            image:
              'https://cdn.discordapp.com/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66323e36&is=6630ecb6&hm=2ffdb3677fc28dbf9ebd1c3d402e44350e794f29564b5cb302077f37a797890e&',
            category: 'fave',
            id: 0,
            description: 'A fuckin cool ar',
            craftingTime: 10,
            requiredItems: [
              {
                itemName: 'wood',
                name: 'Wood',
                amount: 2,
                myAmount: 4,
                image:
                  'https://cdn.discordapp.com/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66323e36&is=6630ecb6&hm=2ffdb3677fc28dbf9ebd1c3d402e44350e794f29564b5cb302077f37a797890e&',
              },
              {
                itemName: 'metal',
                name: 'Metal',
                amount: 2,
                myAmount: 1,
                image:
                  'https://cdn.discordapp.com/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66323e36&is=6630ecb6&hm=2ffdb3677fc28dbf9ebd1c3d402e44350e794f29564b5cb302077f37a797890e&',
              },
            ],
          },
          {
            itemName: 'assualtrifle',
            name: 'Assault Rifle2',
            image:
              'https://cdn.discordapp.com/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66323e36&is=6630ecb6&hm=2ffdb3677fc28dbf9ebd1c3d402e44350e794f29564b5cb302077f37a797890e&',
            category: 'fave',
            id: 3,
            description: 'A fuckin cool ar',
            craftingTime: 10,
            requiredItems: [
              {
                itemName: 'wood',
                name: 'Wood',
                amount: 2,
                myAmount: 4,
                image:
                  'https://cdn.discordapp.com/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66323e36&is=6630ecb6&hm=2ffdb3677fc28dbf9ebd1c3d402e44350e794f29564b5cb302077f37a797890e&',
              },
              {
                itemName: 'metal',
                name: 'Metal',
                amount: 2,
                myAmount: 1,
                image:
                  'https://cdn.discordapp.com/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66323e36&is=6630ecb6&hm=2ffdb3677fc28dbf9ebd1c3d402e44350e794f29564b5cb302077f37a797890e&',
              },
            ],
          },
          {
            itemName: 'lockpick',
            name: 'Lockpick',
            type: 'blueprint',
            image:
              'https://cdn.discordapp.com/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66323e36&is=6630ecb6&hm=2ffdb3677fc28dbf9ebd1c3d402e44350e794f29564b5cb302077f37a797890e&',
            category: 'blueprints',
            id: 9999,
            description: 'Blueprint for a lockpick',
            craftingTime: 10,
            uses: 1,
            requiredItems: [
              {
                itemName: 'wood',
                name: 'Wood',
                amount: 2,
                myAmount: 4,
                image:
                  'https://cdn.discordapp.com/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66323e36&is=6630ecb6&hm=2ffdb3677fc28dbf9ebd1c3d402e44350e794f29564b5cb302077f37a797890e&',
              },
              {
                itemName: 'metal',
                name: 'Metal',
                amount: 2,
                myAmount: 1,
                image:
                  'https://cdn.discordapp.com/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66323e36&is=6630ecb6&hm=2ffdb3677fc28dbf9ebd1c3d402e44350e794f29564b5cb302077f37a797890e&',
              },
            ],
          },
          {
            itemName: 'assualtrifle',
            name: 'Assault Rifle2',
            image:
              'https://cdn.discordapp.com/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66323e36&is=6630ecb6&hm=2ffdb3677fc28dbf9ebd1c3d402e44350e794f29564b5cb302077f37a797890e&',
            category: 'fave',
            id: 3,
            description: 'A fuckin cool ar',
            craftingTime: 10,
            requiredItems: [
              {
                itemName: 'wood',
                name: 'Wood',
                amount: 2,
                myAmount: 4,
                image:
                  'https://cdn.discordapp.com/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66323e36&is=6630ecb6&hm=2ffdb3677fc28dbf9ebd1c3d402e44350e794f29564b5cb302077f37a797890e&',
              },
              {
                itemName: 'metal',
                name: 'Metal',
                amount: 2,
                myAmount: 1,
                image:
                  'https://cdn.discordapp.com/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66323e36&is=6630ecb6&hm=2ffdb3677fc28dbf9ebd1c3d402e44350e794f29564b5cb302077f37a797890e&',
              },
            ],
          },
          {
            itemName: 'lockpick',
            name: 'Lockpick',
            type: 'blueprint',
            image:
              'https://cdn.discordapp.com/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66323e36&is=6630ecb6&hm=2ffdb3677fc28dbf9ebd1c3d402e44350e794f29564b5cb302077f37a797890e&',
            category: 'blueprints',
            id: 9999,
            description: 'Blueprint for a lockpick',
            craftingTime: 10,
            uses: 1,
            requiredItems: [
              {
                itemName: 'wood',
                name: 'Wood',
                amount: 2,
                myAmount: 4,
                image:
                  'https://cdn.discordapp.com/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66323e36&is=6630ecb6&hm=2ffdb3677fc28dbf9ebd1c3d402e44350e794f29564b5cb302077f37a797890e&',
              },
              {
                itemName: 'metal',
                name: 'Metal',
                amount: 2,
                myAmount: 1,
                image:
                  'https://cdn.discordapp.com/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66323e36&is=6630ecb6&hm=2ffdb3677fc28dbf9ebd1c3d402e44350e794f29564b5cb302077f37a797890e&',
              },
            ],
          },
        ],
        categories: [
          {
            icon: 'fa-star',
            category: 'fave',
          },
          {
            icon: 'fa-pen-ruler',
            category: 'blueprints',
          },
        ],
        enableFavourites: true,
        unlimitedBlueprints: true,
      }
    )
      .then((config) => {
        dispatch(setConfig(config));
        dispatch(setCategories(config.categories));
        // dispatch(setItems(config.items));
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
        claim: 'CONFIRM',
        cancel: 'CANCEL',
        yes: 'Yes',
        no: 'No',
        claimCraft: 'Claim Craft',
        cancelCraft: 'Cancel Craft',
        areYouSure: 'Are you sure you want to do this?',
        noItemSelected: 'No item selected',
        required: 'Items Required:',
        unlockBP: 'Unlock Blueprint',
      }
    )
      .then((language) => {
        dispatch(setLanguage(language));
        setConfigLoaded(true);
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
    const test = {
      items: data,
      confg: config.unlimitedBlueprints,
    };
    dispatch(setItems(test));
  });

  useNuiEvent('blueprints', (data) => {
    if (data === '[]') {
      dispatch(setBlueprints([]));
      return;
    }
    dispatch(setBlueprints(data));
  });

  useNuiEvent('setFaves', (data) => {
    if (data === '[]') {
      dispatch(setFaves([]));
      return;
    }
    dispatch(setFaves(data));
  });

  if (!loaded) return null;
  if (!configLoaded) return null;

  return (
    <>
      <Suspense fallback={<div>Loading...</div>}>
        {popup.showPopup && <Popup />}
      </Suspense>
      <div className={style.container}>
        <Crafting />
        <Info />
      </div>
    </>
  );
};

export default App;
