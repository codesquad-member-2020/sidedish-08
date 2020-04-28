import React, { useState } from 'react';
import Slider from "react-slick";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import CarouselList from './CarouselList';
import useFetch from '../useFetch';
import styled from 'styled-components';

const NextArrow = styled.div`
  width: 30px;
  height: 30px;
  top: 30%;
  right: -50px;
  border-right: 3px solid #aaa;
  border-top: 3px solid #aaa;
  transform: rotate(45deg);
  &:before {
    content: ''
  }
  &:hover {
    opacity: 0.5;
  }
`

const PrevArrow = styled.div`
  width: 30px;
  height: 30px;
  top: 30%;
  left: -50px;
  border-left: 3px solid #aaa;
  border-top: 3px solid #aaa;
  transform: rotate(-45deg);
  &:before {
    content: ''
  }
  &:hover {
    opacity: 0.5;
  }
`

const SampleNextArrow = (props) => {
  const { className, onClick } = props;
  return (
    <NextArrow
      className={className}
      onClick={onClick}
    />
  );
}

const SamplePrevArrow = (props) => {
  const { className, onClick } = props;
  return (
    <PrevArrow
      className={className}
      onClick={onClick}
    />
  );
}

const Carousel = ({dishType, url, click}) => {
  const [menuLists, setMenuLists] = useState([]);
  const loading = useFetch(setMenuLists, url, 'initial');

  const setting = {
    dots: false,
    infinite: true,
    speed: 500,
    slidesToShow: 4,
    slidesToScroll: 4,
    nextArrow: <SampleNextArrow />,
    prevArrow: <SamplePrevArrow />
  }
  return (
    <div className='carousel'>
      <Slider {...setting}>
        {menuLists.map((menu) => <CarouselList dishType={dishType} key={menu.hash} menu={menu} click={click} />)}
      </Slider>
    </div>
  );
};

export default Carousel;