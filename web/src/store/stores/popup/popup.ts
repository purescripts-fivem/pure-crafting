import { createSlice, PayloadAction } from '@reduxjs/toolkit';

export interface popupState {
  showPopup: boolean;
  popupTitle: string;
  popupText: string;
  onSubmit: () => void;
  onCancel: () => void;
}

const initialState: popupState = {
  showPopup: false,
  popupTitle: '',
  popupText: '',
  onSubmit: () => {
    console.log('onSubmit');
  },
  onCancel: () => {
    console.log('onCancel');
  },
};

export const popupSlice = createSlice({
  name: 'popup',
  initialState,
  reducers: {
    setPopup: (state, action: PayloadAction<popupState>) => {
      state.showPopup = action.payload.showPopup;
      state.popupTitle = action.payload.popupTitle;
      state.popupText = action.payload.popupText;
      state.onSubmit = action.payload.onSubmit;
      state.onCancel = action.payload.onCancel;
    },
    hidePopup: (state) => {
      state.showPopup = false;
    },
    changeText: (state, action: PayloadAction<string>) => {
      state.popupText = action.payload;
    },
  },
});

export default popupSlice.reducer;
export const { setPopup, hidePopup, changeText } = popupSlice.actions;
