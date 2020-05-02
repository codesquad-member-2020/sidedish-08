import React, { useState } from 'react';
import styled from 'styled-components';

const AmountWrap = styled.dl`
  display: flex;
  height: 50px;
  justify-content: space-between;
  align-items: center;
  padding: 10px 0;
  margin: 10px 0;
  border-top: 1px solid #ddd;
  border-bottom: 1px solid #ddd;
  font-size: 13px;
  color: #333;
  > dd {
    display: flex;
    width: 100px;
    height: 100%;
    border: 1px solid #eee;
    input {
      width: 80%;
      text-align: center;
      color: #888;
      border-right: 1px solid #eee;
    }
    div {
      width: 20%;
      height: 100%;
    }
  }
`

const Button = styled.button`
  position: relative;
  width: 100%;
  height: 50%;
  .blind {
    position: absolute;
    top: 0;
    left: -9999px;
    text-indent: -9999px;
    font-size: 0px;
    line-height: 0px;
  }
  &:first-child {
    border-bottom: 1px solid #eee;
  }
  &:before {
    position: absolute;
    left: 50%;
    top: 50%;
    margin: -2.5px 0 0 -2.5px;
    width: 3px;
    height: 3px;
    border-top: 2px solid #999;
    border-left: 2px solid #999;
    transform: rotate(${props => `${props.rotate}deg`});
    content: ""
  }
`

const Amount = ({click}) => {
  const [length, setLength] = useState(1);
  const handlePlusTotalLength = () => {
    setLength(length + 1);
    click(length + 1);
  }
  const handleMinusTotalLength = () => {
    if(length <= 1) return;
    setLength(length - 1);
    click(length - 1);
  }
  return (
    <AmountWrap>
      <dt>수량</dt>
      <dd>
        <input type="text" disabled value={length} />
        <div>
          <Button type="button" onClick={handlePlusTotalLength} rotate={45}><span className="blind">더하기</span></Button>
          <Button type="button" onClick={handleMinusTotalLength} rotate={-135}><span className="blind">빼기</span></Button>
        </div>
      </dd>
    </AmountWrap>
  );
};

export default Amount;