import React from 'react';
import { topMenu } from '../../data/header/lnbData';
import styled from 'styled-components';

const LnbWrap = styled.div`
  width: 100%;
  height: 40px;
  border-bottom: 1px solid #ddd;
`;

const LnbBox = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  max-width: 980px;
  height: 100%;
  margin: 0 auto;
  font-size: 12px;
  color: #444;
`;

const LnbUl = styled.ul`
  display: flex;
  height: 100%;
`;

const LnbLi = styled.li`
  height: 100%;
  position: relative;
  &:after {
    position: absolute;
    height: 30%;
    top: 50%;
    transform: translate(-50%, -50%);
    border-left: 1px solid #ccc;
    content:"";
  }
  &:first-child {
    font-weight: bold;
  }
  &:first-child:after {
    display: none;
  }
`

const LnbA = styled.a`
  display: flex;
  align-items: center;
  height: 100%;
  padding: 0 10px;
  &:hover {
    color: #17c2bd;
  }
`;

const Lnb = () => {
  const lnbMenu = topMenu.map((menu) => <LnbLi key={menu.key}><LnbA href={menu.link}>{menu.value}</LnbA></LnbLi>);
  return (
    <LnbWrap className="lnb">
      <LnbBox>
        <LnbA href="#none">배민찬 앱 다운로드 </LnbA>
        <LnbUl>{lnbMenu}</LnbUl>
      </LnbBox>
    </LnbWrap>
  );
};


export default Lnb;
