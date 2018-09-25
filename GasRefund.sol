pragma solidity ^0.4.25;

contract GasRefund {

  event DidSomething();

  modifier gasRefund {
    // record start gas
    uint startGas = gasleft();
    // do function
    _;
    // send gas difference at gas price + overhead of gas refund
    msg.sender.transfer(tx.gasprice * (startGas - gasleft()) + 28893);
  }

  function doSomething() external payable gasRefund {
    emit DidSomething();
  }

}
