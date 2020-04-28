import React from 'react';
import Lnb from './Lnb';
import Gnb from './Gnb';
import styled from 'styled-components';

const HeaderMidWrap = styled.div`
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  max-width: 980px;
  height: 95px;
  margin: 0 auto;
`;

const H1 = styled.h1`
  width: 195px;
  height: 70px;
`;

const Anchor = styled.a`
  padding: 0 20px;
`;

const HeaderMain = () => {
  return (
    <header>
      <Lnb />
      <HeaderMidWrap>
        <H1>
          <a href="#none"><img src="/images/bmc-logo.png" alt="배민찬" /></a>
        </H1>
        <div>
          <Anchor href="#none">베스트</Anchor>
          <Anchor href="#none">이벤트</Anchor>
        </div>
      </HeaderMidWrap>
      <Gnb />
    </header>
  );
};

export default HeaderMain;