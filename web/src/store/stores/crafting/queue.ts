import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { item, queue } from '../../../types/queue';
import { sendNui } from '../../../utils/sendNui';

const initialState: queue = {
  finished: [
    {
      itemName: 'wood',
      image: 'https://i.imgur.com/MMsrX15.jpeg',
      secondsLeft: 20,
      timeStarted: 1704505622,
    },
  ],
  items: [
    {
      itemName: 'wood',
      image: 'https://i.imgur.com/MMsrX15.jpeg',
      secondsLeft: 20,
      timeStarted: 1704505622,
    },
    {
      itemName: 'wood',
      image: 'https://i.imgur.com/MMsrX15.jpeg',
      secondsLeft: 800,
      timeStarted: 1704505622,
    },
  ],
  currentItem: 0,
};

export const queueSlice = createSlice({
  name: 'queue',
  initialState,
  reducers: {
    setCurrentItem: (state, action: PayloadAction<number>) => {
      state.currentItem = action.payload;
    },
    addItem: (state, action: PayloadAction<item>) => {
      state.items.push(action.payload);
      sendNui('queueCraft', {
        item: action.payload,
      });
    },
  },
});

export default queueSlice.reducer;
export const { setCurrentItem, addItem } = queueSlice.actions;
