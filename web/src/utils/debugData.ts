import { isEnvBrowser } from './misc';

interface DebugEvent<T = any> {
  action: string;
  data: T;
}

export const debugData = <P>(events: DebugEvent<P>[], timer = 1000): void => {
  if (import.meta.env.MODE === 'development' && isEnvBrowser()) {
    for (const event of events) {
      setTimeout(() => {
        window.dispatchEvent(
          new MessageEvent('message', {
            data: {
              action: event.action,
              data: event.data,
            },
          }),
        );
      }, timer);
    }
  }
};
