import React, { Fragment } from 'react';
import HeaderMain from './components/header/HeaderMain';
import Carousel from './components/main/Carousel';
import GrobalStyle from './styles/globalStyles';

function App() {
  return (
    <Fragment>
      <GrobalStyle />
      <HeaderMain />
      <div className="main">
        <Carousel />
      </div>
    </Fragment>
  );
}

export default App;
