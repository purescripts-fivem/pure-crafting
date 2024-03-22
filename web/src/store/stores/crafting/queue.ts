import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { item, queue } from '../../../types/queue';
// import { sendNui } from '../../../utils/sendNui';

const initialState: queue = {
  finished: [
    {
      itemName: 'wood',
      image: 'https://i.imgur.com/MMsrX15.jpeg',
      secondsLeft: 20,
      timeStarted: 1709554540,
      timeToCraft: 20,
      id: 0,
    },
  ],
  items: [
    {
      itemName: 'wood',
      image: 'https://i.imgur.com/MMsrX15.jpeg',
      secondsLeft: 40,
      timeStarted: 1709554967,
      timeToCraft: 20,
      id: 0,
    },
    {
      itemName: 'wood',
      image: 'https://i.imgur.com/MMsrX15.jpeg',
      secondsLeft: 800,
      timeToCraft: 20,
      timeStarted: 1709554757,
      id: 0,
    },
  ],
};

export const queueSlice = createSlice({
  name: 'queue',
  initialState,
  reducers: {
    addItem: (state, action: PayloadAction<item>) => {
      state.items.push(action.payload);
      // sendNui('queueCraft', {
      //   item: action.payload,
      // });
    },
    setQueueItems: (state, action: PayloadAction<item[]>) => {
      state.items = action.payload;
    },
    setQueueFinishedItems: (state, action: PayloadAction<item[]>) => {
      state.finished = action.payload;
    },
    updateSecondsChange: (state, action: PayloadAction<number>) => {
      state.items[0].secondsLeft = action.payload;
    },
  },
});

export default queueSlice.reducer;
export const {
  addItem,
  setQueueItems,
  setQueueFinishedItems,
  updateSecondsChange,
} = queueSlice.actions;
