import { isEnvBrowser, getResourceName } from './misc';
import defaultConfig from '../../../config/themes.json';

export const getThemeVariables = async (): Promise<any> => {
  if (isEnvBrowser()) {
    console.log('Using default config');
    return defaultConfig;
  }

  const resourceName = getResourceName();
  const config = await fetch(
    `https://cfx-nui-${resourceName}/config/themes.json`
  ).then((res) => res.json());

  return config;
};
