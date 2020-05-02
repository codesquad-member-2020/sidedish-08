import React, {useState} from 'react';
import styled from 'styled-components';

const LnbA = styled.a`
  display: flex;
  align-items: center;
  height: 100%;
  padding: 0 10px;
  font-weight: bold;
  &:hover {
    color: #17c2bd;
  }
`;

const Info = styled.div`
  width: 100%;
  padding: 15px;
  text-align: center;
  background: #17c2bd;
  color: #fff;
`

const UserInfoWrap = ({userName}) => {
  const [userInfo, setUserInfo] = useState(false);
  const handleUserInfo = () => {
    setUserInfo(!userInfo);
  }
  const infoWrap = <Info><a href="#none">logout</a></Info>;
  return (
    <li key='user'><LnbA href="#none" onClick={handleUserInfo} data-key='user'>{userName}</LnbA>{userInfo && infoWrap}</li>
  );
};

export default UserInfoWrap;
