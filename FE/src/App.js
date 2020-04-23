import React, { Fragment } from 'react';
import HeaderMain from './components/header/HeaderMain';
import Carousel from './components/main/Carousel';

function App() {
  return (
    <Fragment>
      <GrobalStyle />
      <HeaderMain />
      <div className="main">
        <Carousel />
        <Carousel />
        <Carousel />
      </div>
    </Fragment>
  );
}

export default App;
