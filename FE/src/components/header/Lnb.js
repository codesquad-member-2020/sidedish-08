import React from 'react';
import { topMenu } from '../../data/header/lnbData';

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
