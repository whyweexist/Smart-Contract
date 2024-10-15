// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WhisperCash {
    // 1. Create your own Actions
    enum WhisperCashAction { On, Off }

    // 2. Create your own Events
    event WhisperCashEvent(WhisperCashAction action);

    // 3. Create your own Struct
    struct User {
        address actorId;
        string name;
    }

    struct IoWhisperCashState {
        string currentState;
        User[] allUsers;
    }

    // State variable to hold the contract state
    IoWhisperCashState public state;

    // Constructor to initialize the state
    constructor() {
        state.currentState = "";
    }

    // Function to handle actions
    function handleAction(WhisperCashAction action) external {
        if (action == WhisperCashAction.On) {
            state.currentState = "On";
            emit WhisperCashEvent(action);
        } else if (action == WhisperCashAction.Off) {
            state.currentState = "Off";
            emit WhisperCashEvent(action);
        }
    }

    // Function to add a user
    function addUser(string calldata name) external {
        state.allUsers.push(User({ actorId: msg.sender, name: name }));
    }

    // Function to get the current state
    function getCurrentState() external view returns (string memory) {
        return state.currentState;
    }

    // Function to get all users
    function getAllUsers() external view returns (User[] memory) {
        return state.allUsers;
    }
}

