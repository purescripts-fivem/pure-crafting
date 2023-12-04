export const isEnvBrowser = (): boolean => !(window as any).invokeNative;

export const getResourceName = (): string => {
  if (isEnvBrowser()) return 'clothing';
  return (window as any).GetParentResourceName();
};

export const noop = () => {};
