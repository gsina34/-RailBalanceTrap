// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

interface ITrap {
    function collect() external returns (bytes memory);
    function shouldRespond(bytes[] calldata data) external view returns (bool, bytes memory);
}

contract RailBalanceTrap is ITrap {
    // Rail’s monitoring address
    address public constant railTarget = 0x8780e58Bf21D679b13a4fE6a0DD2a9887185cEf2;
    uint256 public constant thresholdPercent = 1;

    function collect() external override returns (bytes memory) {
        return abi.encode(railTarget.balance);
    }

    function shouldRespond(bytes[] calldata data) external view override returns (bool, bytes memory) {
        if (data.length < 2) return (false, "Insufficient data");

        uint256 current = abi.decode(data[0], (uint256));
        uint256 previous = abi.decode(data[1], (uint256));

        uint256 diff = current > previous ? current - previous : previous - current;
        uint256 percent = (diff * 100) / previous;

        if (percent >= thresholdPercent) {
            return (true, "");
        }

        return (false, "");
    }
}
