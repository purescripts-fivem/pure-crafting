import { configureStore } from '@reduxjs/toolkit';
import { useDispatch, useSelector, TypedUseSelectorHook } from 'react-redux';
import { configSlice } from './stores/config/config';

export const boilerplateStore = configureStore({
  reducer: {
    config: configSlice.reducer,
  },
});

export const useAppDistpatch: () => typeof boilerplateStore.dispatch =
  useDispatch;
export const useAppSelector: TypedUseSelectorHook<
  ReturnType<typeof boilerplateStore.getState>
> = useSelector;
