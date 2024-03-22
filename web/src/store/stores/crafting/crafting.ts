import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { craftingState } from '../../../types/crafting';

const initialState: craftingState = {
  items: [
    {
      itemName: 'assualtrifle',
      name: 'Assault Rifle',
      image: 'https://i.imgur.com/1Yz2x3j.png',
      category: 'fave',
      id: 0,
      description: 'A fuckin cool ar',
      craftingTime: 10,
      uses: 4,
      requiredItems: [
        {
          itemName: 'wood',
          name: 'Wood',
          amount: 2,
          myAmount: 4,
          image: 'https://i.imgur.com/1Yz2x3j.png',
        },
        {
          itemName: 'metal',
          name: 'Metal',
          amount: 2,
          myAmount: 1,
          image: 'https://i.imgur.com/1Yz2x3j.png',
        },
      ],
    },
    {
      itemName: 'assualtrifle',
      name: 'Assault Rifle2',
      image: 'https://i.imgur.com/1Yz2x3j.png',
      category: 'fave',
      id: 3,
      description: 'A fuckin cool ar',
      craftingTime: 10,
      uses: 4,
      requiredItems: [
        {
          itemName: 'wood',
          name: 'Wood',
          amount: 2,
          myAmount: 4,
          image: 'https://i.imgur.com/1Yz2x3j.png',
        },
        {
          itemName: 'metal',
          name: 'Metal',
          amount: 2,
          myAmount: 1,
          image: 'https://i.imgur.com/1Yz2x3j.png',
        },
      ],
    },
    // {
    //   name: 'Fries',
    //   image: 'https://i.imgur.com/1Yz2x3j.png',
    //   category: 'fave',
    //   id: 1,
    //   description: 'Just a cool description... put whatever you want you feel?',
    //   craftingTime: 10,
    //   uses: 4,
    // },
    // {
    //   name: '4oz Coke Bag',
    //   image: 'https://i.imgur.com/1Yz2x3j.png',
    //   category: 'burger',
    //   id: 2,
    //   description: 'A fuckin cool ar',
    //   craftingTime: 10,
    //   uses: 4,
    // },
    // {
    //   name: 'Coca-Cola',
    //   image: 'https://i.imgur.com/1Yz2x3j.png',
    //   category: 'burger',
    //   id: 3,
    //   description: 'A fuckin cool ar',
    //   craftingTime: 10,
    //   uses: 4,
    // },
    // {
    //   name: 'Hammer',
    //   image: 'https://i.imgur.com/1Yz2x3j.png',
    //   category: 'guns',
    //   id: 4,
    //   description: 'A fuckin cool ar',
    //   craftingTime: 10,
    //   uses: 4,
    // },
    // {
    //   name: 'Head',
    //   image: 'https://i.imgur.com/1Yz2x3j.png',
    //   category: 'burger',
    //   id: 5,
    //   description: 'A fuckin cool ar',
    //   craftingTime: 10,
    //   uses: 4,
    // },
  ],
  selectedItem: 0,
  currentItem: null,
};

export const craftingSlice = createSlice({
  name: 'crafting',
  initialState,
  reducers: {
    setItems: (state, action: PayloadAction<any>) => {
      state.items = action.payload;
      if (!state.currentItem) return;
      for (let i = 0; i < state.items.length; i++) {
        if (state.items[i].id == state.currentItem.id) {
          state.currentItem.requiredItems = state.items[i].requiredItems;
        }
      }
    },
    setSelected: (state, action: PayloadAction<number>) => {
      state.selectedItem = action.payload;
      for (let i = 0; i < state.items.length; i++) {
        if (state.items[i].id === state.selectedItem) {
          state.currentItem = state.items[i];
          return;
        }
      }
    },
  },
});

export default craftingSlice.reducer;
export const { setItems, setSelected } = craftingSlice.actions;
