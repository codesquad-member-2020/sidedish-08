import React, { useState, useEffect } from 'react';
import { gnbMenu } from '../../data/header/gnbData.js';
import List from './GnbList.js';

const Gnb = () => {
  return (
    <GnbWrap className="gnb">
      <Nav>
        <GnbUl>
          {gnbMenu.map((menu) => <List key={menu.key} menu={menu} />)}
        </GnbUl>
      </Nav>
    </GnbWrap>
  );
};

export default Gnb;
