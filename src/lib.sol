// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WhisperCash {
    // 1. Create your own Actions
    enum WhisperCashAction { On, Off }

    // 2. Create your own Events
    event WhisperCashEvent(WhisperCashAction action);

    // 3. Create the main state struct
    struct User {
        address actorId;
        string name;
    }

    struct IoWhisperCashState {
        string currentState;
        mapping(address => string) allUsers; // Using a mapping to represent HashMap
    }

    IoWhisperCashState public state;

    // Constructor to initialize the state
    constructor() {
        state.currentState = "";
    }

    // 4. Create the main function to handle actions
    function main(WhisperCashAction action) external {
        if (action == WhisperCashAction.On) {
            state.currentState = "On";
            state.allUsers[msg.sender] = "On"; // Store user action
            emit WhisperCashEvent(action);
        } else if (action == WhisperCashAction.Off) {
            state.currentState = "Off";
            state.allUsers[msg.sender] = "Off"; // Store user action
            emit WhisperCashEvent(action);
        }
    }

    // 5. Function to get the current state
    function getCurrentState() external view returns (string memory) {
        return state.currentState;
    }

    // Function to get user action by address
    function getUserAction(address user) external view returns (string memory) {
        return state.allUsers[user];
    }
}

