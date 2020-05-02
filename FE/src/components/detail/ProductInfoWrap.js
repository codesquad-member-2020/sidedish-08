import React, { Fragment, useState } from 'react';
import styled from 'styled-components';
import Amount from './Amount';

const Wrap = styled.div`
  width: 55%;
  margin-left: 5%;
`
const Title = styled.strong`
  display: block;
  font-size: 18px;
  font-weight: bold;
`

const Description = styled.p`
  font-size: 13px;
  color: #222;
  margin: 10px 0 15px;
`

const Dl = styled.dl`
  display: flex;
  align-items: baseline;
  font-size: 13px;
  margin-top: 10px;
  > dt {
    width: 20%;
    color: #888;
  }
  > dd {
    width: 78%;
    color: #111;
    line-height: 1.5;
  }
`

const Price = styled.strong`
  display: block;
  text-align: right;
  font-weight: bold;
  font-size: 19px;
  margin: 10px 0 20px;
`

const TotalSum = styled.div`
  margin: 15px 0;
  text-align: right;
  color: #17c2bd;
  font-weight: bold;
  font-size: 19px;
  strong {
    margin-right: 15px;
    color: #222;
    font-size: 14px;
  }
`

const BasketButton = styled.button`
  width: 100%;
  padding: 10px 0;
  margin: 10px 0;
  background: #17c2bd;
  color: #fff;
  font-size: 15px;
  text-align: center;
`


const ProductInfoWrap = ({title, description, salePrice, deliveryData}) => {
  const [amount, setAmount] = useState(salePrice);
  const numberComma = (number) => number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  const handleAmount = (length) => {
    setAmount(salePrice * length);
  }

  const handleBasket = () => {
    
  }
  return (
    <Wrap>
      <Title>{title}</Title>
      <Description>{description}</Description>
      {deliveryData.map(data => <Dl key={data.id}><dt>{data.title}</dt><dd>{data.info}{data.title === '적립금' ? '원' : ''}</dd></Dl>)}
      <Price>{numberComma(salePrice)}원</Price>
      <Amount salePrice={salePrice} click={handleAmount} />
      <TotalSum><strong>총 상품금액</strong>{numberComma(amount)}원</TotalSum>
      <BasketButton type="button" onClick={handleBasket}>담기</BasketButton>
    </Wrap>
  );
};

export default ProductInfoWrap;