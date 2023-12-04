import { isEnvBrowser } from './misc';
import { getResourceName } from './misc';

export const sendNui = (eventName: string, data?: any) => {
  if (isEnvBrowser()) return;
  const resourceName = getResourceName();
  const xhr = new XMLHttpRequest();
  xhr.open('POST', `https://${resourceName}/${eventName}`, true);
  xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
  xhr.send(JSON.stringify(data));
};
