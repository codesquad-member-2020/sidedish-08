import React, { useState } from 'react';
import styled from 'styled-components';

const ImgWrap = styled.div`
  width: 40%;
  display: flex;
  justify-content: space-between;
  flex-direction: column;
`

const TopImage = styled.div`
  width: 100%;
`

const ThumbImage = styled.ul`
  width: 100%;
  margin-top: 10px;
  display: flex;
`

const ThumImageList = styled.li`
  width: 19.2%;
  margin-left: 1%;
  min-height: 50px;
  background: #eee;
  &:first-child {
    margin-left: 0;
  }
`

const ProductImgWrap = ({topImage, thumbImages}) => {
  const [topImgSrc, setTopImgSrc] = useState(topImage);
  const MIN_LIST_LENGTH = 5;
  const handleTopImage = (e) => {
    const src = e.target.src;
    if(!src) return;
    setTopImgSrc(src);
  }
  return (
    <ImgWrap>
      <TopImage>
        <img src={topImgSrc} />
      </TopImage>
      <ThumbImage>
        {Array.from(Array(MIN_LIST_LENGTH)).map((item, idx) => <ThumImageList key={idx} onMouseEnter={handleTopImage}><img src={thumbImages[idx]} /></ThumImageList>)}
      </ThumbImage>
    </ImgWrap>
  );
};

export default ProductImgWrap;