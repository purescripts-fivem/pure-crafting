import { createSlice, PayloadAction } from '@reduxjs/toolkit';

const initialState = {
  categories: [
    {
      icon: 'fa-star',
      category: 'fave',
    },
    {
      icon: 'fa-burger',
      category: 'burger',
    },
    {
      icon: 'fa-gun',
      category: 'guns',
    },
  ],
};

export const uiSlice = createSlice({
  name: 'ui',
  initialState,
  reducers: {
    setCategories: (state, action: PayloadAction<any>) => {
      state.categories = action.payload;
    },
  },
});

export default uiSlice.reducer;
export const { setCategories } = uiSlice.actions;
