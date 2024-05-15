export const checkFave = (itemName: string, faves: any) => {
  return faves[itemName] ? true : false;
};
