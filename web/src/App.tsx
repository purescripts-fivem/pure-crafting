import { useState, useMemo } from 'react';
import { getThemeVariables } from './utils/getThemeVariables';
import { useAppDistpatch } from './store/store';
import { fetchNui } from './utils/fetchNui';
import { setConfig, setLanguage, setTheme } from './store/stores/config/config';
import { debugData } from './utils/debugData';

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
        select: 'lnaguage here lloyd',
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
      <div>React Boilerplate baby</div>
      <div>purescripts On Top</div>
    </>
  );
};

export default App;
