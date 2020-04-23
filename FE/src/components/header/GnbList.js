import React, { useState } from 'react';

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
