import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { craftingState } from '../../../types/crafting';

const initialState: craftingState = {
  items: [
    {
      itemName: 'assualtrifle',
      name: 'Assault Rifle',
      image:
        'https://cdn.discordapp.com/attachments/789185814768386088/1238084690112544851/duffelbag.png?ex=663dffb8&is=663cae38&hm=45e7bb2338c6f18a784c5e154cbb35f89676f59431b86648ec5471095563a8cc&',
      category: 'fave',
      id: 0,
      description: 'A fuckin cool ar',
      craftingTime: 10,
      requiredItems: [
        {
          itemName: 'wood',
          name: 'Wood',
          amount: 2,
          myAmount: 4,
          image:
            'https://cdn.discordapp.com/attachments/789185814768386088/1238084690112544851/duffelbag.png?ex=663dffb8&is=663cae38&hm=45e7bb2338c6f18a784c5e154cbb35f89676f59431b86648ec5471095563a8cc&',
        },
        {
          itemName: 'metal',
          name: 'Metal',
          amount: 2,
          myAmount: 1,
          image:
            'https://cdn.discordapp.com/attachments/789185814768386088/1238084690112544851/duffelbag.png?ex=663dffb8&is=663cae38&hm=45e7bb2338c6f18a784c5e154cbb35f89676f59431b86648ec5471095563a8cc&',
        },
      ],
    },
    {
      itemName: 'assualtrifle',
      name: 'Assault Rifle2',
      image:
        'https://cdn.discordapp.com/attachments/789185814768386088/1238084690112544851/duffelbag.png?ex=663dffb8&is=663cae38&hm=45e7bb2338c6f18a784c5e154cbb35f89676f59431b86648ec5471095563a8cc&',
      category: 'fave',
      id: 3,
      description: 'A fuckin cool ar',
      craftingTime: 10,
      requiredItems: [
        {
          itemName: 'wood',
          name: 'Wood',
          amount: 2,
          myAmount: 4,
          image:
            'https://cdn.discordapp.com/attachments/789185814768386088/1238084690112544851/duffelbag.png?ex=663dffb8&is=663cae38&hm=45e7bb2338c6f18a784c5e154cbb35f89676f59431b86648ec5471095563a8cc&',
        },
        {
          itemName: 'metal',
          name: 'Metal',
          amount: 2,
          myAmount: 1,
          image:
            'https://cdn.discordapp.com/attachments/789185814768386088/1238084690112544851/duffelbag.png?ex=663dffb8&is=663cae38&hm=45e7bb2338c6f18a784c5e154cbb35f89676f59431b86648ec5471095563a8cc&',
        },
      ],
    },
    {
      itemName: 'lockpick',
      name: 'Lockpick',
      type: 'blueprint',
      image:
        'https://cdn.discordapp.com/attachments/789185814768386088/1238084690112544851/duffelbag.png?ex=663dffb8&is=663cae38&hm=45e7bb2338c6f18a784c5e154cbb35f89676f59431b86648ec5471095563a8cc&',
      category: 'blueprints',
      id: 9999,
      description: 'Blueprint for a lockpick',
      craftingTime: 10,
      uses: 1,
      requiredItems: [
        {
          itemName: 'wood',
          name: 'Wood',
          amount: 2,
          myAmount: 4,
          image:
            'https://cdn.discordapp.com/attachments/789185814768386088/1238084690112544851/duffelbag.png?ex=663dffb8&is=663cae38&hm=45e7bb2338c6f18a784c5e154cbb35f89676f59431b86648ec5471095563a8cc&',
        },
        {
          itemName: 'metal',
          name: 'Metal',
          amount: 2,
          myAmount: 1,
          image:
            'https://cdn.discordapp.com/attachments/789185814768386088/1238084690112544851/duffelbag.png?ex=663dffb8&is=663cae38&hm=45e7bb2338c6f18a784c5e154cbb35f89676f59431b86648ec5471095563a8cc&',
        },
      ],
    },
    {
      itemName: 'lockpick',
      name: 'Lockpick',
      type: 'blueprint',
      image:
        'https://cdn.discordapp.com/attachments/789185814768386088/1238084690112544851/duffelbag.png?ex=663dffb8&is=663cae38&hm=45e7bb2338c6f18a784c5e154cbb35f89676f59431b86648ec5471095563a8cc&',
      category: 'blueprints',
      id: 9999,
      description: 'Blueprint for a lockpick',
      craftingTime: 10,
      uses: 1,
      requiredItems: [
        {
          itemName: 'wood',
          name: 'Wood',
          amount: 2,
          myAmount: 4,
          image:
            'https://cdn.discordapp.com/attachments/789185814768386088/1238084690112544851/duffelbag.png?ex=663dffb8&is=663cae38&hm=45e7bb2338c6f18a784c5e154cbb35f89676f59431b86648ec5471095563a8cc&',
        },
        {
          itemName: 'metal',
          name: 'Metal',
          amount: 2,
          myAmount: 1,
          image:
            'https://cdn.discordapp.com/attachments/789185814768386088/1238084690112544851/duffelbag.png?ex=663dffb8&is=663cae38&hm=45e7bb2338c6f18a784c5e154cbb35f89676f59431b86648ec5471095563a8cc&',
        },
      ],
    },
    {
      itemName: 'lockpick',
      name: 'Lockpick',
      type: 'blueprint',
      image:
        'https://cdn.discordapp.com/attachments/789185814768386088/1238084690112544851/duffelbag.png?ex=663dffb8&is=663cae38&hm=45e7bb2338c6f18a784c5e154cbb35f89676f59431b86648ec5471095563a8cc&',
      category: 'blueprints',
      id: 9999,
      description: 'Blueprint for a lockpick',
      craftingTime: 10,
      uses: 1,
      requiredItems: [
        {
          itemName: 'wood',
          name: 'Wood',
          amount: 2,
          myAmount: 4,
          image:
            'https://cdn.discordapp.com/attachments/789185814768386088/1238084690112544851/duffelbag.png?ex=663dffb8&is=663cae38&hm=45e7bb2338c6f18a784c5e154cbb35f89676f59431b86648ec5471095563a8cc&',
        },
        {
          itemName: 'metal',
          name: 'Metal',
          amount: 2,
          myAmount: 1,
          image:
            'https://cdn.discordapp.com/attachments/789185814768386088/1238084690112544851/duffelbag.png?ex=663dffb8&is=663cae38&hm=45e7bb2338c6f18a784c5e154cbb35f89676f59431b86648ec5471095563a8cc&',
        },
      ],
    },
  ],
  blueprints: [
    {
      itemName: 'assualtrifle',
      name: 'Assault Rifle Blueprint',
      image:
        'https://cdn.discordapp.com/attachments/789185814768386088/1238084689542123620/boogieboard.png?ex=663dffb8&is=663cae38&hm=fec9895177f964704e67814fd948d9ed336a62f6f3f1366ff326c7741544bd88&',
      category: 'blueprints',
      id: 35,
      description: 'Assault Rifle Blueprint',
      craftingTime: 10,
      uses: 1,
      requiredItems: [
        {
          itemName: 'wood',
          name: 'Wood',
          amount: 2,
          myAmount: 4,
          image:
            'https://cdn.discordapp.com/attachments/789185814768386088/1238084689542123620/boogieboard.png?ex=663dffb8&is=663cae38&hm=fec9895177f964704e67814fd948d9ed336a62f6f3f1366ff326c7741544bd88&',
        },
        {
          itemName: 'metal',
          name: 'Metal',
          amount: 2,
          myAmount: 1,
          image:
            'https://cdn.discordapp.com/attachments/789185814768386088/1238084689542123620/boogieboard.png?ex=663dffb8&is=663cae38&hm=fec9895177f964704e67814fd948d9ed336a62f6f3f1366ff326c7741544bd88&',
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
      state.items = action.payload.items;
      // state.currentItem = null;
      // state.selectedItem = 0;
      if (!state.currentItem) return;
      if (state.currentItem.type !== 'item' && !action.payload.confg) {
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
