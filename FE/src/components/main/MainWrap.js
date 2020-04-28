import React, { useState } from 'react';
import Carousel from './Carousel';
import styled from 'styled-components';
import Modal from '../detail/Modal';

const Main = styled.div`
  max-width: 980px;
  margin: 0 auto 30px;
`;

const H2 = styled.h2`
  font-size: 34px;
  text-align: center;
  color: '#000';
  margin-bottom: 30px;
  font-weight: 300;
  color: #111;
  > span {
    display: block;
    font-size: 18px;
    font-weight: normal;
    color: #999;
    margin: 50px 0 10px;
  }
`;

const Button = styled.button`
  display: flex;
  width: 100%;
  height: 40px;
  align-items: center;
  justify-content: center;
  color: #888;
  margin: 30px auto 0;
  border: 1px solid #ccc;
  cursor: pointer;
  font-size: 13px;
  &:hover {
    border-color: #17c2bd;
    color: #17c2bd;
  }
`

const MainWrap = () => {
  const [visible, setVisible] = useState(false);
  const [targetData, setTargetData] = useState(null);
  const [isShowModal, setShowModal] = useState(false);
  const handleViewDish = (e) => {
    setVisible(true);
    e.target.style.display = 'none';
  }
  const handleModal = (e, dishType) => {
    e.preventDefault();
    setShowModal(true);
    const hash = e.currentTarget.dataset.hash;
    const title = e.currentTarget.dataset.title;
    setTargetData({hash, title, dishType});
  }

  const showModal = () => {
    setShowModal(!isShowModal);
  }
  return (
    <Main>
      <H2><span>메인반찬</span>담기만 하면 완성되는 메인반찬</H2>
      <Carousel key="main" dishType="main" url={process.env.REACT_APP_MOCK_MAIN_URL} click={handleModal} />
      <H2><span>국·찌개</span>김이 모락모락 국, 찌개</H2>
      <Carousel key="soup" dishType="soup" url={process.env.REACT_APP_MOCK_SOUP_URL} click={handleModal} />
      <Button type="button" onClick={handleViewDish}>반찬 전체보기</Button>
      {visible && <H2><span>밑반찬</span>언제 먹어도 든든한 반찬</H2>}
      {visible && <Carousel key="side" dishType="side" url={process.env.REACT_APP_MOCK_SIDE_URL} click={handleModal} />}
      {isShowModal && <Modal data={targetData} isShow={showModal} />}
    </Main>
  );
};

export default MainWrap;
