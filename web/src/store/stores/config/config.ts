import { createSlice, PayloadAction } from '@reduxjs/toolkit';

export interface configState {
  config: any;
  language: any;
  theme: any;
}

const initialState: configState = {
  config: [],
  language: [],
  theme: [],
};

export const configSlice = createSlice({
  name: 'config',
  initialState,
  reducers: {
    setConfig: (state, action: PayloadAction<any>) => {
      state.config = action.payload;
    },
    setLanguage: (state, action: PayloadAction<any>) => {
      state.language = action.payload;
    },
    setTheme: (state, action: PayloadAction<any>) => {
      state.theme = action.payload;
    },
  },
});

export default configSlice.reducer;
export const { setConfig, setLanguage, setTheme } = configSlice.actions;
