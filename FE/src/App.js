import React, { Fragment } from 'react';
import HeaderMain from './components/header/HeaderMain';
import MainWrap from './components/main/MainWrap';
import GrobalStyle from './styles/globalStyles';

function App() {
  return (
    <Fragment>
      <GrobalStyle />
      <HeaderMain />
      <MainWrap />
    </Fragment>
  );
}

export default App;
