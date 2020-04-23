import React from 'react';
import Lnb from './Lnb';
import Gnb from './Gnb';

const HeaderMain = () => {
  return (
    <header>
      <Lnb />
      <HeaderMidWrap>
        <H1>
          <a href="#none"><img src="/images/bmc-logo.png" alt="배민찬" /></a>
        </H1>
        <div>
          <Anchor href="#none">베스트 반찬</Anchor>
          <Anchor href="#none">알뜰 쇼핑</Anchor>
        </div>
      </HeaderMidWrap>
      <Gnb />
    </header>
  );
};

export default HeaderMain;