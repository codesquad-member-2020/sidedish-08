import React, { useState, useEffect } from 'react';
import styled from 'styled-components';
import { gnbMenu } from '../../data/header/gnbData.js';
import List from './GnbList.js';

const GnbWrap = styled.div`
  width: 100%;
  height: 52px;
  background-color: #483f35;
  color: #fff;
`;

const Nav = styled.nav`
  width: 980px;
  height: 100%;
  margin: 0 auto;
`;

const GnbUl = styled.ul`
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 100%;
`;

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
