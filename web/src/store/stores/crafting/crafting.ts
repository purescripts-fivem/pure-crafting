import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { craftingState } from '../../../types/crafting';

const initialState: craftingState = {
  items: [
    {
      itemName: 'assualtrifle',
      name: 'Assault Rifle',
      image:
        'https://media.discordapp.net/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66382cf6&is=6636db76&hm=b2f5b5059c7de1acc0ff0d75e00f4785035eb37795eacb7027ff1b8a8ec77ec3&=&format=webp&quality=lossless',
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
          image:
            'https://media.discordapp.net/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66382cf6&is=6636db76&hm=b2f5b5059c7de1acc0ff0d75e00f4785035eb37795eacb7027ff1b8a8ec77ec3&=&format=webp&quality=lossless',
        },
        {
          itemName: 'metal',
          name: 'Metal',
          amount: 2,
          myAmount: 1,
          image:
            'https://media.discordapp.net/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66382cf6&is=6636db76&hm=b2f5b5059c7de1acc0ff0d75e00f4785035eb37795eacb7027ff1b8a8ec77ec3&=&format=webp&quality=lossless',
        },
        {
          itemName: 'wood',
          name: 'Wood',
          amount: 2,
          myAmount: 4,
          image:
            'https://media.discordapp.net/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66382cf6&is=6636db76&hm=b2f5b5059c7de1acc0ff0d75e00f4785035eb37795eacb7027ff1b8a8ec77ec3&=&format=webp&quality=lossless',
        },
        {
          itemName: 'metal',
          name: 'Metal',
          amount: 2,
          myAmount: 1,
          image:
            'https://media.discordapp.net/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66382cf6&is=6636db76&hm=b2f5b5059c7de1acc0ff0d75e00f4785035eb37795eacb7027ff1b8a8ec77ec3&=&format=webp&quality=lossless',
        },
        {
          itemName: 'wood',
          name: 'Wood',
          amount: 2,
          myAmount: 4,
          image:
            'https://media.discordapp.net/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66382cf6&is=6636db76&hm=b2f5b5059c7de1acc0ff0d75e00f4785035eb37795eacb7027ff1b8a8ec77ec3&=&format=webp&quality=lossless',
        },
        {
          itemName: 'metal',
          name: 'Metal',
          amount: 2,
          myAmount: 1,
          image:
            'https://media.discordapp.net/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66382cf6&is=6636db76&hm=b2f5b5059c7de1acc0ff0d75e00f4785035eb37795eacb7027ff1b8a8ec77ec3&=&format=webp&quality=lossless',
        },
      ],
    },
    {
      itemName: 'assualtrifle',
      name: 'Blaze here',
      image:
        'https://media.discordapp.net/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66382cf6&is=6636db76&hm=b2f5b5059c7de1acc0ff0d75e00f4785035eb37795eacb7027ff1b8a8ec77ec3&=&format=webp&quality=lossless',
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
          image:
            'https://media.discordapp.net/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66382cf6&is=6636db76&hm=b2f5b5059c7de1acc0ff0d75e00f4785035eb37795eacb7027ff1b8a8ec77ec3&=&format=webp&quality=lossless',
        },
        {
          itemName: 'metal',
          name: 'Metal',
          amount: 2,
          myAmount: 1,
          image:
            'https://media.discordapp.net/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66382cf6&is=6636db76&hm=b2f5b5059c7de1acc0ff0d75e00f4785035eb37795eacb7027ff1b8a8ec77ec3&=&format=webp&quality=lossless',
        },
      ],
    },
  ],
  blueprints: [
    {
      itemName: 'assualtrifle',
      name: 'Blaze here',
      image:
        'https://media.discordapp.net/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66382cf6&is=6636db76&hm=b2f5b5059c7de1acc0ff0d75e00f4785035eb37795eacb7027ff1b8a8ec77ec3&=&format=webp&quality=lossless',
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
          image:
            'https://media.discordapp.net/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66382cf6&is=6636db76&hm=b2f5b5059c7de1acc0ff0d75e00f4785035eb37795eacb7027ff1b8a8ec77ec3&=&format=webp&quality=lossless',
        },
        {
          itemName: 'metal',
          name: 'Metal',
          amount: 2,
          myAmount: 1,
          image:
            'https://media.discordapp.net/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=66382cf6&is=6636db76&hm=b2f5b5059c7de1acc0ff0d75e00f4785035eb37795eacb7027ff1b8a8ec77ec3&=&format=webp&quality=lossless',
        },
      ],
    },
  ],
  selectedItem: 0,
  currentItem: null,
  amount: 1,
};

export const craftingSlice = createSlice({
  name: 'crafting',
  initialState,
  reducers: {
    setItems: (state, action: PayloadAction<any>) => {
      state.items = action.payload;
      // state.currentItem = null;
      // state.selectedItem = 0;
      if (!state.currentItem) return;
      if (state.currentItem.type !== 'item') {
        state.currentItem = null;
        state.selectedItem = 0;
      } else {
        for (let i = 0; i < state.items.length; i++) {
          if (state.currentItem && state.items[i].id == state.currentItem.id) {
            state.currentItem.requiredItems = state.items[i].requiredItems;
          }
        }
      }
    },
    setBlueprints: (state, action: PayloadAction<any>) => {
      state.blueprints = action.payload;
    },
    setSelected: (
      state,
      action: PayloadAction<{
        id: number;
        type: string;
      }>
    ) => {
      if (
        action.payload.type === 'item' ||
        action.payload.type === 'blueprint'
      ) {
        if (state.items.length === 0) return;
        state.selectedItem = action.payload.id;
        for (let i = 0; i < state.items.length; i++) {
          if (state.items[i].id === state.selectedItem) {
            state.currentItem = state.items[i];
            state.currentItem.type = action.payload.type;
            return;
          }
        }
        return;
      } else {
        if (state.blueprints.length === 0) return;
        state.selectedItem = action.payload.id;
        for (let i = 0; i < state.blueprints.length; i++) {
          if (state.blueprints[i].id === state.selectedItem) {
            state.currentItem = state.blueprints[i];
            state.currentItem.type = action.payload.type;
            return;
          }
        }
      }
    },
    setAmount: (state, action: PayloadAction<number>) => {
      state.amount = action.payload;
    },
  },
});

export default craftingSlice.reducer;
export const { setItems, setBlueprints, setSelected, setAmount } =
  craftingSlice.actions;
