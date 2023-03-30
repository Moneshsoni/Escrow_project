// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract Time{
    uint lastUpdated;

// Set `lastUpdated` to `now`
function updateTimestamp() public {
  lastUpdated = block.timestamp;
}

// Will return `true` if 5 minutes have passed since `updateTimestamp` was 
// called, `false` if 5 minutes have not passed
function fiveMinutesHavePassed() public view returns (bool) {
  return (lastUpdated >= (lastUpdated + 5 minutes));
}
}