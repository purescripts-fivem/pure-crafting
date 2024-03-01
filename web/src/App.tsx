import { useState, useMemo } from 'react';
import { getThemeVariables } from './utils/getThemeVariables';
import { useAppDistpatch } from './store/store';
import { fetchNui } from './utils/fetchNui';
import { setConfig, setLanguage, setTheme } from './store/stores/config/config';
import { debugData } from './utils/debugData';
import style from './index.module.css';
import Crafting from './components/Crafting';
import Info from './components/Info';

debugData([
  {
    action: 'setVisible',
    data: true,
  },
]);

const App = () => {
  const dispatch = useAppDistpatch();
  const [loaded, setLoaded] = useState(false);

  useMemo(() => {
    const asyncConfig = async () => {
      const themeVariables = await getThemeVariables();
      dispatch(setTheme(themeVariables));
      setLoaded(true);
      // updateRipples();
    };
    asyncConfig();

    fetchNui(
      'getConfig',
      {},
      {
        // config here for react
      }
    )
      .then((config) => {
        dispatch(setConfig(config));
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
      }
    )
      .then((language) => {
        dispatch(setLanguage(language));
      })
      .catch((err) => {
        console.log(err);
      });
  }, []);

  if (!loaded) return null;

  return (
    <>
      <div
        style={{
          backgroundImage: `url(./image.webp)`,
          zIndex: -1,
        }}
        className={style.container}></div>
      <div
        className={style.container}
        style={{
          marginTop: '1.75vh',
          marginLeft: '-  0.1vw',
        }}>
        <Crafting />
        <Info />
      </div>
    </>
  );
};

export default App;
