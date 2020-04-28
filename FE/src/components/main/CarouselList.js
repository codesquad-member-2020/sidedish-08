import React, { Fragment, useState } from 'react';
import styled from 'styled-components';
import Modal from '../detail/Modal';

const Anchor = styled.a`
  display: block;
  margin: 0 15px;
  &:hover {
    .delivery-type {
      visibility: visible;
    }
  }
`

const ImgWrap = styled.div`
  position: relative;
`;

const Img = styled.img`
  border-radius: 50%;
`

const InfoWrap = styled.div`
  padding: 10px;
  text-align: center;
`

const Title = styled.strong`
  display: block;
  padding: 15px 0 10px;
  font-size: 16px;
  font-weight: bold;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
`

const Description = styled.p`
  font-size: 13px;
  color: #888;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
`

const Price = styled.span`
  display: block;
  margin: 20px 0 15px;
  color: #17c2bd;
  font-size: 22px;
  font-weight: bold;
  .before-price {
    display: inline-block;
    margin: 0 10px;
    text-decoration: line-through;
    font-size: 14px;
    color: #999;
    font-weight: normal;
  }
  &:after {
    display: inline;
    font-size: 16px;
    font-weight: noraml;
    content: "원"
  }
`

const DeliveryType = styled.div`
  visibility: hidden;
  position: absolute;
  display: flex;
  width: 100%;
  height: 100%;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  top: 0;
  left: 0;
  border-radius: 50%;
  background: rgba(0, 0, 0, 0.7);
  color: #fff;
  > div {
    border-top: 1px solid rgba(255, 255, 255, 0.5);
    padding-top: 10px;
    margin-top: 10px;
    font-weight: bold;
    font-size: 15px;
    &:first-child {
      border-top: 0;
      padding: 0;
      margin: 0;
    }
  }
`

const Badge = styled.span`
  display: inline-block;
  font-size: 13px;
  padding: 5px;
  background: #c6a8a5;
  color: #fff;
  margin: 0 5px;
`;

const CarouselList = ({dishType, menu, click}) => {
  const numberComma = (number) => number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  const normalPrice = numberComma(menu.normalPrice);
  const salePrice = numberComma(menu.salePrice);
  const isBadgeSize = menu.badge.length ? true : false;
  return (
    <Fragment>
      <Anchor href={menu.hash} data-hash={menu.hash} data-title={menu.title} onClick={(e) => click(e, dishType)}>
        <ImgWrap className="img">
          <Img src={menu.image} alt={menu.alt} />
          <DeliveryType className="delivery-type">
            {menu.deliveryType.map((deliveryType) => <div key={deliveryType}>{deliveryType}</div>)}
          </DeliveryType>
        </ImgWrap>
        <InfoWrap>
          <Title>{menu.title}</Title>
          <Description>{menu.description}</Description>
          {!isBadgeSize ? <Price>{normalPrice}</Price> : <Price><span className="before-price">{normalPrice}</span>{salePrice}</Price>}
          {isBadgeSize && menu.badge.map((badge, idx) => <Badge key={idx}>{badge}</Badge>)}
        </InfoWrap>
      </Anchor>
    </Fragment>
  );
};

export default CarouselList;
