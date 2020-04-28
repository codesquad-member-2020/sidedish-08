import React, { useState } from 'react';
import styled from 'styled-components';

const GnbList = styled.li`
  position: relative;
  height: 100%;
  &.active > a {
    background-color: #5f4f40;
    color: #17c2bd;
  }
  &.active > .depth {
    transform: scaleY(1);
  }
`;

const GnbListAnchor = styled.a`
  display: flex;
  height: 100%;
  align-items: center;
  justify-content: center;
  padding: 0 11px;
  transition: all 0.2s;
  font-size: 14px;
  font-weight: bold;
  &:hover{
    background-color: #5f4f40;
    color: #17c2bd;
  }
`;

const Depth = styled.div`
  position: absolute;
  width: 130px;
  transform: scaleY(0);
  transform-origin: top;
  left: 0;
  top: 100%;
  color: #555;
  background-color: #5f4f40;
  font-size: 14px;
  color: #fff;
  transition: transform 0.3s ease;
  z-index: 9999;
`;

const DepthAnchor = styled.a`
  line-height: 1.6;
  &:hover {
    color: #17c2bd;
    border-bottom: 1px solid #17c2bd;
  }
`;

const DepthList = styled.li`
  padding: 10px 15px;
`;

const List = (props) => {
  const menu = props.menu;
  const [isShow, setIsShow] = useState(false);
  const [depthMenu, setDepthMenu] = useState([]);

  const handleMouseEnter = () => {
    setIsShow(true);
    setDepthMenu([...menu.depth]);
  }

  return (
    <GnbList className={isShow? 'active' : ''}
      onMouseEnter={() => handleMouseEnter()}
      onMouseLeave={() => setIsShow(false)}
    >
      <GnbListAnchor href={menu.link}>
        {menu.value}
      </GnbListAnchor>
      <Depth className='depth'>
        <ul>
          {isShow && depthMenu.map((dep) => <DepthList key={dep.key}><DepthAnchor href={dep.link}>{dep.value}</DepthAnchor></DepthList>)}
        </ul>
      </Depth>
    </GnbList>
  );
};

export default List;
