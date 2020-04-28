import React, { useState, useEffect } from 'react';
import useFetch from '../useFetch';
import styled from 'styled-components';
import ProductImgWrap from './ProductImgWrap';
import ProductInfoWrap from './ProductInfoWrap';

const ModalWrap = styled.div`
  position: fixed;
  width: 100%;
  height: 100%;
  left: 0;
  right: 0;
  top: 0;
  &:after {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.5);
    content: "";
  }
`;

const Wrap = styled.div`
  display: flex;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 750px;
  margin: 0 auto;
  transform: translate(-50%, -50%);
  box-shadow: 2px 2px 5px rgba(0,0,0,0.5);
  background: #fff;
  padding: 20px;
  z-index: 9999;
`;

const CloseBtn = styled.button`
  position: absolute;
  top: 10px;
  right: 10px;
  width: 22px;
  height: 22px;
  text-indent: -9999px;
  color: #fff;
  font-size: 0px;
  line-height: 0px;
  cursor: pointer;
  &:before {
    position: absolute;
    left: 10px;
    top: 0;
    width: 2px;
    height: 100%;
    transform: rotate(-45deg);
    background: #999;
    content: "";
  }
  &:after {
    position: absolute;
    left: 10px;
    top: 0;
    width: 2px;
    height: 100%;
    transform: rotate(45deg);
    background: #999;
    content: "";
  }
`

const Modal = ({data, isShow}) => {
  const [detail, setDetail] = useState(null);
  const reqUrl = process.env.REACT_APP_DEFAULT;
  // const getDetailData = async () => {
  //   const response = await fetch(`${reqUrl}/${data.hash}`);
  //   const fetchData = await response.json();
  //   console.log(fetchData)
  //   setDetail(fetchData.contents.data);
  //   // setLoading(false);
  // }
  // useEffect(() => {
  //   getDetailData();
  // }, []);

  const loading = useFetch(setDetail, `${reqUrl}/${data.hash}`);
  const deliveryData = [
    {
      id: 'point',
      title: '적립금',
      info: detail && detail.point
    },
    {
      id: 'deliveryInfo',
      title: '배송정보',
      info: detail && detail.deliveryInfo
    },
    {
      id: 'deliveryFee',
      title: '배송비',
      info: detail && detail.deliveryFee
    }
  ];
  return (
    <ModalWrap>
      <Wrap>
        {detail && <ProductImgWrap
          topImage={detail.topImage}
          thumbImages={detail.thumbImages}
        />}
        {detail && <ProductInfoWrap
          title={data.title}
          description={detail.description}
          salePrice={detail.salePrice}
          deliveryData={deliveryData}
        />}
        
        <CloseBtn type="button" onClick={isShow}>close</CloseBtn>
      </Wrap>
    </ModalWrap>
  );
};

export default Modal;