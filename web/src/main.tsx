import React from 'react';
import ReactDOM from 'react-dom/client';
import { VisibilityProvider } from './providers/VisibilityProvider';
import { Provider } from 'react-redux';
import { boilerplateStore } from './store/store';
import App from './App';
import './style.css';

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <VisibilityProvider>
      <Provider store={boilerplateStore}>
        <App />
      </Provider>
    </VisibilityProvider>
  </React.StrictMode>
);
