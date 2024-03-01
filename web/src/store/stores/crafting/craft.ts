import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { craft } from '../../../types/craft';

const initialState: craft = {
  amount: 1,
};

export const craftSlice = createSlice({
  name: 'craft',
  initialState,
  reducers: {
    setAmount: (state, action: PayloadAction<number>) => {
      state.amount = action.payload;
    },
  },
});

export default craftSlice.reducer;
export const { setAmount } = craftSlice.actions;
