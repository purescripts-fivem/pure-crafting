import { configureStore } from '@reduxjs/toolkit';
import { useDispatch, useSelector, TypedUseSelectorHook } from 'react-redux';
import { configSlice } from './stores/config/config';
import { craftingSlice } from './stores/crafting/crafting';
import { uiSlice } from './stores/crafting/ui';
import { craftSlice } from './stores/crafting/craft';
import { queueSlice } from './stores/crafting/queue';

export const boilerplateStore = configureStore({
  reducer: {
    config: configSlice.reducer,
    crafting: craftingSlice.reducer,
    craft: craftSlice.reducer,
    queue: queueSlice.reducer,
    ui: uiSlice.reducer,
  },
});

export const useAppDistpatch: () => typeof boilerplateStore.dispatch =
  useDispatch;
export const useAppSelector: TypedUseSelectorHook<
  ReturnType<typeof boilerplateStore.getState>
> = useSelector;
