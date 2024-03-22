import { configureStore } from '@reduxjs/toolkit';
import { useDispatch, useSelector, TypedUseSelectorHook } from 'react-redux';
import { configSlice } from './stores/config/config';
import { craftingSlice } from './stores/crafting/crafting';
import { uiSlice } from './stores/crafting/ui';
import { craftSlice } from './stores/crafting/craft';
import { queueSlice } from './stores/crafting/queue';
import { popupSlice } from './stores/popup/popup';

export const boilerplateStore = configureStore({
  reducer: {
    config: configSlice.reducer,
    crafting: craftingSlice.reducer,
    craft: craftSlice.reducer,
    queue: queueSlice.reducer,
    ui: uiSlice.reducer,
    popup: popupSlice.reducer,
  },
});

export const useAppDistpatch: () => typeof boilerplateStore.dispatch =
  useDispatch;
export const useAppSelector: TypedUseSelectorHook<
  ReturnType<typeof boilerplateStore.getState>
> = useSelector;
